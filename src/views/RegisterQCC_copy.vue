<!-- QCCRegister.vue -->
<template>
  <p>DEBUG: {{ state.s1_department }}</p>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <RegisterFlowSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :steps="registerSidebarSteps"
      current-key="register"
    />
    <div id="s1_form" data-sub="จดทะเบียนทำกิจกรรม QCC"
      class="bg-[#f3fbfb] border-4 border-black rounded-xl p-4 flex-1">
      <div class="text-center text-[28px] font-extrabold my-1.5">
        ใบจดทะเบียนจัดตั้งกลุ่มกิจกรรม <b>QCC</b>
      </div>

      <!-- ================= GRID หลัก ================= -->
      <div class="grid gap-3 items-center" :class="gridCols">

        <!-- วันที่ลงทะเบียน -->
        <div class="label">วันที่ลงทะเบียน</div>
        <input v-model="state.s1_date" type="date" class="ctrl" :disabled="ui.disabled" />

        <!-- เลขที่ทะเบียนกลุ่ม -->
        <div class="label col-start-4 justify-self-end max-[1200px]:col-start-1 max-[1200px]:col-span-1">
          เลขที่ทะเบียนกลุ่ม</div>
        <div class="auto col-start-5 max-[1200px]:col-start-2 max-[1200px]:col-span-1">{{ state.s1_groupNo || 'Auto' }}
        </div>

        <!-- ฝ่าย / Department -->
        <div class="label">ฝ่าย / Department</div>
        <select v-model="state.s1_department" @change="onDepartmentChange" class="ctrl" :disabled="ui.disabled">
          <option value="">— เลือกฝ่าย —</option>
          <option v-for="dept in departmentOptions" :key="dept.code" :value="dept.code">
            {{ dept.displayName }}
          </option>
        </select>

        <!-- ประเภทกลุ่ม -->
        <div class="label col-start-4 justify-self-end max-[1200px]:col-start-1 max-[1200px]:col-span-1">
          ประเภทกลุ่มที่ดำเนินกิจกรรม</div>
        <div class="auto col-start-5 max-[1200px]:col-start-2 max-[1200px]:col-span-1">{{ state.s1_groupType || 'Auto'
          }}</div>

        <!-- ทีม -->
        <div class="label">ทีม</div>
        <select v-model="state.s1_team" class="ctrl" :disabled="ui.disabled || !state.s1_department">
          <option value="">
            {{ state.s1_department ? '— เลือกทีม —' : 'เลือกฝ่ายก่อน' }}
          </option>
          <option v-for="team in teamOptions" :key="team.code" :value="team.code">
            {{ team.displayName }}
          </option>
        </select>

        <!-- ชื่อกลุ่ม -->
        <div class="label col-start-1">ชื่อกลุ่ม</div>
        <input v-model="state.s1_groupName" class="ctrl col-span-4 max-[1200px]:col-span-1 w-full"
          :disabled="ui.disabled" />

        <!-- คำขวัญกลุ่ม -->
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

        <!-- ที่ปรึกษา / ผู้จัดการทีม -->
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
                    <option v-for="candidate in advisorCandidates" :key="candidate.code" :value="candidate.code">
                      {{ candidate.display }}
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
                <select v-model="state.manager.id" class="ctrl h-10" :disabled="ui.disabled || !state.s1_department"
                  @change="onManagerSelect">
                  <option value="">{{ state.s1_department ? '— เลือกผู้จัดการ —' : 'เลือกฝ่ายก่อน' }}</option>
                  <option v-for="candidate in managerCandidates" :key="candidate.code" :value="candidate.code">
                    {{ candidate.display }}
                  </option>
                </select>
              </div>
            </div>
          </div>
        </div>

      </div>
      <!-- ✅ END GRID หลัก -->



      <!-- ================= ลักษณะงาน + โลโก้ ================= -->
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

      <!-- ================= ตารางสมาชิก ================= -->
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
                  <input v-model="m.empId" placeholder="รหัส" @blur="fillMember(idx)" @keyup.enter="fillMember(idx)"
                    class="cell" :disabled="ui.disabled" />
                </td>
                <td class="td"><input v-model="m.name" readonly placeholder="(Auto)" class="cell bg-gray-50" /></td>
                <td class="td">
                  <input v-model="m.position" readonly :disabled="ui.disabled"
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
            :disabled="ui.disabled || state.members.length >= MAX_MEMBERS">เพิ่มสมาชิก +</button>
          <span class="text-gray-500">* 1=หัวหน้า, 2=รองหัวหน้า, 3=เลขาฯ, ที่เหลือ=สมาชิก</span>
        </div>
      </div>

      <!-- ================= Footer ================= -->
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
import { onMounted, reactive, computed, ref, watch, watchEffect } from 'vue'
import { RouterLink, useRouter } from 'vue-router'
import axios from 'axios'
import RegisterFlowSidebar from '@/components/RegisterFlowSidebar.vue'
import { REGISTER_SIDEBAR_STEPS } from '@/constants/qccSteps'
import { useRegisterShared, updateRegisterShared } from '@/stores/registerShared'
import { useDepartments, TEAM_GROUP_TYPE_LABELS } from '@/stores/departments'

const router = useRouter()
const sharedRegister = useRegisterShared()
const registerSidebarSteps = REGISTER_SIDEBAR_STEPS
const departmentsStore = useDepartments()

