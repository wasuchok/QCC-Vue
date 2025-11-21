<template>

  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar class="lg:sticky lg:top-6 flex-shrink-0" current-key="register-qcc" />
    <div id="s1_form" data-sub="จดทะเบียนทำกิจกรรม QCC"
      class="bg-[#f3fbfb] border-4 border-black rounded-xl p-4 flex-1">
      <div class="text-center text-[28px] font-extrabold my-1.5">
        ใบจดทะเบียนจัดตั้งกลุ่มกิจกรรม <b>QCC</b>
      </div>

      <!-- ================= GRID หลัก ================= -->
      <div class="grid gap-3 items-center" :class="gridCols">
        <div class="label">วันที่ลงทะเบียน</div>
        <input v-model="state.s1_date" type="date" class="ctrl" :disabled="ui.disabled" />

        <div class="label col-start-4 justify-self-end max-[1200px]:col-start-1 max-[1200px]:col-span-1">
          เลขที่ทะเบียนกลุ่ม</div>
        <div class="auto col-start-5 max-[1200px]:col-start-2 max-[1200px]:col-span-1">{{ state.s1_groupNo || 'Auto' }}
        </div>

        <div class="label">ฝ่าย / Department</div>
        <select v-model="state.s1_department" @change="onDepartmentChange" class="ctrl" :disabled="ui.disabled">
          <option value="">— เลือกฝ่าย —</option>
          <option v-for="dept in departmentOptions" :key="dept.id" :value="dept.name">
            {{ dept.name }}
          </option>
        </select>

        <div class="label col-start-4 justify-self-end max-[1200px]:col-start-1 max-[1200px]:col-span-1">
          ประเภทกลุ่มที่ดำเนินกิจกรรม</div>
        <div class="auto col-start-5 max-[1200px]:col-start-2 max-[1200px]:col-span-1">{{ state.s1_groupType || 'Auto'
          }}</div>

        <div class="label">ทีม</div>
        <select v-model="state.s1_team" class="ctrl" :disabled="ui.disabled || !state.s1_department">
          <option value="">
            {{ state.s1_department ? '— เลือกทีม —' : 'เลือกฝ่ายก่อน' }}
          </option>
          <option v-for="team in teamOptions" :key="team.id" :value="team.name">
            {{ team.name }}
          </option>
        </select>

        <div class="label col-start-1">ชื่อกลุ่ม</div>
        <input v-model="state.s1_groupName" class="ctrl col-span-4 max-[1200px]:col-span-1 w-full"
          :disabled="ui.disabled" />

        <div class="col-span-full">
          <div class="flex flex-col sm:flex-row items-start sm:items-center gap-2 w-full">
            <label class="label">
              คำขวัญกลุ่ม
            </label>
            <input v-model="state.s1_motto" placeholder="พิมพ์คำขวัญกลุ่ม..."
              class="flex-1 w-full min-w-[360px] max-w-[760px] max-[640px]:min-w-0 px-3 py-2 border-2 border-gray-300 rounded-xl focus:border-indigo-500 focus:ring focus:ring-indigo-100 outline-none transition-all bg-white disabled:bg-gray-100"
              :disabled="ui.disabled" />
          </div>
        </div>

        <div class="col-span-full grid gap-3 w-full max-[1200px]:grid-cols-1 grid-cols-2">
          <div class="empSection">
            <div class="flex items-center gap-2">
              <div class="label flex-1 text-center sm:text-left">ที่ปรึกษา</div>
              <button class="btn bg-[#eef2ff] text-sm py-1 px-3" @click="addAdvisor"
                :disabled="ui.disabled || state.advisors.length >= MAX_ADVISORS">
                เพิ่มที่ปรึกษา +
              </button>
            </div>
            <div class="space-y-2.5 mt-2">
              <div v-for="(advisor, idx) in state.advisors" :key="advisor.uid" class="advisorRowSingle">
                <div class="advisorSelect w-full">
                  <select v-model="advisor.id" class="ctrl h-10" :disabled="ui.disabled || !state.s1_department"
                    @change="onAdvisorSelect(idx)">
                    <option value="">{{ state.s1_department ? '— เลือกที่ปรึกษา —' : 'เลือกฝ่ายก่อน' }}</option>
                    <option v-for="candidate in advisorCandidates" :key="candidate.id" :value="candidate.employee_code"
                      :disabled="isAdvisorTaken(candidate.employee_code, idx)">
                      {{ candidate.full_name }} ({{ candidate.position }})
                    </option>
                  </select>
                </div>
                <button class="btn bg-[#ffecec] text-sm h-10 px-3 max-[900px]:w-full" @click="removeAdvisor(idx)"
                  :disabled="ui.disabled || state.advisors.length <= MIN_ADVISORS">
                  ลบ
                </button>
              </div>
            </div>
          </div>
          <div class="empSection">
            <div class="label w-full text-center sm:text-left">ผู้จัดการทีม SV,TM</div>
            <div class="advisorRowSingle mt-2">
              <div class="advisorSelect w-full">
                <select v-model="state.manager.id" class="ctrl h-10" :disabled="ui.disabled || !state.s1_department">
                  <option value="">{{ state.s1_department ? '— เลือกผู้จัดการ —' : 'เลือกฝ่ายก่อน' }}</option>
                  <option v-for="candidate in managerCandidates" :key="candidate.id" :value="candidate.employee_code">
                    {{ candidate.full_name }} ({{ candidate.position }})
                  </option>
                </select>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="grid gap-2.5 mt-3" :class="twoCols">
        <div class="panel">
          <div class="font-bold mb-1.5">ลักษณะงานประจำกลุ่ม</div>
          <textarea v-model="state.s1_desc" placeholder="กรอกรายละเอียด" class="ctrl w-full min-h-[140px]"
            :disabled="ui.disabled"></textarea>
        </div>

        <div class="panel grid grid-rows-[1fr_auto] gap-2.5">
          <div class="flex items-center justify-center min-h-[140px]">
            <div v-if="!ui.logoPreviewUrl" class="text-4xl text-gray-500">LOGO</div>
            <img v-else :src="ui.logoPreviewUrl" alt="logo" class="max-w-full max-h-[160px]" />
          </div>
          <label class="btn bg-[#eafaf3] text-center cursor-pointer">
            📎 คลิกเพื่อแนบรูปโลโก
            <input type="file" accept="image/*" class="hidden" :disabled="ui.disabled" @change="onLogoChange" />
          </label>
        </div>
      </div>

      <div class="panel mt-3">
        <div class="overflow-auto">
          <table class="w-full border-collapse">
            <thead>
              <tr>
                <th class="th">ลำดับ</th>
                <th class="th">รหัสพนักงาน</th>
                <th class="th">ชื่อ-สกุล</th>
                <th class="th">ตำแหน่ง</th>
                <th class="th"></th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(m, idx) in state.members" :key="m.uid">
                <td class="td text-center">{{ idx + 1 }}</td>
                <td class="td">
                  <input v-model="m.empId" placeholder="รหัส" class="cell"
                    :disabled="ui.disabled || !state.s1_department || !state.s1_team" @blur="fillMember(idx)"
                    @keydown.enter.prevent="fillMember(idx)" />
                </td>
                <td class="td"><input v-model="m.name" readonly placeholder="(Auto)" class="cell bg-gray-50"
                    :disabled="ui.disabled || !state.s1_department || !state.s1_team" /></td>
                <td class="td">
                  <input v-model="m.position" readonly :disabled="ui.disabled || !state.s1_department || !state.s1_team"
                    :class="['cell bg-gray-50', idx < ROLE_LABELS.length ? 'font-semibold' : '']" />
                </td>

                <td class="td w-[72px]">
                  <button class="btn bg-[#ffecec]" @click="removeMember(idx)"
                    :disabled="ui.disabled || state.members.length <= MIN_MEMBERS">ลบ</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="mt-2 flex gap-2 items-center">
          <button class="btn bg-[#eef2ff]" @click="addMemberRow"
            :disabled="ui.disabled || !state.s1_department || !state.s1_team || state.members.length >= MAX_MEMBERS">เพิ่มสมาชิก
            +</button>
          <span class="text-gray-500">* 1=หัวหน้า, 2=รองหัวหน้า, 3=เลขาฯ, ที่เหลือ=สมาชิก</span>
        </div>
      </div>

      <div class="flex gap-2 justify-end mt-3 items-center">
        <RouterLink to="/">
          <button class="btn bg-yellow-100 hover:bg-yellow-200">ย้อนกลับหน้าหลัก</button>
        </RouterLink>
        <button class="btn bg-white" @click="setDisabled(false)">แก้ไข</button>
        <button class="btn bg-[#eafaf3]" @click="saveS1" :disabled="ui.saving">
          {{ ui.saving ? 'กำลังบันทึก…' : '💾 บันทึก' }}
        </button>
        <button class="btn bg-[#eafaf3]" @click="goNext">⏭️ ถัดไป</button>
      </div>

      <div class="text-gray-500 mt-1.5">{{ ui.saveMsg }}</div>
    </div>
  </div>
