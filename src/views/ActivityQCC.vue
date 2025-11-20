<!-- ActivityQcc.vue -->
<template>
    <div class="flex flex-col lg:flex-row gap-4 items-start">
        <StepSidebar
            class="lg:sticky lg:top-6 flex-shrink-0"
            :sections="stepSections"
            current-key="activity"
        />
        <div id="activity_qcc" class="bg-[#f3fbfb] border-4 border-black rounded-xl p-4 flex-1">
        <!-- หัวเรื่อง + ผู้ใช้ -->
        <div class="flex flex-wrap items-start justify-between gap-3">
            <div class="text-[28px] font-extrabold">ใบจดทะเบียนทำกิจกรรม <b>QCC</b></div>
            <div class="text-right text-sm">
                <div class="font-bold">ผู้ใช้งาน</div>
                <div>{{ me.name }} ({{ me.empId }}) · {{ me.dept }}</div>
                <button class="btn bg-white mt-1" @click="logout">ออกจากระบบ</button>
            </div>
        </div>

        <!-- ฟอร์มส่วนบน -->
        <div class="grid" :class="gridHeader" aria-label="ส่วนหัวฟอร์ม">
            <div class="label">วันที่จดทะเบียนจัดตั้งกลุ่ม</div>
            <div class="w-full">
                <input v-model="f.dateGroupCreate" type="text" class="auto" placeholder="Auto" readonly />
            </div>

            <div class="label">ฝ่าย / Department</div>
            <div class="w-full grid grid-cols-[1fr_160px] gap-2">
                <input v-model="f.departmentText" class="ctrl" placeholder="กรอกชื่อฝ่าย/หน่วยงาน" />
                <input class="auto" :value="departmentAuto" readonly />
            </div>

            <div class="label">ที่ปรึกษา</div>
            <div class="w-full flex flex-wrap gap-2">
                <div
                    v-for="(advisor, idx) in advisors"
                    :key="advisor.uid || idx"
                    class="flex items-center gap-2 border-2 border-black rounded-xl px-3 py-2 bg-white text-sm font-semibold"
                >
                    <span>{{ advisor.name || advisor.id || '—' }}</span>
                    <button class="text-red-500 font-bold" type="button" @click="removeAdvisor(idx)">×</button>
                </div>
                <input
                    v-model="f.advisorInput"
                    class="ctrl flex-1 min-w-[200px]"
                    placeholder="กรอกชื่อที่ปรึกษาและกด Enter"
                    @keyup.enter="addAdvisorFromInput"
                />
            </div>

            <div class="label">เลขที่ทะเบียนกลุ่ม</div>
            <div class="w-full">
                <input v-model="f.groupNo" class="auto" placeholder="Auto" readonly />
            </div>

            <div class="label">ประเภทกลุ่ม</div>
            <div class="w-full">
                <select v-model="f.groupType" class="ctrl">
                    <option value="">— เลือกประเภท —</option>
                    <option>QCC</option>
                    <option>Office</option>
                    <option>Kaizen</option>
                </select>
            </div>

            <div class="label">จดทะเบียนกิจกรรมเรื่อง</div>
            <div class="w-full">
                <input v-model="f.topic" class="ctrl" placeholder="หัวข้อกิจกรรม" />
            </div>

            <div class="label">วันจดทะเบียนกลุ่มทำกิจกรรม</div>
            <div class="w-full">
                <input v-model="f.dateGroupRegister" type="date" class="ctrl" />
            </div>

            <div class="label">ชื่อกลุ่ม</div>
            <div class="w-full">
                <input v-model="f.groupName" class="ctrl" placeholder="ชื่อกลุ่ม" />
            </div>

            <!-- โซน textarea คู่ -->
            <div class="grid grid-cols-2 max-[1200px]:grid-cols-1 gap-4 mt-3 col-span-full">
                <div class="relative">
                    <div class="badge">เป้าหมายของกิจกรรม</div>
                    <textarea v-model="f.objective" class="textareabox" placeholder="ระบุเป้าหมาย/ตัวชี้วัด"></textarea>
                </div>
                <div class="relative">
                    <div class="badge">สาเหตุที่ก่อเรื่องนี้ขึ้นมาปฏิบัติกิจกรรม</div>
                    <textarea v-model="f.reason" class="textareabox"
                        placeholder="อธิบายที่มา/ปัญหาเบื้องต้น"></textarea>
                </div>
            </div>

            <!-- ระยะเวลาทำกิจกรรม (ตามภาพตัวอย่าง) -->
            <div class="panel mt-3 col-span-full">
                <!-- แถวบน -->
                <div class="grid items-center gap-2
                 grid-cols-[auto_48px_170px_48px_170px_1fr]
                 max-[900px]:grid-cols-1">
                    <div class="label mini">ระยะเวลาดำเนินกิจกรรม</div>

                    <div class="pill mini text-center">เริ่ม</div>
                    <input v-model="f.periodStart" type="date" class="ctrl h-9" />

                    <div class="pill mini text-center">ถึง</div>
                    <input v-model="f.periodEnd" type="date" class="ctrl h-9" />

                    <div class="note text-xs sm:text-sm">
                        <span class="font-semibold">*</span>
                        ระยะเวลาดำเนินกิจกรรม ไม่ควรเกิน <b>30</b> เมษายน
                        <span class="font-semibold">*</span>
                    </div>
                </div>

                <!-- แถวล่าง -->
                <div class="grid items-center gap-2
                 grid-cols-[auto_48px_170px_48px_170px_1fr]
                 max-[900px]:grid-cols-1">
                    <div class="label mini">กำหนดการประชุม</div>
                    <input v-model.number="f.timesPerMonthNum" type="number" min="1" class="ctrl h-9 text-center" />
                    <div class="text-sm font-semibold">ครั้ง/เดือน</div>
                </div>
            </div>

            <!-- ตารางสมาชิก -->
            <div class="panel mt-3 col-span-full">
                <div class="overflow-auto">
                    <table class="w-full border-collapse">
                        <thead>
                            <tr>
                                <th class="th w-[70px]">ลำดับ</th>
                                <th class="th w-[220px]">รหัสพนักงาน</th>
                                <th class="th">ชื่อ-สกุล</th>
                                <th class="th w-[230px]">ตำแหน่งของกิจกรรม</th>
                                <th class="th w-[220px]">ปฏิบัติกิจกรรมครั้งที่</th>
                                <th class="th w-[76px]"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(m, i) in f.members" :key="m.uid">
                                <td class="td text-center align-middle">{{ i + 1 }}</td>
                                <td class="td">
                                    <input v-model="m.empId" class="cell" placeholder="รหัส" @blur="fillMember(i)" />
                                </td>
                                <td class="td">
                                    <input v-model="m.name" class="cell bg-gray-50" readonly placeholder="(Auto)" />
                                </td>
                                <td class="td">
                                    <select v-model="m.role" class="cell">
                                        <option>หัวหน้ากลุ่ม</option>
                                        <option>รองหัวหน้ากลุ่ม</option>
                                        <option>เลขากลุ่ม</option>
                                        <option>สมาชิก</option>
                                    </select>
                                </td>
                                <td class="td">
                                    <select v-model="m.round" class="cell">
                                        <option v-for="n in 6" :key="n">{{ `เช่น ครั้งที่ ${n}` }}</option>
                                    </select>
                                </td>
                                <td class="td text-center">
                                    <button class="btn bg-[#ffecec]" @click="removeMember(i)">ลบ</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="mt-2 flex items-center gap-2">
                    <button class="btn bg-[#e5f9e7]" @click="addMember">เพิ่มสมาชิก +</button>
                    <span class="text-gray-500 text-sm">
                        * เริ่มต้นแถวตัวอย่าง 4 แถว (หัวหน้า/รองหัวหน้า/เลขา/สมาชิก)
                    </span>
                </div>
            </div>

            <!-- ปุ่มล่าง -->
            <div class="flex justify-end gap-2 mt-4 col-span-full">
                <button class="btn bg-white" @click="setEditable(true)">แก้ไข</button>
                <button class="btn bg-white" @click="clearForm">ล้างข้อมูล</button>
                <button class="btn bg-[#eafaf3]" @click="saveForm" :disabled="ui.saving">
                    {{ ui.saving ? 'กำลังบันทึก…' : '💾 บันทึก' }}
                </button>
                <button class="btn bg-[#d9fbe7]" @click="goNext">ถัดไป »»</button>
            </div>

            <div class="text-gray-600 mt-2 col-span-full">{{ ui.message }}</div>
        </div>
    </div>
    </div>