/* ---------- STATE ---------- */
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
  advisors: [createAdvisor()],
  manager: { id: '', name: '', dept: '', search: '' },
  s1_desc: '',
  members: [],
  logoFiles: [],
})
const ui = reactive({
  disabled: false,
  saving: false,
  saveMsg: '',
  logoPreviewUrl: '',
})
const lastSyncedDepartmentState = reactive({
  department: sharedRegister.department || '',
  departmentName: sharedRegister.departmentName || '',
  team: sharedRegister.team || '',
  teamName: sharedRegister.teamName || '',
  groupType: sharedRegister.groupType || '',
})
const users = ref([])
const usersCache = {}
const usersFetchPromises = {}
const advisorDropdown = reactive({ openIndex: -1 })
const advisorSource = ref([])
const advisorCache = {}
const advisorPromises = {}
const managerDropdown = reactive({ open: false })
const MAX_MEMBERS = 10
const MIN_MEMBERS = 2
const ROLE_LABELS = ['หัวหน้าทีม', 'รองหัวหน้าทีม', 'เลขานุการ']
const DEFAULT_MEMBER_ROLE = 'สมาชิก'
const MAX_ADVISORS = 2
const employeeList = ref([])
const MIN_ADVISORS = 0
const REQUIRED_POSITION_KEYWORDS = ['junior', 'leader', 'foreman']
const POSITION_KEYWORD_SYNONYMS = {
  foreman: ['foreman', 'foeman'],
}
const ADVISOR_OPTIONS_LIMIT = 15
const MANAGER_OPTIONS_LIMIT = 20

watchEffect(() => {
  console.log('advisorSource', advisorSource.value.map(r => ({
    code: r.code, dept: r.dept, deptCode: r.deptCode, position: r.positionLower
  })))
})

async function ensureUsersForDepartment(departmentCode = '') {
  if (hasGAS()) return users.value
  const normalizedCode = normalizeString(departmentCode)
  const key = normalizedCode || '_all'

  if (usersCache[key]) {
    users.value = usersCache[key]
    return users.value
  }

  users.value = []

  if (usersFetchPromises[key]) {
    return usersFetchPromises[key]
  }

  const fetchEmployees = async (extraParams = {}) => {
    const pageSize = 100
    let page = 1
    let pageCount = 1
    const acc = []
    do {
      const params = {
        'pagination[page]': page,
        'pagination[pageSize]': pageSize,
        populate: '*',
        ...extraParams,
      }

      const { data } = await axios.get('http://10.17.2.33:1338/api/employees', { params })
      const items = data?.data || []
      acc.push(...items.map(buildEmployeeRecord).filter(Boolean))
      const pagination = data?.meta?.pagination
      pageCount = pagination?.pageCount || page
      page += 1
    } while (page <= pageCount)
    return acc
  }

  const fetchPromise = (async () => {
    try {
      const collected = await fetchEmployees()
      usersCache[key] = collected
      users.value = collected
      return collected
    } catch (error) {
      console.error('Failed to load employees from Strapi', error)
      return users.value
    } finally {
      delete usersFetchPromises[key]
    }
  })()

  usersFetchPromises[key] = fetchPromise
  return fetchPromise
}

async function loadAdvisorCandidates(departmentCode = '') {

  const normalizedCode = normalizeString(departmentCode)

  const matchedDepartment = departmentsStore.findByCode(normalizedCode)


  const fetchCode = normalizeString(matchedDepartment?.codeOriginal) || normalizedCode


  const cacheKey = (normalizedCode || fetchCode || '_all').toLowerCase()
  console.log("ggggg", advisorCache)
  if (!fetchCode) {
    advisorSource.value = []
    employeeList.value = []
    return []
  }

  if (advisorCache[cacheKey]) {
    advisorSource.value = advisorCache[cacheKey]
    return advisorCache[cacheKey]
  }

  if (advisorPromises[cacheKey]) return advisorPromises[cacheKey]



  const loadPromise = (async () => {
    if (hasGAS()) {
      const gasList = await new Promise(resolve => {
        try {
          google.script.run
            .withSuccessHandler(list => {
              resolve(Array.isArray(list) ? list : [])
            })
            .withFailureHandler(error => {
              console.error('Failed to load advisor candidates from GAS', error)
              resolve([])
            })
            .getAdvisorCandidates(fetchCode)
        } catch (error) {
          console.error('Failed to initiate GAS advisor fetch', error)
          resolve([])
        }
      })
      return gasList.map(buildEmployeeRecord).filter(Boolean)
    }

    const employees = await ensureUsersForDepartment(fetchCode)
    return Array.isArray(employees) ? employees : []
  })()

  advisorPromises[cacheKey] = loadPromise

  try {
    const records = await loadPromise
    const departments = departmentsStore.departments.value || []
    const normalizedLower = normalizedCode.toLowerCase()
    const matched =
      matchedDepartment ||
      departments.find(dep => normalizeString(dep?.displayName).toLowerCase() === normalizedLower) ||
      departments.find(dep => normalizeString(dep?.nameTh).toLowerCase() === normalizedLower) ||
      departments.find(dep => normalizeString(dep?.nameEn).toLowerCase() === normalizedLower)
    const fallbackDeptName =
      matched?.displayName ||
      matched?.nameTh ||
      matched?.nameEn ||
      normalizedCode ||
      fetchCode
    const fallbackDeptCode = normalizeString(matched?.codeOriginal) || normalizeString(matched?.code) || fetchCode
    const fallbackDeptCodeLower = fallbackDeptCode.toLowerCase()
    const normalizedCodeLower = normalizedCode.toLowerCase()
    const fetchCodeLower = normalizeString(fetchCode).toLowerCase()

    const enrichedRecords = records.map(emp => {
      if (!emp) return emp
      const next = { ...emp }
      if (fallbackDeptCode) {
        if (!next.deptCode) next.deptCode = fallbackDeptCode
        const resolvedDeptCode = normalizeString(next.deptCode) || fallbackDeptCode
        next.deptCode = resolvedDeptCode
        next.deptCodeLower = resolvedDeptCode.toLowerCase()
        const originalDept = next.dept || ''
        next.deptName = fallbackDeptName
        if (
          !originalDept.trim() ||
          originalDept.toLowerCase() === resolvedDeptCode.toLowerCase()
        ) {
          next.dept = fallbackDeptName
        } else {
          next.deptOriginal = originalDept
          next.dept = fallbackDeptName || originalDept
        }
      }
      if (next.position && !next.positionLower) {
        next.positionLower = normalizeString(next.position).toLowerCase()
      }
      return next
    })
    const matchesDepartment = (emp) => {
      if (!emp) return false
      const codeVariants = [
        normalizeString(emp.deptCodeLower).toLowerCase(),
        normalizeString(emp.deptCode).toLowerCase(),
        normalizeString(emp.deptOriginal).toLowerCase(),
      ].filter(Boolean)
      const nameVariants = [
        normalizeString(emp.deptName).toLowerCase(),
        normalizeString(emp.dept).toLowerCase(),
      ].filter(Boolean)
      const targets = [
        fallbackDeptCodeLower,
        normalizedCodeLower,
        fetchCodeLower,
        normalizeString(matched?.displayName).toLowerCase(),
        normalizeString(matched?.nameTh).toLowerCase(),
        normalizeString(matched?.nameEn).toLowerCase(),
      ].filter(Boolean)
      return targets.some(target => codeVariants.includes(target) || nameVariants.includes(target))
    }
    const filteredRecords = enrichedRecords.filter(matchesDepartment)

    advisorCache[cacheKey] = filteredRecords
    if (normalizeString(advisorDepartmentCode.value) === normalizedCode) {
      advisorSource.value = filteredRecords
    }
    return filteredRecords
  } finally {
    delete advisorPromises[cacheKey]
  }
}