</template>

<script setup>
import StepSidebar from '@/components/StepSidebar.vue'
import { fetchApiPublic } from '@/utils/apiPublic'
import Swal from 'sweetalert2'
import { onBeforeUnmount, onMounted, reactive, ref, watch } from 'vue'
import { RouterLink, useRouter } from 'vue-router'

const DEFAULT_MEMBER_ROWS = 4
const MAX_MEMBERS = 10
const MIN_MEMBERS = 2
const ROLE_LABELS = ['หัวหน้า', 'รองหัวหน้า', 'เลขา']
const MAX_ADVISORS = 2
const MIN_ADVISORS = 1
const MEMBER_ROLE_DEFAULT = 'สมาชิก'
const GROUP_NO_BASE = '2619001'
const STORAGE_KEY = 'qcc.register.form.v1'
const router = useRouter()

function getMemberRole(idx) {
  if (typeof idx !== 'number' || idx < 0) return MEMBER_ROLE_DEFAULT
  return ROLE_LABELS[idx] || MEMBER_ROLE_DEFAULT
}

function createEmptyMember(idx = 0) {
  return {
    uid: `member-${idx}-${Date.now()}-${Math.random().toString(36).slice(2, 6)}`,
    empId: '',
    name: '',
    position: getMemberRole(idx),
    age: '',
    tenure: '',
    education: '',
  }
}