</template>

<script setup>
    import { reactive, computed, onMounted, watch } from 'vue'
    import { useRouter } from 'vue-router'
    import StepSidebar from '@/components/StepSidebar.vue'
    import { STEP1_SIDEBAR_SECTIONS } from '@/constants/qccSteps'
    import { useRegisterShared } from '@/stores/registerShared'
    import { useDepartments } from '@/stores/departments'
  const router = useRouter()
  const sharedRegister = useRegisterShared()
  const departmentsStore = useDepartments()
  const stepSections = STEP1_SIDEBAR_SECTIONS
  const MEMBER_ROLE_DEFAULTS = ['หัวหน้ากลุ่ม', 'รองหัวหน้ากลุ่ม', 'เลขากลุ่ม']
  const DEFAULT_ROUND_TEXT = 'เช่น ครั้งที่ 1'

/* --------------------- AUTH MOCK --------------------- */
function getAuth() {
    try { return JSON.parse(localStorage.getItem('auth.user') || 'null') || {} } catch { return {} }
}
const me = reactive(getAuth())
if (!me?.empId) {
    // ป้องกันเข้าตรงโดยไม่มี login
    router.replace('/login')
}

/* --------------------- STATE --------------------- */
function getDepartmentDisplay(code, fallback = '') {
    if (!code) return fallback || ''
    const found = departmentsStore.findByCode(code)
    if (found) {
        return found.displayName || found.nameTh || found.nameEn || found.code
    }
    return fallback || code
}