function buildEmployeeRecord(employee) {

  const attr = employee?.attributes ?? employee ?? {}
  const code = pickField(attr, [
    'employees_code',
    'Employees_code',
    'employeesCode',
    'EmployeesCode',
    'employeeCode',
    'EmployeeCode',
    'employee_code',
    'Employee_Code',
    'empCode',
    'EmpCode',
    'emp_code',
    'empId',
    'EmpId',
    'emp_id',
    'employeeId',
    'EmployeeId',
    'employee_id',
    'code',
    'Code',
  ]) || normalizeString(employee?.id)

  if (!code) return null

  const firstName = pickField(attr, [
    'firstName',
    'FirstName',
    'firstname',
    'first_name',
    'givenName',
    'given_name',
  ])
  const lastName = pickField(attr, [
    'lastName',
    'LastName',
    'lastname',
    'last_name',
    'surname',
    'familyName',
    'family_name',
  ])

  const nameCandidates = [
    pickField(attr, ['fullName', 'FullName', 'fullname', 'full_name']),
    pickField(attr, ['name', 'Name']),
    [firstName, lastName].filter(Boolean).join(' '),
  ]
  const name = nameCandidates.map(normalizeString).find(Boolean) || ''

  const position = pickField(attr, [
    'position',
    'Position',
    'jobTitle',
    'JobTitle',
    'job_title',
    'title',
    'Title',
  ])
  const trainingHistory = pickField(attr, [
    'training_history',
    'trainingHistory',
    'TrainingHistory',
    'training',
    'Training',
  ])
  const normalizedPositionLower = normalizeString(position).toLowerCase()
  const normalizedPositionCondensed = normalizedPositionLower.replace(/\s+/g, ' ').trim()
  const positionTokens = normalizedPositionLower
    ? normalizedPositionLower.replace(/[^a-z0-9\s]/g, ' ').split(/\s+/).filter(Boolean)
    : []
  const trainingLower = normalizeString(trainingHistory).toLowerCase()
  const trainingTokens = trainingLower
    ? trainingLower
      .split(/[,|;\/\n\r]+/)
      .map(item => item.trim())
      .filter(Boolean)
    : []
  const deptRelationAttr =
    employee?.attributes?.department?.data?.attributes ||
    employee?.department?.data?.attributes ||
    {}
  const deptCode =
    pickField(deptRelationAttr, ['code', 'Code', 'deptCode', 'dept_code', 'departmentCode', 'abbr', 'short_code']) ||
    pickField(attr, [
      'deptCode',
      'DeptCode',
      'departmentCode',
      'DepartmentCode',
      'dept_code',
      'department_code',
    ])
  const deptName =
    pickField(deptRelationAttr, [
      'name_th',
      'nameTh',
      'thai_name',
      'thaiName',
      'name_en',
      'nameEn',
      'english_name',
      'englishName',
      'name',
      'title_th',
      'titleTh',
      'title',
      'displayName',
    ]) ||
    pickField(attr, [
      'dept',
      'Dept',
      'department',
      'Department',
      'departmentName',
      'DepartmentName',
      'deptName',
      'DeptName',
    ])
  const teamCode = pickField(attr, [
    'team_code',
    'teamCode',
    'team',
    'Team',
    'teamCodeNew',
  ])
  const teamName = pickField(attr, [
    'team_name',
    'teamName',
    'team_display',
    'teamDisplay',
  ])

  return {
    code,
    codeLower: code.toLowerCase(),
    name,
    position,
    positionLower: normalizeString(position).toLowerCase(),
    positionNormalized: normalizedPositionCondensed,
    positionTokens,
    trainingHistory,
    trainingHistoryLower: trainingLower,
    trainingHistoryTokens: trainingTokens,
    dept: deptName,
    deptCode,
    deptCodeLower: normalizeString(deptCode).toLowerCase(),
    team: teamName || '',
    teamCode,
    teamCodeLower: normalizeString(teamCode).toLowerCase(),
    raw: employee,
  }
}

function normalizeString(value) {
  if (value === null || value === undefined) return ''
  return String(value).trim()
}

function pickField(obj, candidates) {
  if (!obj) return ''
  for (const key of candidates) {
    if (Object.prototype.hasOwnProperty.call(obj, key)) {
      const v = normalizeString(obj[key])
      if (v) return v
    }
  }
  return ''
}

function findEmployeeByCode(code) {
  const target = normalizeString(code).toLowerCase()
  if (!target) return null
  return (
    users.value.find(emp => emp.codeLower === target) || null
  )
}

function hasRequiredPositionKeywords(tokens = []) {
  if (!Array.isArray(tokens) || !tokens.length) return false
  const tokenSet = new Set(tokens.map(token => token.toLowerCase()))
  return REQUIRED_POSITION_KEYWORDS.some(keyword => {
    const variants = POSITION_KEYWORD_SYNONYMS[keyword] || [keyword]
    return variants.some(variant => tokenSet.has(variant))
  })
}

const activeDepartmentCode = computed(() => normalizeString(state.s1_department))

