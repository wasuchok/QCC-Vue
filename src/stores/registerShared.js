import { reactive } from 'vue'

const STORAGE_KEY = 'qcc.shared.register.v1'

function normalizeAdvisor(input = {}, index = 0) {
  return {
    uid: input.uid || `advisor-${Date.now()}-${index}`,
    id: input.id || '',
    name: input.name || '',
    dept: input.dept || '',
  }
}

function normalizeManager(input = {}) {
  return {
    id: input.id || '',
    name: input.name || '',
    dept: input.dept || '',
  }
}

function normalizeMember(input = {}, index = 0) {
  return {
    uid: input.uid || `member-${Date.now()}-${index}`,
    empId: input.empId || '',
    name: input.name || '',
    position: input.position || '',
  }
}

function toPlain() {
  const department = shared.department || ''
  const team = shared.team || ''
  return {
    registerDate: shared.registerDate,
    groupNo: shared.groupNo,
    department,
    departmentName: shared.departmentName,
    team,
    teamName: shared.teamName,
    groupType: shared.groupType,
    groupName: shared.groupName,
    motto: shared.motto,
    logoUrl: shared.logoUrl,
    approved: shared.approved,
    advisors: shared.advisors.map(a => ({ ...a })),
    manager: { ...shared.manager },
    members: shared.members.map(m => ({ ...m })),
    lastUpdated: shared.lastUpdated,
  }
}

function persist() {
  if (typeof window === 'undefined' || !window.localStorage) return
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(toPlain()))
  } catch (err) {
    console.warn('Persist shared register failed:', err)
  }
}

function applyShared(payload = {}, opts = {}) {
  const { skipPersist = false, skipStamp = false } = opts
  if (Object.prototype.hasOwnProperty.call(payload, 'registerDate')) {
    shared.registerDate = payload.registerDate || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'groupNo')) {
    shared.groupNo = payload.groupNo || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'department')) {
    shared.department = payload.department || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'team')) {
    shared.team = payload.team || ''
    if (!Object.prototype.hasOwnProperty.call(payload, 'department') && !shared.department) {
      shared.department = shared.team || ''
    }
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'departmentName')) {
    shared.departmentName = payload.departmentName || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'teamName')) {
    shared.teamName = payload.teamName || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'groupType')) {
    shared.groupType = payload.groupType || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'groupName')) {
    shared.groupName = payload.groupName || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'motto')) {
    shared.motto = payload.motto || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'logoUrl')) {
    shared.logoUrl = payload.logoUrl || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'approved')) {
    shared.approved = Boolean(payload.approved)
  }
  if (Array.isArray(payload.advisors)) {
    shared.advisors.splice(0, shared.advisors.length, ...payload.advisors.map(normalizeAdvisor))
  }
  if (payload.manager) {
    Object.assign(shared.manager, normalizeManager(payload.manager))
  }
  if (Array.isArray(payload.members)) {
    shared.members.splice(0, shared.members.length, ...payload.members.map(normalizeMember))
  }
  if (!skipStamp) {
    shared.lastUpdated = Date.now()
  }
  if (!skipPersist) {
    persist()
  }
}

function hydrate() {
  if (hydrated) return
  hydrated = true
  if (typeof window === 'undefined' || !window.localStorage) return
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY)
    if (!raw) return
    const parsed = JSON.parse(raw)
    applyShared(parsed, { skipPersist: true, skipStamp: true })
    shared.lastUpdated = Date.now()
  } catch (err) {
    console.warn('Hydrate shared register failed:', err)
  }
}

export function updateRegisterShared(payload) {
  hydrate()
  applyShared(payload)
}

export function resetRegisterShared() {
  shared.registerDate = ''
  shared.groupNo = ''
  shared.department = ''
  shared.departmentName = ''
  shared.team = ''
  shared.teamName = ''
  shared.groupType = ''
  shared.groupName = ''
  shared.motto = ''
  shared.logoUrl = ''
  shared.approved = false
  shared.advisors.splice(0, shared.advisors.length)
  shared.manager.id = ''
  shared.manager.name = ''
  shared.manager.dept = ''
  shared.members.splice(0, shared.members.length)
  shared.lastUpdated = Date.now()
  persist()
}

export function useRegisterShared() {
  hydrate()
  return shared
}

export function getRegisterSharedSnapshot() {
  hydrate()
  return toPlain()
}

let hydrated = false
const shared = reactive({
  registerDate: '',
  groupNo: '',
  department: '',
  departmentName: '',
  team: '',
  teamName: '',
  groupType: '',
  groupName: '',
  motto: '',
  logoUrl: '',
  approved: false,
  advisors: [],
  manager: normalizeManager(),
  members: [],
  lastUpdated: 0,
})
