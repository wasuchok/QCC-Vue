import { reactive, computed } from 'vue'
import axios from 'axios'

const DEFAULT_BASE_URL =
  (typeof import.meta !== 'undefined' && import.meta.env && import.meta.env.VITE_STRAPI_BASE_URL) ||
  'http://10.17.2.33:1338'

const API_ENDPOINT = `${DEFAULT_BASE_URL.replace(/\/$/, '')}/api/departments?populate=*`
const CACHE_TTL = 1000 * 60 * 5 // 5 minutes

export const TEAM_GROUP_TYPE_LABELS = {
  Non: 'Non Production',
  Pro: 'Production',
  Sup: 'Support',
}

export const FALLBACK_DEPARTMENTS = [
  {
    code: 'QC1',
    nameTh: 'QC1',
    nameEn: '',
    displayName: 'QC1',
    sortName: 'qc1',
    groupType: 'QCC',
    groupTypeCode: 'QCC',
    teams: [
      { code: 'QC1-A', displayName: 'QC1 Team A', groupType: 'Production', groupTypeCode: 'Pro' },
      { code: 'QC1-B', displayName: 'QC1 Team B', groupType: 'Production', groupTypeCode: 'Pro' },
    ],
  },
  {
    code: 'QC2',
    nameTh: 'QC2',
    nameEn: '',
    displayName: 'QC2',
    sortName: 'qc2',
    groupType: 'QCC',
    groupTypeCode: 'QCC',
    teams: [
      { code: 'QC2-A', displayName: 'QC2 Team A', groupType: 'Production', groupTypeCode: 'Pro' },
    ],
  },
  {
    code: 'HR',
    nameTh: 'HR',
    nameEn: 'Human Resources',
    displayName: 'HR',
    sortName: 'hr',
    groupType: 'Office',
    groupTypeCode: 'Office',
    teams: [
      { code: 'HRD-C01', displayName: 'HRD Core', groupType: 'Non Production', groupTypeCode: 'Non' },
    ],
  },
]

const state = reactive({
  list: [],
  loading: false,
  error: '',
  lastFetched: 0,
})

const departments = computed(() =>
  state.list.length ? state.list : sortDepartments(FALLBACK_DEPARTMENTS)
)
const hasRemoteData = computed(() => state.list.length > 0)
const loading = computed(() => state.loading)
const error = computed(() => state.error)

function sortDepartments(list = []) {
  return [...list].sort((a, b) => {
    const nameA = (a.sortName || a.displayName || '').toLocaleLowerCase('th')
    const nameB = (b.sortName || b.displayName || '').toLocaleLowerCase('th')
    return nameA.localeCompare(nameB, 'th')
  })
}

function setDepartments(entries = []) {
  const sorted = sortDepartments(entries)
  state.list.splice(0, state.list.length, ...sorted)
  state.lastFetched = Date.now()
}

function pickFirst(source, paths = []) {
  for (const path of paths) {
    if (!path) continue
    const value = path.split('.').reduce((acc, key) => (acc == null ? acc : acc[key]), source)
    if (value === undefined || value === null) continue
    if (typeof value === 'string') {
      const trimmed = value.trim()
      if (trimmed) return trimmed
    } else if (typeof value === 'number') {
      return String(value)
    } else if (typeof value === 'object') {
      const nested = pickFirst(value, ['code', 'name', 'title', 'label'])
      if (nested) return nested
    }
  }
  return ''
}

function normaliseTeam(entry = {}, departmentCode = '', departmentName = '') {
  const attributes = entry.attributes || entry
  const code =
    pickFirst(attributes, [
      'code',
      'teamCode',
      'team_code',
      'name',
      'abbr',
      'short_code',
      'slug',
    ]) || String(entry.id ?? attributes.id ?? '')

  if (!code) return null

  const nameTh = pickFirst(attributes, [
    'name_th',
    'nameTh',
    'thai_name',
    'thaiName',
    'title_th',
    'titleTh',
    'name',
  ])
  const nameEn = pickFirst(attributes, [
    'name_en',
    'nameEn',
    'english_name',
    'englishName',
    'title_en',
    'titleEn',
  ])

  const groupTypeCode = pickFirst(attributes, [
    'type_group',
    'typeGroup',
    'groupType',
    'group_type',
  ]) || ''
  const groupType = TEAM_GROUP_TYPE_LABELS[groupTypeCode] || attributes.groupTypeLabel || attributes.groupType || 'Auto'

  const displayName = (nameTh || nameEn || code).trim()
  const sortName = displayName.toLocaleLowerCase('th')

  return {
    id: entry.id ?? attributes.id ?? code,
    code: String(code),
    nameTh: nameTh || '',
    nameEn: nameEn || '',
    displayName,
    sortName,
    groupType,
    groupTypeCode,
    departmentCode,
    departmentName,
    raw: entry,
  }
}