/* ---------- LAYOUT HELPERS ---------- */
const gridCols = computed(() =>
  'grid-cols-[220px_260px_minmax(0,1fr)_240px_200px] max-[1200px]:grid-cols-[220px_1fr]'
)
const twoCols = computed(() => 'grid-cols-[1fr_360px] max-[1200px]:grid-cols-1')

/* ---------- DEPARTMENTS DATA ---------- */
const departmentOptions = computed(() => departmentsStore.departments.value)
const selectedDepartment = computed(() => departmentsStore.findByCode(state.s1_department))
const teamOptions = computed(() => selectedDepartment.value?.teams || [])
const selectedTeam = computed(() =>
  teamOptions.value.find(team => team.code === state.s1_team) || null
)
const advisorDepartmentCode = computed(() => normalizeString(state.s1_department))
const advisorCandidates = computed(() => {
  const selectedDept = selectedDepartment.value
  const selectedCodeLower = normalizeString(selectedDept?.code || state.s1_department).toLowerCase()
  const selectedCodeOriginalLower = normalizeString(selectedDept?.codeOriginal).toLowerCase()
  const selectedNameLower = normalizeString(
    selectedDept?.displayName || selectedDept?.nameTh || selectedDept?.nameEn
  ).toLowerCase()

  if (!selectedCodeLower && !selectedNameLower) return []
  const seen = new Set()
  return advisorSource.value
    .filter(emp => {
      if (!emp || !emp.codeLower) return false
      const deptCodeLower = normalizeString(emp.deptCodeLower).toLowerCase()
      const deptNameLower = normalizeString(emp.dept || emp.deptName).toLowerCase()
      const matchesDepartment =
        (selectedCodeLower && deptCodeLower === selectedCodeLower) ||
        (selectedCodeOriginalLower && deptCodeLower === selectedCodeOriginalLower) ||
        (selectedNameLower && deptNameLower === selectedNameLower)
      if (!matchesDepartment) return false
      if (!hasRequiredPositionKeywords(emp.positionTokens || [])) return false
      if (seen.has(emp.codeLower)) return false
      seen.add(emp.codeLower)
      return true
    })
    .map(emp => {
      const code = emp.code
      const name = emp.name || 'ไม่ระบุชื่อ'
      const dept = emp.deptName || emp.dept || ''
      const positionLower = emp.positionLower || 'ไม่ระบุตำแหน่ง'
      const display = formatAdvisorDisplay(code, name, dept, positionLower)
      const keywords = `${code} ${name} ${dept} ${positionLower}`.toLowerCase()
      return { code, name, dept, display, keywords, positionLower }
    })
    .sort((a, b) => a.display.localeCompare(b.display, 'th'))
})
const managerCandidates = computed(() => {
  return advisorCandidates.value
})

function resolveGroupTypeLabel(input, fallback = '') {
  if (input == null) return fallback
  const str = String(input).trim()
  if (!str) return fallback
  return TEAM_GROUP_TYPE_LABELS[str] || str
}
function formatAdvisorDisplay(code, name, dept, positionLower) {
  const parts = []
  const safeName = normalizeString(name) || 'ไม่ระบุชื่อ'
  const safePosition = normalizeString(positionLower)
  const safeDept = normalizeString(dept)
  const safeCode = normalizeString(code)
  parts.push(safeName)
  if (safePosition) parts.push(safePosition)
  if (safeDept) parts.push(safeDept)
  if (safeCode) parts.push(safeCode)
  return parts.join(' • ')
}

function getAdvisorMatches(query = '') {
  const normalized = normalizeString(query).toLowerCase()
  const candidates = advisorCandidates.value
  if (!normalized) return candidates.slice(0, ADVISOR_OPTIONS_LIMIT)
  return candidates
    .filter(candidate => candidate.keywords.includes(normalized))
    .slice(0, ADVISOR_OPTIONS_LIMIT)
}

function advisorDropdownOptions(idx) {
  const advisor = state.advisors[idx]
  if (!advisor) return []
  return getAdvisorMatches(advisor.search || '')
}

function onAdvisorSelect(idx) {
  const advisor = state.advisors[idx]
  if (!advisor) return
  const code = normalizeString(advisor.id)
  if (!code) {
    advisor.name = ''
    advisor.dept = ''
    advisor.search = ''
    return
  }
  const candidate = advisorCandidates.value.find(
    item => item.code.toLowerCase() === code.toLowerCase()
  )
  if (candidate) {
    selectAdvisorCandidate(idx, candidate)
  } else {
    advisor.search = code
    lookupEmp('advisor', idx)
  }
}

function getManagerMatches(query = '') {
  const normalized = normalizeString(query).toLowerCase()
  const candidates = managerCandidates.value
  if (!normalized) return candidates.slice(0, MANAGER_OPTIONS_LIMIT)
  return candidates
    .filter(candidate => candidate.keywords.includes(normalized))
    .slice(0, MANAGER_OPTIONS_LIMIT)
}

const managerDropdownOptions = computed(() => getManagerMatches(state.manager.search || ''))

function onManagerSelect() {
  const code = normalizeString(state.manager.id)
  if (!code) {
    state.manager.name = ''
    state.manager.dept = ''
    state.manager.search = ''
    return
  }
  const candidate = managerCandidates.value.find(
    item => item.code.toLowerCase() === code.toLowerCase()
  )
  if (candidate) {
    selectManagerCandidate(candidate)
  } else {
    state.manager.search = code
    lookupEmp('manager')
  }
}

function openAdvisorDropdown(idx) {
  if (!advisorDepartmentCode.value) return
  advisorDropdown.openIndex = idx
  if (!hasGAS()) ensureUsersForDepartment(advisorDepartmentCode.value || activeDepartmentCode.value)
}

function closeAdvisorDropdown() {
  advisorDropdown.openIndex = -1
}

function openManagerDropdown() {
  if (!advisorDepartmentCode.value) return
  managerDropdown.open = true
  if (!hasGAS()) ensureUsersForDepartment(advisorDepartmentCode.value || activeDepartmentCode.value)
}

function closeManagerDropdown() {
  managerDropdown.open = false
}