function buildMemberRows(count = DEFAULT_MEMBER_ROWS) {
  return Array.from({ length: count }, (_, idx) => createEmptyMember(idx))
}

const state = reactive({
  s1_date: '',
  s1_groupNo: '',
  s1_department: '',
  s1_departmentName: '',
  s1_team: '',
  s1_teamName: '',
  s1_groupType: '',
  s1_groupName: '',
  s1_motto: '',
  advisors: [{ uid: 'advisor-1', id: '', name: '', dept: '', search: '' }],
  manager: { id: '', name: '', dept: '', search: '' },
  s1_desc: '',
  members: buildMemberRows(),
  logoFiles: [],
  logoDataUrl: '',
  logoFileName: '',
})

const ui = reactive({
  disabled: false,
  saving: false,
  saveMsg: '',
  logoPreviewUrl: '',
})

const departmentOptions = ref([])
const teamOptions = ref([])
const advisorCandidates = ref([])
const managerCandidates = ref([])
const gridCols = 'grid-cols-[220px_260px_minmax(0,1fr)_240px_200px] max-[1200px]:grid-cols-[220px_1fr]'
const twoCols = 'grid-cols-[1fr_360px] max-[1200px]:grid-cols-1'
const employeeLookupCache = new Map()
let logoObjectUrl = ''
let groupNoLocked = false
let hasHydrated = false
let departmentsReady = false

function syncMemberRoles() {
  state.members.forEach((member, idx) => {
    member.position = getMemberRole(idx)
  })
}

function showWarning(message) {
  Swal.fire({
    icon: 'warning',
    title: 'แจ้งเตือน',
    text: message,
    confirmButtonText: 'ตกลง',
  })
}

function resetMemberRows(desiredCount = state.members.length) {
  const target = Math.max(DEFAULT_MEMBER_ROWS, desiredCount || 0)
  const freshRows = buildMemberRows(target)
  state.members.splice(0, state.members.length, ...freshRows)
  syncMemberRoles()
}

function clearMemberRow(member, idx) {
  if (!member) return
  member.empId = ''
  member.name = ''
  member.position = getMemberRole(idx)
  member.age = ''
  member.tenure = ''
  member.education = ''
}

function setLogoPreview(file) {
  if (logoObjectUrl) {
    URL.revokeObjectURL(logoObjectUrl)
    logoObjectUrl = ''
  }
  if (!file) {
    ui.logoPreviewUrl = ''
    state.logoDataUrl = ''
    state.logoFileName = ''
    return
  }
  if (typeof file === 'string') {
    ui.logoPreviewUrl = file
  } else {
    logoObjectUrl = URL.createObjectURL(file)
    ui.logoPreviewUrl = logoObjectUrl
  }
}