function resolveDepartmentDefault() {
    const explicit = (sharedRegister.teamName || sharedRegister.departmentName)?.trim()
    if (explicit) return explicit
    const code = sharedRegister.team || sharedRegister.department || ''
    if (code) return getDepartmentDisplay(code, me.dept || '')
    return me.dept || ''
}

const f = reactive({
    dateGroupCreate: 'Auto',
    departmentText: resolveDepartmentDefault(),
    coach: '',
    advisorInput: '',
    groupNo: 'Auto',
    groupType: '',
    dateGroupRegister: '',
    topic: '',
    groupName: '',
    objective: '',
    reason: '',
    periodStart: '',
    periodEnd: '',
    timesPerMonthNum: 1,   // ใช้ตัวเลขแทน ครั้ง/เดือน
    members: [],
})

const advisors = reactive([])

function memberRoleFallback(index) {
    return MEMBER_ROLE_DEFAULTS[index] || 'สมาชิก'
}

function applySharedToActivity() {
    const data = sharedRegister
    f.dateGroupCreate = data.registerDate || 'Auto'
    f.groupNo = data.groupNo || 'Auto'
    const deptCode = data.team || data.department || ''
    f.departmentText = data.teamName || data.departmentName || getDepartmentDisplay(deptCode, deptCode)
    f.groupType = data.groupType || ''
    f.groupName = data.groupName || ''
    f.dateGroupRegister = data.registerDate || ''
    const advisorNames = Array.isArray(data.advisors) ? data.advisors.map(a => a.name || a.id).filter(Boolean) : []
    f.coach = advisorNames.join(', ')
    const previousRounds = f.members.map(member => member.round)
    if (Array.isArray(data.members) && data.members.length) {
        const converted = data.members.map((member, idx) => ({
            uid: member.uid || cryptoId(),
            empId: member.empId || '',
            name: member.name || '',
            role: member.position || memberRoleFallback(idx),
            round: previousRounds[idx] || DEFAULT_ROUND_TEXT,
        }))
        f.members.splice(0, f.members.length, ...converted)
    }
}

watch(
    () => sharedRegister.lastUpdated,
    () => {
        applySharedToActivity()
    },
    { immediate: true }
)
watch(
    () => departmentsStore.departments.value,
    () => {
        const code = sharedRegister.team || sharedRegister.department || ''
        if (!code) return
        if (sharedRegister.teamName || sharedRegister.departmentName) return
        if (f.departmentText === code) {
            f.departmentText = getDepartmentDisplay(code, code)
        }
    }
)

const ui = reactive({
    message: '',
    saving: false,
})

/* --------------------- LAYOUT --------------------- */
const gridHeader = computed(() =>
    // 4 คอลัมน์: ป้าย | ช่อง | ป้าย | ช่อง  (จอเล็กเหลือ 2 คอลัมน์)
    'grid-cols-[auto_1fr_auto_1fr] max-[1200px]:grid-cols-[auto_1fr] gap-3 items-center'
)
const departmentAuto = computed(() => {
    const explicit = (sharedRegister.teamName || sharedRegister.departmentName)?.trim()
    if (explicit) return explicit
    const code = sharedRegister.team || sharedRegister.department || ''
    if (code) return getDepartmentDisplay(code, me.dept || 'Auto')
    return me.dept || 'Auto'
})