function onAdvisorInput(idx) {
  const advisor = state.advisors[idx]
  if (!advisor) return
  advisor.id = ''
  advisor.name = ''
  advisor.dept = ''
  openAdvisorDropdown(idx)
}

function onAdvisorEnter(idx) {
  const matches = advisorDropdownOptions(idx)
  if (matches.length) {
    selectAdvisorCandidate(idx, matches[0])
  } else {
    commitAdvisorSearch(idx)
  }
}

function selectAdvisorCandidate(idx, candidate) {
  const advisor = state.advisors[idx]
  if (!advisor || !candidate) return
  advisor.id = candidate.code
  advisor.search = candidate.display
  closeAdvisorDropdown()
  lookupEmp('advisor', idx)
}

function onAdvisorBlur(idx) {
  setTimeout(() => {
    if (advisorDropdown.openIndex === idx) closeAdvisorDropdown()
    commitAdvisorSearch(idx)
  }, 120)
}

function commitAdvisorSearch(idx) {
  const advisor = state.advisors[idx]
  if (!advisor) return
  const search = normalizeString(advisor.search)
  if (!search) {
    advisor.id = ''
    advisor.name = ''
    advisor.dept = ''
    advisor.search = ''
    return
  }
  const candidate = advisorCandidates.value.find(
    item => item.code.toLowerCase() === search.toLowerCase()
  )
  if (candidate) {
    selectAdvisorCandidate(idx, candidate)
    return
  }
  advisor.id = search
  advisor.search = search
  lookupEmp('advisor', idx)
}

function onManagerInput() {
  state.manager.id = ''
  state.manager.name = ''
  state.manager.dept = ''
  openManagerDropdown()
}

function onManagerEnter() {
  const matches = managerDropdownOptions.value
  if (matches.length) {
    selectManagerCandidate(matches[0])
  } else {
    commitManagerSearch()
  }
}

function selectManagerCandidate(candidate) {
  if (!candidate) return
  state.manager.id = candidate.code
  state.manager.name = candidate.name || ''
  state.manager.dept = candidate.dept || ''
  state.manager.search = candidate.display
  closeManagerDropdown()
  lookupEmp('manager')
}

function onManagerBlur() {
  setTimeout(() => {
    if (managerDropdown.open) closeManagerDropdown()
    commitManagerSearch()
  }, 120)
}

function commitManagerSearch() {
  const search = normalizeString(state.manager.search)
  if (!search) {
    state.manager.id = ''
    state.manager.name = ''
    state.manager.dept = ''
    state.manager.search = ''
    return
  }
  const candidate = managerCandidates.value.find(
    item => item.code.toLowerCase() === search.toLowerCase()
  )
  if (candidate) {
    selectManagerCandidate(candidate)
    return
  }
  state.manager.id = search
  state.manager.search = search
  lookupEmp('manager')
}

function syncStateFromShared() {
  const data = sharedRegister
  state.s1_date = data.registerDate || ''
  state.s1_groupNo = data.groupNo || ''
  state.s1_department = data.department || ''
  state.s1_team = data.team || ''
  state.s1_departmentName = data.departmentName || ''
  state.s1_teamName = data.teamName || ''
  state.s1_groupType = data.groupType || state.s1_groupType || 'Auto'
  state.s1_groupName = data.groupName || ''
  state.s1_motto = data.motto || ''

  const matchedDepartment = departmentsStore.findByCode(state.s1_department)
  if (matchedDepartment) {
    state.s1_department = matchedDepartment.code
    state.s1_departmentName =
      matchedDepartment.displayName ||
      matchedDepartment.nameTh ||
      matchedDepartment.nameEn ||
      matchedDepartment.code
  }

  const nextAdvisors = Array.isArray(data.advisors) && data.advisors.length
    ? data.advisors.map((adv, idx) => ({
      uid: adv.uid || cryptoRandom(),
      id: adv.id || '',
      name: adv.name || '',
      dept: adv.dept || '',
      search: adv.id || adv.name || '',
    }))
    : []
  state.advisors.splice(0, state.advisors.length, ...nextAdvisors)
  state.advisors.forEach(advisor => {
    advisor.search = advisor.id
      ? formatAdvisorDisplay(advisor.id, advisor.name, advisor.dept)
      : normalizeString(advisor.search)
  })
  if (!state.advisors.length) {
    state.advisors.push(createAdvisor())
  }

  Object.assign(state.manager, {
    id: data.manager?.id || '',
    name: data.manager?.name || '',
    dept: data.manager?.dept || '',
  })
  state.manager.search = state.manager.id
    ? formatAdvisorDisplay(state.manager.id, state.manager.name, state.manager.dept)
    : ''

  loadAdvisorCandidates(state.s1_department)

  const nextMembers = Array.isArray(data.members) && data.members.length
    ? data.members.map((m, idx) => ({
      uid: m.uid || cryptoRandom(),
      empId: m.empId || '',
      name: m.name || '',
      position: m.position || (idx < ROLE_LABELS.length ? ROLE_LABELS[idx] : DEFAULT_MEMBER_ROLE),
    }))
    : []
  state.members.splice(0, state.members.length, ...nextMembers)
  if (!state.members.length) {
    const defaultCount = Math.max(MIN_MEMBERS, 4)
    for (let i = 0; i < defaultCount; i++) {
      state.members.push({
        uid: cryptoRandom(),
        empId: '',
        name: '',
        position: i < ROLE_LABELS.length ? ROLE_LABELS[i] : DEFAULT_MEMBER_ROLE,
      })
    }
  }
  applyRoleConstraints()
  updateDepartmentDerivedFields({ fromShared: true })
  lastSyncedDepartmentState.department = state.s1_department || ''
  lastSyncedDepartmentState.departmentName = state.s1_departmentName || ''
  lastSyncedDepartmentState.team = state.s1_team || ''
  lastSyncedDepartmentState.teamName = state.s1_teamName || ''
  lastSyncedDepartmentState.groupType = state.s1_groupType || ''
}