function ensureGroupNo() {
  if (groupNoLocked || state.s1_groupNo) return
  state.s1_groupNo = GROUP_NO_BASE
  groupNoLocked = true
}

function persistForm() {
  if (!hasHydrated || typeof window === 'undefined' || !window.localStorage) return
  const payload = {
    ...state,
    advisors: state.advisors.map(a => ({ ...a })),
    manager: { ...state.manager },
    members: state.members.map(m => ({ ...m })),
    logoFiles: [],
  }
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(payload))
  } catch (err) {
    console.warn('Persist register form failed:', err)
  }
}

function hydrateForm() {
  if (typeof window === 'undefined' || !window.localStorage) {
    hasHydrated = true
    return
  }
  try {
    const saved = window.localStorage.getItem(STORAGE_KEY)
    if (!saved) return
    const data = JSON.parse(saved)
    Object.assign(state, {
      s1_date: data.s1_date || '',
      s1_groupNo: data.s1_groupNo || '',
      s1_department: data.s1_department || '',
      s1_departmentName: data.s1_departmentName || '',
      s1_team: data.s1_team || '',
      s1_teamName: data.s1_teamName || '',
      s1_groupType: data.s1_groupType || '',
      s1_groupName: data.s1_groupName || '',
      s1_motto: data.s1_motto || '',
      advisors: Array.isArray(data.advisors) ? data.advisors.map((a, idx) => ({ ...a, uid: a.uid || `advisor-${idx}` })) : state.advisors,
      manager: data.manager ? { ...state.manager, ...data.manager } : state.manager,
      s1_desc: data.s1_desc || '',
      members: Array.isArray(data.members) && data.members.length ? data.members.map((m, idx) => ({ ...m, uid: m.uid || `member-${idx}` })) : state.members,
      logoDataUrl: data.logoDataUrl || '',
      logoFileName: data.logoFileName || '',
    })
    if (state.logoDataUrl) {
      setLogoPreview(state.logoDataUrl)
    }
    if (departmentsReady && state.s1_department) {
      setTeamsForDepartment(false)
      updateGroupTypeFromTeam()
    }
  } catch (err) {
    console.warn('Hydrate register form failed:', err)
  } finally {
    hasHydrated = true
  }
}

async function fetchDepartmets() {
  const response = await fetchApiPublic('/departments?populate=teams')
  const records = response.data?.data || response.data || []
  departmentOptions.value = records
  teamOptions.value = []
  departmentsReady = true
  if (state.s1_department) {
    setTeamsForDepartment(false)
    updateGroupTypeFromTeam()
    fetchPositionAdvisor()
    fetchPositionManager()
  }
}

async function fetchPositionAdvisor() {
  if (!state.s1_department) {
    advisorCandidates.value = []
    return
  }
  const items = []
  let page = 1
  let pageCount = 1
  const basePath = `/employees?filters[department][$eq]=${state.s1_department}&filters[position][$in][0]=Junior&filters[position][$in][1]=Foreman&filters[position][$in][2]=Leader`
  while (page <= pageCount) {
    const response = await fetchApiPublic(`${basePath}&pagination[page]=${page}&pagination[pageSize]=25`)
    const data = response.data?.data || response.data || []
    items.push(...data)
    const pagination = response.meta?.pagination
    pageCount = pagination?.pageCount || page
    page += 1
  }
  advisorCandidates.value = items
}

async function fetchPositionManager() {
  if (!state.s1_department) {
    managerCandidates.value = []
    return
  }
  const items = []
  let page = 1
  let pageCount = 1
  const positions = [
    "Senior Expert",
    "Manager",
    "Supervisor",
    "Assistant Department Manager",
    "Senior Team Manager",
    "Team Manager"
  ];

  const basePath = `/employees?filters[department][$eq]=${state.s1_department}`
    + positions
      .map((p, i) => `&filters[position][$in][${i}]=${encodeURIComponent(p)}`)
      .join("");

  while (page <= pageCount) {
    const response = await fetchApiPublic(`${basePath}&pagination[page]=${page}&pagination[pageSize]=25`)
    const data = response.data?.data || response.data || []
    items.push(...data)
    const pagination = response.meta?.pagination
    pageCount = pagination?.pageCount || page
    page += 1
  }

  managerCandidates.value = items
}