function normaliseDepartment(entry = {}) {
  const attributes = entry.attributes || entry
  const code =
    pickFirst(attributes, [
      'code',
      'deptCode',
      'departmentCode',
      'abbr',
      'short_code',
      'shortName',
      'slug',
    ]) || String(entry.id ?? attributes.id ?? '')

  if (!code) return null

  const nameTh = pickFirst(attributes, [
    'name_th',
    'nameTh',
    'thai_name',
    'thaiName',
    'title_th',
    'titleTh',
    'name',
  ])
  const nameEn = pickFirst(attributes, [
    'name_en',
    'nameEn',
    'english_name',
    'englishName',
    'title_en',
    'titleEn',
  ])

  const rawGroup =
    attributes.group_type ||
    attributes.groupType ||
    attributes.activity_type ||
    attributes.activityType ||
    attributes.type
  const groupTypeValue =
    pickFirst(
      rawGroup && typeof rawGroup === 'object'
        ? { ...rawGroup, data: rawGroup.data }
        : { value: rawGroup },
      ['data.attributes.code', 'data.attributes.name', 'data.attributes.title', 'value']
    ) || ''
  const groupTypeCode =
    pickFirst(attributes, ['group_type_code', 'groupTypeCode', 'activityTypeCode']) ||
    groupTypeValue ||
    ''
  const groupTypeLabel = TEAM_GROUP_TYPE_LABELS[groupTypeCode] || groupTypeValue || 'Auto'

  const parentCode = pickFirst(attributes, [
    'parent_code',
    'parentCode',
    'parent.data.attributes.code',
  ])

  const baseName = (nameTh || nameEn || '').trim()
  const fallbackCode = String(code).trim()
  const displayName = baseName || fallbackCode
  let finalCode = fallbackCode
  if (/^\d+$/.test(finalCode) && displayName) {
    finalCode = displayName
  }
  const sortName = displayName.toLocaleLowerCase('th')
  const teams = Array.isArray(attributes.teams?.data)
    ? attributes.teams.data.map(item => normaliseTeam(item, finalCode, displayName)).filter(Boolean)
    : Array.isArray(attributes.teams)
      ? attributes.teams.map(item => normaliseTeam(item, finalCode, displayName)).filter(Boolean)
      : []

  return {
    id: entry.id ?? attributes.id ?? finalCode,
    code: finalCode,
    codeOriginal: fallbackCode,
    nameTh: nameTh || '',
    nameEn: nameEn || '',
    displayName,
    sortName,
    groupType: groupTypeLabel || 'Auto',
    groupTypeCode,
    parentCode: parentCode || '',
    teams,
    raw: entry,
  }
}

async function fetchDepartments({ force = false } = {}) {
  if (state.loading) return
  const now = Date.now()
  if (!force && state.list.length && now - state.lastFetched < CACHE_TTL) return

  state.loading = true
  state.error = ''
  try {
    const response = await axios.get(API_ENDPOINT, { timeout: 12000 })
    const payload = response?.data
    const rawList = Array.isArray(payload?.data) ? payload.data : Array.isArray(payload) ? payload : []
    const normalised = rawList.map(normaliseDepartment).filter(item => item && item.code)
    if (normalised.length) {
      setDepartments(normalised)
    }
  } catch (err) {
    state.error = err?.message || 'Failed to load departments'
    throw err
  } finally {
    state.loading = false
  }
}

function findByCode(code) {
  if (!code) return null
  const normalized = String(code).trim()
  console.log("Sdasdasdasdasdasdasd", normalized)
  console.log("Sadasd", departments.value.find(dep => dep.code == normalized))
  return (
    departments.value.find(dep => dep.code == normalized) ||
    departments.value.find(dep => dep.codeOriginal == normalized) ||
    null
  )
}

function findTeams(code) {
  if (!code) return []
  const dep = findByCode(code)
  return dep?.teams ? [...dep.teams] : []
}

export function useDepartments() {
  return {
    state,
    departments,
    hasRemoteData,
    loading,
    error,
    fetchDepartments,
    setDepartments,
    findByCode,
    findTeams,
  }
}