function buildSharedPayload() {
  const department = state.s1_department || ''
  const team = state.s1_team || ''
  return {
    registerDate: state.s1_date || '',
    groupNo: state.s1_groupNo || '',
    department,
    departmentName: state.s1_departmentName || '',
    team,
    teamName: state.s1_teamName || '',
    groupType: state.s1_groupType || '',
    groupName: state.s1_groupName || '',
    motto: state.s1_motto || '',
    advisors: state.advisors.map((adv, idx) => ({
      uid: adv.uid || cryptoRandom(),
      id: adv.id || '',
      name: adv.name || '',
      dept: adv.dept || '',
    })),
    manager: {
      id: state.manager.id || '',
      name: state.manager.name || '',
      dept: state.manager.dept || '',
    },
    members: state.members.map((m, idx) => ({
      uid: m.uid || cryptoRandom(),
      empId: m.empId || '',
      name: m.name || '',
      position: m.position || (idx < ROLE_LABELS.length ? ROLE_LABELS[idx] : DEFAULT_MEMBER_ROLE),
    })),
  }
}

watch(
  () => sharedRegister.lastUpdated,
  () => {
    syncStateFromShared()
  },
  { immediate: true }
)

function syncDepartmentSelectionToShared() {
  const payload = {
    department: state.s1_department || '',
    departmentName: state.s1_departmentName || '',
    team: state.s1_team || '',
    teamName: state.s1_teamName || '',
    groupType: state.s1_groupType || '',
  }
  if (
    payload.department === lastSyncedDepartmentState.department &&
    payload.departmentName === lastSyncedDepartmentState.departmentName &&
    payload.team === lastSyncedDepartmentState.team &&
    payload.teamName === lastSyncedDepartmentState.teamName &&
    payload.groupType === lastSyncedDepartmentState.groupType
  ) {
    return
  }
  updateRegisterShared(payload)
  lastSyncedDepartmentState.department = payload.department
  lastSyncedDepartmentState.departmentName = payload.departmentName
  lastSyncedDepartmentState.team = payload.team
  lastSyncedDepartmentState.teamName = payload.teamName
  lastSyncedDepartmentState.groupType = payload.groupType
}

function updateDepartmentDerivedFields({ fromShared = false } = {}) {
  const department = selectedDepartment.value
  const teams = teamOptions.value
  let team = selectedTeam.value


  if (!state.s1_department) {
    if (state.s1_team) state.s1_team = ''
    team = null
  } else {
    const existsInOptions = teams.some(unit => unit.code === state.s1_team)
    if (state.s1_team && teams.length && !existsInOptions) {
      state.s1_team = ''
      team = null
    }
    if (!team && teams.length === 1) {
      state.s1_team = teams[0].code
      team = teams[0]
    }
  }

  if (department) {
    state.s1_departmentName =
      department.nameTh || department.nameEn || department.displayName || department.code || ''
  } else {
    state.s1_departmentName = ''
  }

  state.s1_teamName = team
    ? team.nameTh || team.nameEn || team.displayName || team.code || ''
    : ''

  const teamGroupType = team
    ? resolveGroupTypeLabel(team.groupType || team.groupTypeCode || '', '')
    : ''
  const departmentGroupType = resolveGroupTypeLabel(
    department?.groupType || department?.groupTypeCode || '',
    'Auto'
  )
  state.s1_groupType = teamGroupType || departmentGroupType || 'Auto'

  if (!hasGAS()) ensureUsersForDepartment(state.s1_team || state.s1_department)

  if (state.manager.id) {
    const managerValid = managerCandidates.value.some(
      candidate => candidate.code.toLowerCase() === state.manager.id.toLowerCase()
    )
    if (!managerValid) {
      state.manager.id = ''
      state.manager.name = ''
      state.manager.dept = ''
      state.manager.search = ''
    }
  }
  if (!fromShared) syncDepartmentSelectionToShared()
}

onMounted(async () => {
  await fetchDepartmentList()
  if (!state.members.length) {
    for (let i = 0; i < 4; i++) addMemberRow()
  }
  applyRoleConstraints()
  if (!hasGAS()) await ensureUsersForDepartment(activeDepartmentCode.value)
})