function setTeamsForDepartment(resetTeam = true) {
  const dept = departmentOptions.value.find(dept => dept.name === state.s1_department)
  teamOptions.value = dept?.teams || []
  if (resetTeam) {
    state.s1_team = ''
    resetMemberRows()
  } else if (state.s1_team && !teamOptions.value.some(t => t.name === state.s1_team)) {
    state.s1_team = ''
    resetMemberRows()
  }
}

function updateGroupTypeFromTeam() {
  if (!state.s1_team) {
    state.s1_groupType = ''
    return
  }
  const matched = teamOptions.value.find(team => team.name === state.s1_team)
  if (!matched) {
    state.s1_groupType = ''
    return
  }
  if (matched.type_group === 'Pro') state.s1_groupType = 'Production'
  else if (matched.type_group === 'Non') state.s1_groupType = 'Non Production'
  else state.s1_groupType = 'Support'
}

function onDepartmentChange() {
  setTeamsForDepartment(true)
  fetchPositionAdvisor()
  fetchPositionManager()
}

watch(() => state.s1_team, (val, oldVal) => {
  if (!val) {
    state.s1_groupType = ''
    resetMemberRows()
    return
  }
  updateGroupTypeFromTeam()
  if (oldVal && oldVal !== val) {
    resetMemberRows()
  }
})

function toArray(payload) {
  if (!payload) return []
  if (Array.isArray(payload)) return payload
  if (Array.isArray(payload?.data)) return payload.data
  if (Array.isArray(payload?.data?.data)) return payload.data.data
  return []
}

function normalizeEmployee(entry = {}) {
  const source = entry.attributes || entry
  return {
    code: source.employee_code || source.code || source.empId || '',
    fullName: source.full_name || source.fullName || source.name || '',
    position: source.position || source.job_title || source.jobTitle || '',
    department:
      source.department?.data?.attributes?.name ||
      source.department?.name ||
      source.department ||
      '',
  }
}

async function fetchEmployeeByCode(code) {
  const normalized = code?.trim()
  if (!normalized) return null
  if (employeeLookupCache.has(normalized)) {
    return employeeLookupCache.get(normalized)
  }

  try {
    const query = `/employees?filters[employee_code][$eq]=${encodeURIComponent(normalized)}&pagination[pageSize]=1`
    const response = await fetchApiPublic(query)
    const records = toArray(response)
    const employee = records.length ? normalizeEmployee(records[0]) : null
    employeeLookupCache.set(normalized, employee)
    return employee
  } catch (err) {
    console.error('fetchEmployeeByCode failed:', err)
    employeeLookupCache.set(normalized, null)
    return null
  }
}

function addAdvisor() {
  if (state.advisors.length >= MAX_ADVISORS) return
  const uid = `advisor-${Date.now()}-${state.advisors.length}`
  state.advisors.push({ uid, id: '', name: '', dept: '', search: '' })
}