/* --------------------- MEMBERS --------------------- */
function addMember() {
    f.members.push({
        uid: cryptoId(),
        empId: '',
        name: '',
        role: ['หัวหน้ากลุ่ม', 'รองหัวหน้ากลุ่ม', 'เลขากลุ่ม', 'สมาชิก'][Math.min(f.members.length, 3)] || 'สมาชิก',
        round: 'เช่น ครั้งที่ 1',
    })
}
function removeMember(i) {
    f.members.splice(i, 1)
}
function cryptoId() {
    const a = new Uint32Array(2); crypto.getRandomValues(a)
    return `${a[0].toString(16)}${a[1].toString(16)}`
}
function fillMember(i) {
    const code = f.members[i].empId?.trim()
    if (!code) return
    // mock เติมชื่อจากรหัส
    f.members[i].name = `พนักงาน ${code}`
}

/* --------------------- ACTIONS --------------------- */
function clearForm() {
    Object.assign(f, {
        departmentText: resolveDepartmentDefault(), coach: '', groupType: '', dateGroupRegister: '',
        topic: '', groupName: '', objective: '', reason: '',
        periodStart: '', periodEnd: '',
        timesPerMonthNum: 1,
        members: [],
    })
    for (let i = 0; i < 4; i++) addMember()
    ui.message = ''
}

async function saveForm() {
    ui.message = ''
    if (!f.dateGroupRegister || !f.groupName || !f.topic) {
        ui.message = 'กรุณากรอก “วันจดทะเบียนกลุ่มทำกิจกรรม / ชื่อกลุ่ม / เรื่องกิจกรรม” ให้ครบ'
        return
    }
    ui.saving = true
    await new Promise(r => setTimeout(r, 700)) // mock
    ui.saving = false
    ui.message = 'บันทึกสำเร็จ (โหมดทดสอบ)'
    localStorage.setItem('qcc.activity.form', JSON.stringify(f))
}

function goNext() {
    router.push('/assess-pre')
}

function setEditable() {
    ui.message = 'เปิดให้แก้ไขข้อมูลแล้ว'
}

function logout() {
    localStorage.removeItem('auth.user')
    router.replace('/login')
}

/* --------------------- INIT --------------------- */
onMounted(() => {
    departmentsStore.fetchDepartments().catch(() => {})
    if (!f.members.length) {
        for (let i = 0; i < 4; i++) addMember()
    }
})
</script>

<style scoped>
@reference "tailwindcss";

/* ป้ายเหลือง: รองรับหลายบรรทัด ไม่ซ้อน */
.label {
    @apply bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1 font-bold text-sm leading-tight flex items-center justify-center text-center min-h-[44px] whitespace-normal break-words;
}

.label.mini {
    @apply px-2 py-1 h-10 rounded-xl text-sm font-bold leading-tight;
}

/* กล่องควบคุม */
.ctrl {
    @apply w-full px-2.5 h-10 border-2 border-black rounded-xl bg-white text-sm;
}

/* Auto box */
.auto {
    @apply w-full bg-white border-2 border-black rounded-xl px-3 h-10 flex items-center text-sm;
}

/* panel & buttons */
.panel {
    @apply border-[3px] border-black rounded-xl p-2.5 bg-white;
}

.btn {
    @apply border-2 border-black rounded-xl px-3.5 py-2 font-bold whitespace-nowrap;
}

/* table */
.th {
    @apply border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left text-sm;
}

.td {
    @apply border-2 border-black px-2 py-1.5;
}

.cell {
    @apply w-full px-2 py-1.5 border border-gray-300 rounded-md text-sm;
}

/* textarea & floating badge */
.textareabox {
    @apply w-full min-h-[180px] bg-white border-[3px] border-black rounded-xl p-3 outline-none text-sm;
}

.badge {
    @apply absolute -top-4 left-4 bg-[#fff2b8] border-2 border-black rounded-xl px-3 py-1 font-bold text-sm leading-tight whitespace-nowrap;
}

/* เม็ดคำ (เริ่ม/ถึง) */
.pill {
    @apply bg-[#fff2b8] border-2 border-black rounded-xl px-3 py-1 h-10 font-bold flex items-center justify-center whitespace-nowrap;
}

.pill.mini {
    @apply h-10 px-3 py-1;
}

/* ข้อความกำกับทางขวา */
.note {
    @apply pl-2;
}

/* ระยะห่าง grid ทั่วหน้า */
#activity_qcc .grid {
    @apply gap-3;
}
</style>