function hasGAS() { try { return !!(google && google.script && google.script.run) } catch { return false } }
async function fetchDepartmentList() {
  let loadedDepartments = false
  try {
    await departmentsStore.fetchDepartments()
    loadedDepartments = departmentsStore.hasRemoteData.value
  } catch (error) {
    console.warn('โหลดรายชื่อฝ่ายจาก Strapi ไม่สำเร็จ', error)
  }

  if (!loadedDepartments && hasGAS()) {
    google.script.run.withSuccessHandler((list) => {
      const items = Array.isArray(list) ? list : []
      const departmentMap = new Map()

      const ensureDepartment = (code, name = '', groupType = '') => {
        if (!code) return null
        const normalizedCode = String(code).trim()
        if (!normalizedCode) return null
        if (!departmentMap.has(normalizedCode)) {
          const displayName = name || normalizedCode
          departmentMap.set(normalizedCode, {
            code: normalizedCode,
            nameTh: name || '',
            nameEn: '',
            displayName,
            sortName: displayName.toLocaleLowerCase('th'),
            groupType: resolveGroupTypeLabel(groupType, 'Auto'),
            groupTypeCode: groupType || '',
            teams: [],
          })
        } else if (name) {
          const dep = departmentMap.get(normalizedCode)
          if (!dep.nameTh && !dep.nameEn) {
            dep.nameTh = name
            dep.displayName = name
            dep.sortName = name.toLocaleLowerCase('th')
          }
        }
        return departmentMap.get(normalizedCode)
      }

      items.forEach(item => {
        const deptCode =
          item?.code ?? item?.department_code ?? item?.departmentCode ?? item?.department ?? item?.dept ?? ''
        const deptName =
          item?.name ?? item?.name_th ?? item?.nameTh ?? item?.department_name ?? item?.departmentName ?? item?.dept_name ?? item?.deptName ?? ''
        const deptGroupType = item?.groupType ?? item?.group_type ?? item?.type ?? ''
        const department = ensureDepartment(deptCode, deptName, deptGroupType)

        const teamsList = Array.isArray(item?.teams) ? item.teams : []
        teamsList.forEach(teamItem => {
          const teamCode =
            teamItem?.code ?? teamItem?.team_code ?? teamItem?.teamCode ?? teamItem?.name ?? ''
          const teamName =
            teamItem?.name ?? teamItem?.name_th ?? teamItem?.nameTh ?? teamItem?.displayName ?? ''
          const teamGroupType = teamItem?.type_group ?? teamItem?.typeGroup ?? teamItem?.groupType ?? ''
          const displayName = (teamName || teamCode || '').toString().trim()
          if (!displayName) return
          const record = {
            code: (teamCode || displayName).toString().trim(),
            nameTh: teamName || '',
            nameEn: '',
            displayName,
            sortName: displayName.toLocaleLowerCase('th'),
            groupType: resolveGroupTypeLabel(teamGroupType, 'Auto'),
            groupTypeCode: teamGroupType || '',
            departmentCode: department?.code || '',
            departmentName: department?.displayName || '',
          }
          if (record.code) {
            const dep = department || ensureDepartment(record.departmentCode, record.departmentName, deptGroupType)
            if (dep) dep.teams.push(record)
          }
        })

        if (!teamsList.length) {
          const teamCode =
            item?.team_code ?? item?.teamCode ?? item?.team ?? ''
          const teamName =
            item?.team_name ?? item?.teamName ?? ''
          const teamGroupType = item?.type_group ?? item?.typeGroup ?? item?.groupType ?? ''
          if (teamCode || teamName) {
            const dep = ensureDepartment(
              deptCode || item?.dept || '',
              deptName || item?.dept_name || '',
              deptGroupType || item?.type || ''
            )
            if (dep) {
              const displayName = (teamName || teamCode || '').toString().trim()
              if (displayName) {
                dep.teams.push({
                  code: (teamCode || displayName).toString().trim(),
                  nameTh: teamName || '',
                  nameEn: '',
                  displayName,
                  sortName: displayName.toLocaleLowerCase('th'),
                  groupType: resolveGroupTypeLabel(teamGroupType, 'Auto'),
                  groupTypeCode: teamGroupType || '',
                  departmentCode: dep.code,
                  departmentName: dep.displayName,
                })
              }
            }
          }
        }
      })

      const departments = departmentMap.size ? Array.from(departmentMap.values()) : []
      if (departments.length) {
        departmentsStore.setDepartments(departments)
      }
      updateDepartmentDerivedFields()
    }).getTeamList()
  } else {
    updateDepartmentDerivedFields()
  }
}
function onDepartmentChange() {
  state.s1_team = ''
  state.advisors.splice(0, state.advisors.length, createAdvisor())
  closeAdvisorDropdown()
  state.manager.id = ''
  state.manager.name = ''
  state.manager.dept = ''
  state.manager.search = ''
  closeManagerDropdown()
  updateDepartmentDerivedFields()
}

watch(
  () => departmentOptions.value,
  () => {
    updateDepartmentDerivedFields()
  }
)
watch(
  () => advisorDepartmentCode.value,
  (code) => {
    loadAdvisorCandidates(code || '')
  },
  { immediate: true }
)
watch(
  () => teamOptions.value,
  () => {
    updateDepartmentDerivedFields()
  }
)
watch(
  () => state.s1_department,
  () => {
    updateDepartmentDerivedFields()
  }
)
watch(
  () => state.s1_team,
  () => {
    updateDepartmentDerivedFields()
  }
)
watch(
  () => activeDepartmentCode.value,
  (newCode) => {
    if (!hasGAS()) ensureUsersForDepartment(newCode)
  },
  { immediate: true }
)

/* ---------- MEMBERS ---------- */
function addMemberRow() {
  if (state.members.length >= MAX_MEMBERS) {
    alert(`เพิ่มสมาชิกได้ไม่เกิน ${MAX_MEMBERS} คน`)
    return
  }
  state.members.push({ uid: cryptoRandom(), empId: '', name: '', position: '' })
  applyRoleConstraints()
}
function removeMember(i) {
  if (state.members.length <= MIN_MEMBERS) {
    alert(`ต้องมีสมาชิกอย่างน้อย ${MIN_MEMBERS} คน`)
    return
  }
  state.members.splice(i, 1)
  applyRoleConstraints()
}
function cryptoRandom() {
  const a = new Uint32Array(2); crypto.getRandomValues(a)
  return `${a[0].toString(16)}${a[1].toString(16)}`
}
function createAdvisor() {
  return { uid: cryptoRandom(), id: '', name: '', dept: '', search: '' }
}
function addAdvisor() {
  if (state.advisors.length >= MAX_ADVISORS) {
    alert(`เพิ่มที่ปรึกษาได้ไม่เกิน ${MAX_ADVISORS} คน`)
    return
  }
  state.advisors.push(createAdvisor())
}
function removeAdvisor(i) {
  if (state.advisors.length <= MIN_ADVISORS) {
    if (MIN_ADVISORS > 0) alert(`ต้องมีที่ปรึกษาอย่างน้อย ${MIN_ADVISORS} คน`)
    return
  }
  state.advisors.splice(i, 1)
}
function applyRoleConstraints() {
  state.members.forEach((member, idx) => {
    if (idx < ROLE_LABELS.length) member.position = ROLE_LABELS[idx]
    else member.position = DEFAULT_MEMBER_ROLE
  })
}
function resetMemberRow(member, idx) {
  if (!member) return
  member.name = ''
  member.position = idx < ROLE_LABELS.length ? ROLE_LABELS[idx] : DEFAULT_MEMBER_ROLE
}
async function fillMember(i) {
  const row = state.members[i]
  if (!row) return
  const code = row.empId?.trim()
  if (!code) {
    resetMemberRow(row, i)
    return
  }
  const codeLower = code.toLowerCase()
  const duplicateLocal = state.members.some((member, idx) =>
    idx !== i && (member.empId?.trim()?.toLowerCase() || '') === codeLower
  )
  if (duplicateLocal) {
    alert('รหัสพนักงานนี้ถูกใช้แล้วในกลุ่ม')
    row.empId = ''
    resetMemberRow(row, i)
    return
  }
  if (hasGAS()) {
    google.script.run.withSuccessHandler(emp => {
      if (!emp) {
        resetMemberRow(state.members[i], i)
        return
      }
      const r = state.members[i]
      r.name = emp.FullName || ''
      r.position = emp.Position || (i < ROLE_LABELS.length ? ROLE_LABELS[i] : DEFAULT_MEMBER_ROLE)
      applyRoleConstraints()
    }).getEmployeeByCode(code)
  } else {
    await ensureUsersForDepartment(activeDepartmentCode.value)
    const r = state.members[i]
    if (!r) return
    const latestCode = r.empId?.trim()
    if (!latestCode) { resetMemberRow(r, i); return }
    const emp = findEmployeeByCode(latestCode)
    if (!emp) {
      r.empId = latestCode
      r.name = `พนักงาน ${latestCode}`
      r.position = i < ROLE_LABELS.length ? ROLE_LABELS[i] : DEFAULT_MEMBER_ROLE
      r.dept = state.s1_teamName || state.s1_departmentName || state.s1_team || state.s1_department || ''
      return
    }
    const duplicateResolved = state.members.some((member, idx2) =>
      idx2 !== i && (member.empId?.trim()?.toLowerCase() || '') === emp.codeLower
    )
    if (duplicateResolved) {
      alert('รหัสพนักงานนี้ถูกใช้แล้วในกลุ่ม')
      r.empId = ''
      resetMemberRow(r, i)
      return
    }
    r.empId = emp.code || r.empId
    r.name = emp.name || ''
    r.position = i < ROLE_LABELS.length ? ROLE_LABELS[i] : DEFAULT_MEMBER_ROLE
    applyRoleConstraints()
  }
}