function removeAdvisor(idx) {
  if (state.advisors.length <= MIN_ADVISORS) return
  state.advisors.splice(idx, 1)
}
function onAdvisorSelect(idx) {
  const advisor = state.advisors[idx]
  if (!advisor) return
  const selectedId = advisor.id
  if (!selectedId) {
    advisor.name = ''
    advisor.dept = ''
    return
  }

  const duplicate = state.advisors.some((item, itemIdx) => itemIdx !== idx && item.id === selectedId)
  if (duplicate) {
    advisor.id = ''
    advisor.name = ''
    advisor.dept = ''
    return
  }

  const candidate = advisorCandidates.value.find(person => person.employee_code === selectedId)
  advisor.name = candidate?.full_name || candidate?.name || ''
  advisor.dept = candidate?.department || candidate?.dept || state.s1_department || ''
}
function isAdvisorTaken(code, idx) {
  if (!code) return false
  return state.advisors.some((advisor, advisorIdx) => advisorIdx !== idx && advisor.id === code)
}
async function fillMember(idx) {
  const member = state.members[idx]
  if (!member) return
  if (!state.s1_department || !state.s1_team) {
    showWarning('กรุณาเลือก "ฝ่าย" และ "ทีม" ก่อนระบุสมาชิก')
    clearMemberRow(member, idx)
    return
  }
  const code = member.empId?.trim()
  if (!code) {
    clearMemberRow(member, idx)
    return
  }
  const employee = await fetchEmployeeByCode(code)
  if (!employee) {
    clearMemberRow(member, idx)
    return
  }
  if (member.empId?.trim() !== code) return
  const selectedDept = state.s1_department?.trim().toLowerCase()
  const employeeDept = employee.department?.trim().toLowerCase()
  if (!employeeDept || employeeDept !== selectedDept) {
    showWarning('รหัสพนักงานนี้ไม่ได้อยู่ในฝ่ายที่เลือก')
    clearMemberRow(member, idx)
    return
  }
  member.name = employee.fullName || ''
}
function addMemberRow() {
  if (ui.disabled) return
  if (!state.s1_department || !state.s1_team) {
    showWarning('กรุณาเลือก "ฝ่าย" และ "ทีม" ก่อนเพิ่มสมาชิก')
    return
  }
  if (state.members.length >= MAX_MEMBERS) return
  state.members.push(createEmptyMember(state.members.length))
}
function removeMember(idx) {
  if (state.members.length <= MIN_MEMBERS) return
  if (typeof idx !== 'number' || idx < 0 || idx >= state.members.length) return
  state.members.splice(idx, 1)
  syncMemberRoles()
}
function onLogoChange(event) {
  const file = event?.target?.files?.[0]
  if (!file) {
    state.logoFiles = []
    setLogoPreview(null)
    if (event?.target) event.target.value = ''
    return
  }
  state.logoFiles = [file]
  const reader = new FileReader()
  reader.onload = () => {
    state.logoDataUrl = reader.result || ''
    state.logoFileName = file.name || ''
    setLogoPreview(state.logoDataUrl)
  }
  reader.readAsDataURL(file)
  if (event?.target) event.target.value = ''
}
function setDisabled() { }

function saveS1() {
  ui.saveMsg = ''
  ensureGroupNo()
  ui.saving = true
  try {
    persistForm()
    ui.saveMsg = 'บันทึกชัดเจนแล้ว (บันทึกในเครื่อง)'
    ui.disabled = true
  } catch (err) {
    console.error('saveS1 failed:', err)
    ui.saveMsg = 'เกิดข้อผิดพลาดในการบันทึก'
  } finally {
    ui.saving = false
  }
}

function goNext() {
  router.push("/minutes2")
}

hydrateForm()
fetchDepartmets()
onMounted(() => {
  ensureGroupNo()
})

onBeforeUnmount(() => {
  if (logoObjectUrl) {
    URL.revokeObjectURL(logoObjectUrl)
    logoObjectUrl = ''
  }
})



</script>

<style scoped>
@reference "tailwindcss";

.label {
  @apply bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold;
}

.ctrl {
  @apply w-full px-2.5 h-10 border-2 border-black rounded-xl bg-white disabled:bg-gray-100 text-sm;
}

.auto {
  @apply bg-white border-2 border-black rounded-xl px-2.5 h-10 flex items-center text-sm;
}

.panel {
  @apply border-[3px] border-black rounded-xl p-2.5 bg-white;
}

.btn {
  @apply border-2 border-black rounded-xl px-3.5 py-2 font-bold;
}

.th {
  @apply border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left;
}

.td {
  @apply border-2 border-black px-2 py-1.5;
}

.cell {
  @apply w-full px-2 py-1.5 border border-gray-300 rounded-md disabled:bg-gray-100;
}

.empRow {
  @apply grid grid-cols-[110px_1fr_220px] gap-2.5 items-center max-[1200px]:grid-cols-1;
}

.empSection {
  @apply flex flex-col;
}

.advisorRowSingle {
  @apply grid grid-cols-[1fr_auto] gap-2.5 items-center max-[900px]:grid-cols-1;
}

.advisorSelect {
  @apply relative w-full;
}

.advisorCaret {
  @apply absolute inset-y-0 right-3 flex items-center text-sm text-gray-500 pointer-events-none;
}

.advisorDropdown {
  @apply absolute z-30 mt-1 w-full max-h-56 overflow-auto bg-white border-2 border-black rounded-xl shadow-lg;
}

.advisorDropdown li {
  @apply flex items-center justify-between gap-2 px-3 py-2 text-sm cursor-pointer hover:bg-slate-100;
}

.advisorDropdown li .name {
  @apply font-medium truncate;
}

.advisorDropdown li .dept {
  @apply text-xs text-gray-500 truncate;
}

.advisorDropdown li .code {
  @apply text-xs font-semibold text-gray-600;
}
</style>