/* ---------- ADVISOR & MANAGER ---------- */
async function lookupEmp(type, index = 0) {
  if (type === 'advisor') {
    const target = state.advisors[index]
    if (!target) return
    const code = target.id?.trim()
    if (!code) {
      target.name = ''
      target.dept = ''
      target.search = ''
      return
    }
    const codeLower = code.toLowerCase()
    const duplicate = state.advisors.some((advisor, idx) =>
      idx !== index && (advisor.id?.trim()?.toLowerCase() || '') === codeLower
    )
    if (duplicate) {
      alert('รหัสที่ปรึกษาซ้ำในกลุ่ม')
      target.id = ''
      target.name = ''
      target.dept = ''
      target.search = ''
      return
    }
    if (hasGAS()) {
      google.script.run.withSuccessHandler(emp => {
        const adv = state.advisors[index]
        if (!adv) return
        adv.id = code
        adv.name = emp?.FullName || '—'
        adv.dept = emp?.Dept || '—'
        adv.search = formatAdvisorDisplay(adv.id, adv.name, adv.dept)
      }).getEmployeeByCode(code)
    } else {
      await ensureUsersForDepartment(activeDepartmentCode.value)
      const emp = findEmployeeByCode(code)
      if (emp) {
        target.id = emp.code || target.id
        target.name = emp.name || ''
        target.dept = emp.dept || state.s1_teamName || state.s1_departmentName || state.s1_team || state.s1_department || ''
        target.search = formatAdvisorDisplay(target.id, target.name, target.dept)
      } else {
        target.id = code
        target.name = `พนักงาน ${code}`
        target.dept = state.s1_teamName || state.s1_departmentName || state.s1_team || state.s1_department || ''
        target.search = formatAdvisorDisplay(target.id, target.name, target.dept)
      }
      const normalized = target.id?.trim()?.toLowerCase() || ''
      if (normalized) {
        const duplicateAfter = state.advisors.some((advisor, idx) =>
          idx !== index && (advisor.id?.trim()?.toLowerCase() || '') === normalized
        )
        if (duplicateAfter) {
          alert('รหัสที่ปรึกษาซ้ำในกลุ่ม')
          target.id = ''
          target.name = ''
          target.dept = ''
          target.search = ''
        }
      }
    }
    return
  }

  const id = state.manager.id?.trim()
  if (!id) {
    state.manager.name = ''
    state.manager.dept = ''
    state.manager.search = ''
    return
  }
  if (hasGAS()) {
    google.script.run.withSuccessHandler(emp => {
      const n = emp?.FullName || '—', d = emp?.Dept || '—'
      state.manager.name = n
      state.manager.dept = d
      state.manager.search = formatAdvisorDisplay(state.manager.id, state.manager.name, state.manager.dept)
    }).getEmployeeByCode(id)
  } else {
    await ensureUsersForDepartment(activeDepartmentCode.value)
    const emp = findEmployeeByCode(id)
    if (emp) {
      state.manager.name = emp.name || ''
      state.manager.dept = emp.dept || state.s1_teamName || state.s1_departmentName || state.s1_team || state.s1_department || ''
    } else {
      state.manager.name = `พนักงาน ${id}`
      state.manager.dept = state.s1_teamName || state.s1_departmentName || state.s1_team || state.s1_department || ''
    }
    state.manager.search = formatAdvisorDisplay(state.manager.id, state.manager.name, state.manager.dept)
  }
}

/* ---------- LOGO PREVIEW ---------- */
function onLogoChange(e) {
  const files = Array.from(e.target.files || [])
  state.logoFiles = files
  ui.logoPreviewUrl = files.length ? URL.createObjectURL(files[0]) : ''
}

/* ---------- ACTIONS ---------- */
function setDisabled(v) { ui.disabled = v }
function goNext() { router.push('/minutes1') }
async function saveS1() {
  ui.saveMsg = ''
  if (!state.s1_date) return alert('กรุณาเลือก "วันที่ลงทะเบียน"')
  ui.saving = true; ui.saveMsg = 'กำลังบันทึก...'
  await new Promise(r => setTimeout(r, 800))
  updateRegisterShared(buildSharedPayload())
  ui.saveMsg = 'บันทึกสำเร็จ (โหมดทดสอบ)'
  ui.saving = false; ui.disabled = true
}
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
  @apply grid grid-cols-[minmax(0,1fr)_auto] gap-2.5 items-center max-[900px]:grid-cols-1;
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
