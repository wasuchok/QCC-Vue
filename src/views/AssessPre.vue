<!-- AssessPre.vue -->
<template>
    <div class="flex flex-col lg:flex-row gap-4 items-start">
        <StepSidebar
            class="lg:sticky lg:top-6 flex-shrink-0"
            :sections="stepSections"
            current-key="assess-pre"
        />
        <div id="assess_pre" class="min-h-screen bg-slate-50 flex-1">
        <div class="mx-auto max-w-[1200px] p-4 md:p-6">
            <!-- Header Card -->
            <div class="bg-white/90 backdrop-blur border border-slate-200 rounded-2xl p-5 md:p-6 shadow-sm">
                <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-3">
                    <div>
                        <h1 class="text-2xl md:text-[28px] font-extrabold tracking-tight text-slate-900">
                            ประเมินสมาชิกก่อนทำกิจกรรม (Pre-Assessment)
                        </h1>
                        <p class="text-slate-500 text-sm md:text-[13px] mt-1">
                            กรอกคะแนน 0–5 ต่อหัวข้อ | กรอกรหัสพนักงานที่หัวคอลัมน์ ระบบจะเติมชื่ออัตโนมัติ
                        </p>
                    </div>
                    <div class="flex flex-wrap gap-2 justify-end">
                        <button class="btn ghost" @click="goBack">ย้อนกลับ</button>
                        <button class="btn soft" @click="disabled = false">ปลดล็อกแก้ไข</button>
                        <button class="btn" @click="save">💾 บันทึก</button>
                        <!-- ✅ ปุ่มหน้าถัดไป -->
                        <button class="btn primary" @click="goNext">ถัดไป »</button>
                    </div>
                </div>

                <!-- Controls -->
                <div class="mt-4 flex flex-wrap items-center gap-2 justify-between">
                    <div class="text-slate-500 text-sm">
                        <span class="font-semibold" :class="disabled ? 'text-amber-700' : 'text-emerald-700'">
                            {{ disabled ? '🔒 ล็อกแบบฟอร์ม' : '✏️ แก้ไขได้' }}
                        </span>
                    </div>
                    <div class="flex items-center gap-2">
                        <button class="btn soft" @click="addPerson" :disabled="disabled">+ เพิ่มผู้ถูกประเมิน</button>
                        <button class="btn ghost" @click="removeLast" :disabled="disabled || people.length <= 1">–
                            ลบคนท้ายสุด</button>
                    </div>
                </div>
            </div>

            <!-- X Axis -->
            <SectionTitle class="mt-6" label="วิธีหาแกน X (ด้านความสามารถ)" />
            <div class="card scroll-x">
                <table class="assess-table">
                    <thead>
                        <tr>
                            <th class="w-[42%] text-left">หัวข้อประเมิน (X)</th>
                            <th v-for="(p, i) in people" :key="'xh' + p.uid" class="personHdr">
                                <div class="hdr">
                                    <input class="emp" :disabled="disabled" :placeholder="`รหัสพนักงาน`"
                                        v-model="p.empId" @blur="lookup(i)" />
                                    <div class="name">{{ p.name || '—' }}</div>
                                    <button class="del" :disabled="disabled || people.length <= 1"
                                        @click="removeAt(i)">×</button>
                                </div>
                            </th>
                            <th class="w-[120px]">เฉลี่ยหัวข้อนี้</th>
                        </tr>
                        <tr>
                            <td class="tip text-left" :colspan="people.length + 2">กรอกคะแนน 0–5</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(text, r) in CRITERIA_X" :key="'xr' + r">
                            <td class="left criteriaCell">{{ text }}</td>
                            <td v-for="(p, c) in people" :key="'xc' + p.uid">
                                <input type="number" step="0.5" min="0" max="5" class="score" :disabled="disabled"
                                    v-model="scores.x[r][c]" />
                            </td>
                            <td>{{ fmt(rowAvg('x', r)) }}</td>
                        </tr>

                        <tr>
                            <td class="left font-bold bg-slate-50">รวม</td>
                            <td v-for="(_, c) in people" :key="'xsum' + c">{{ fmt(colSum('x', c)) }}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="left font-bold bg-slate-50">เฉลี่ย</td>
                            <td v-for="(_, c) in people" :key="'xavg' + c">{{ fmt(colAvg('x', c)) }}</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Note -->
            <p class="text-slate-500 text-xs text-center mt-2">
                * รวม/เฉลี่ยต่อคน และค่าเฉลี่ยต่อหัวข้อคำนวณอัตโนมัติ
            </p>

            <!-- Y Axis -->
            <SectionTitle class="mt-6" label="วิธีหาแกน Y (พฤติกรรม/ทัศนคติ)" />
            <div class="card scroll-x">
                <table class="assess-table">
                    <thead>
                        <tr>
                            <th class="w-[42%] text-left">หัวข้อประเมิน (Y)</th>
                            <th v-for="(p, i) in people" :key="'yh' + p.uid" class="personHdr">
                                <div class="hdr">
                                    <input class="emp" :disabled="disabled" :placeholder="`รหัสพนักงาน`"
                                        v-model="p.empId" @blur="lookup(i)" />
                                    <div class="name">{{ p.name || '—' }}</div>
                                    <button class="del" :disabled="disabled || people.length <= 1"
                                        @click="removeAt(i)">×</button>
                                </div>
                            </th>
                            <th class="w-[120px]">เฉลี่ยหัวข้อนี้</th>
                        </tr>
                        <tr>
                            <td class="tip text-left" :colspan="people.length + 2">กรอกคะแนน 0–5</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(text, r) in CRITERIA_Y" :key="'yr' + r">
                            <td class="left criteriaCell">{{ text }}</td>
                            <td v-for="(p, c) in people" :key="'yc' + p.uid">
                                <input type="number" step="0.5" min="0" max="5" class="score" :disabled="disabled"
                                    v-model="scores.y[r][c]" />
                            </td>
                            <td>{{ fmt(rowAvg('y', r)) }}</td>
                        </tr>

                        <tr>
                            <td class="left font-bold bg-slate-50">รวม</td>
                            <td v-for="(_, c) in people" :key="'ysum' + c">{{ fmt(colSum('y', c)) }}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="left font-bold bg-slate-50">เฉลี่ย</td>
                            <td v-for="(_, c) in people" :key="'yavg' + c">{{ fmt(colAvg('y', c)) }}</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Footer -->
            <div class="mt-5 flex flex-wrap gap-2 justify-end items-center">
                <span class="text-slate-500 mr-auto">{{ saveMsg }}</span>
                <button class="btn ghost" @click="goBack">« ย้อนกลับ</button>
                <button class="btn soft" @click="disabled = false">แก้ไข</button>
                <button class="btn" @click="save">💾 บันทึก</button>
                <button class="btn" @click="goGraph">ดูกราฟ »</button>
                <!-- ✅ ปุ่มหน้าถัดไป -->
                <button class="btn primary" @click="goNext">ถัดไป »</button>
            </div>
        </div>
    </div>
    </div>
</template>

<script setup>
    import { reactive, ref, onMounted, defineComponent, watch } from 'vue'
    import { useRouter } from 'vue-router'
    import StepSidebar from '@/components/StepSidebar.vue'
    import { STEP1_SIDEBAR_SECTIONS } from '@/constants/qccSteps'
    import { useRegisterShared } from '@/stores/registerShared'
    
    /* ---------- Router ---------- */
    const router = useRouter()
  const stepSections = STEP1_SIDEBAR_SECTIONS
  const sharedRegister = useRegisterShared()
const goBack = () => router.back()
const goGraph = () => router.push('/minutes3')
/* ✅ หน้าถัดไป: ปรับ path ตาม flow ของคุณได้เลย */
const goNext = () => router.push('/minutes2')

/* ---------- SectionTitle (local component) ---------- */
const SectionTitle = defineComponent({
    name: 'SectionTitle',
    props: { label: { type: String, required: true } },
    template: `
    <div class="sectionTitle">
      <div class="sectionPill">{{ label }}</div>
    </div>
  `
})

/* ---------- Criteria ---------- */
const CRITERIA_X = [
    '1) เข้าใจต้นคอของปัญหา / เลือกปัญหา / คำศัพท์พื้นฐาน QCC',
    '2) เข้าใจ QC Story แบบ P–D–C–A',
    '3) ใช้เครื่องมือ/เทคนิค QC (เช่น 7 Tools, ECRS ฯลฯ)',
    '4) ความสามารถหลากหลาย (เช่น 5G, Fishbone)',
    '5) แผน/เป้าหมายเพื่อพัฒนาทักษะ–ความรู้ของสมาชิก'
]
const CRITERIA_Y = [
    '1) ทัศนคติและความมุ่งมั่นต่อกิจกรรม',
    '2) การทำงานเป็นทีมและการสื่อสาร',
    '3) ความรับผิดชอบต่อบทบาทหน้าที่',
    '4) ความคิดริเริ่มสร้างสรรค์/การนำเสนอ',
    '5) วินัยในการเข้าร่วม/ติดตามงาน'
]

/* ---------- State ---------- */
const people = reactive(Array.from({ length: 4 }, () => ({ uid: uid(), empId: '', name: '', dept: '' })))

const scores = reactive({
    x: CRITERIA_X.map(() => people.map(() => '')),
    y: CRITERIA_Y.map(() => people.map(() => ''))
})

function rebuildScoresColumns(prevIndexMap) {
    const columnCount = people.length
    const rebuild = (matrix) => {
        const existingRows = matrix.map(row => [...row])
        const nextRows = existingRows.map(row => {
            const nextRow = new Array(columnCount).fill('')
            people.forEach((person, colIdx) => {
                const prevIdx = prevIndexMap.get(person.uid)
                if (prevIdx != null && prevIdx < row.length) {
                    nextRow[colIdx] = row[prevIdx]
                }
            })
            return nextRow
        })
        matrix.splice(0, matrix.length, ...nextRows)
    }
    rebuild(scores.x)
    rebuild(scores.y)
}

function syncMembersFromShared() {
    const members = Array.isArray(sharedRegister.members) ? sharedRegister.members : []
    if (!members.length) return
    const prevIndexMap = new Map(people.map((p, idx) => [p.uid, idx]))
    const nextPeople = members.map(member => ({
        uid: member.uid || uid(),
        empId: member.empId || '',
        name: member.name || '',
        dept: member.dept || '',
    }))
    people.splice(0, people.length, ...nextPeople)
    rebuildScoresColumns(prevIndexMap)
}

watch(
    () => sharedRegister.lastUpdated,
    () => {
        syncMembersFromShared()
    },
    { immediate: true }
)

const disabled = ref(false)
const saveMsg = ref('')

/* ---------- Helpers ---------- */
function uid() {
    const a = new Uint32Array(2); crypto.getRandomValues(a)
    return `${a[0].toString(16)}${a[1].toString(16)}`
}

function addPerson() {
    people.push({ uid: uid(), empId: '', name: '', dept: '' })
    scores.x.forEach(row => row.push(''))
    scores.y.forEach(row => row.push(''))
}

function removeLast() {
    if (people.length <= 1) return
    const idx = people.length - 1
    removeAt(idx)
}

function removeAt(idx) {
    if (people.length <= 1) return
    people.splice(idx, 1)
    scores.x.forEach(row => row.splice(idx, 1))
    scores.y.forEach(row => row.splice(idx, 1))
}

function lookup(i) {
    const id = (people[i].empId || '').trim()
    if (!id) { people[i].name = ''; people[i].dept = ''; return }
    if (hasGAS()) {
        // eslint-disable-next-line no-undef
        google.script.run.withSuccessHandler(emp => {
            people[i].name = emp?.FullName || ''
            people[i].dept = emp?.Dept || ''
        }).getEmployeeByCode(id)
    } else {
        // โหมดทดสอบ
        people[i].name = `พนักงาน ${id}`
        people[i].dept = 'ฝ่ายตัวอย่าง'
    }
}

function hasGAS() {
    try { return !!(google && google.script && google.script.run) } catch { return false }
}

/* ---------- Math ---------- */
const num = v => { const n = parseFloat(v); return isNaN(n) ? null : n }
const avg = arr => {
    const xs = arr.map(num).filter(v => v != null)
    return xs.length ? xs.reduce((a, b) => a + b, 0) / xs.length : null
}
const sum = arr => {
    const xs = arr.map(num).filter(v => v != null)
    return xs.length ? xs.reduce((a, b) => a + b, 0) : null
}
const fmt = v => (v == null ? '' : Number(v).toFixed(1))

function rowAvg(sec, r) { return avg(scores[sec][r]) }
function colSum(sec, c) { return sum(scores[sec].map(row => row[c])) }
function colAvg(sec, c) { return avg(scores[sec].map(row => row[c])) }

/* ---------- Save ---------- */
async function save() {
    saveMsg.value = ''
    disabled.value = true
    const payload = {
        people: JSON.parse(JSON.stringify(people)),
        scores: JSON.parse(JSON.stringify(scores)),
        criteriaX: CRITERIA_X,
        criteriaY: CRITERIA_Y
    }
    await new Promise(r => setTimeout(r, 500)) // mock
    console.log('Assess Pre payload:', payload)
    saveMsg.value = 'บันทึกสำเร็จ (โหมดทดสอบ)'
}

/* ---------- Init ---------- */
onMounted(() => {
    // ready
})
</script>

<style scoped>
@reference "tailwindcss";

/* --- Reusable --- */
.card {
    @apply bg-white/90 backdrop-blur border border-slate-200 rounded-2xl p-4 md:p-5 shadow-sm;
}

.scroll-x {
    @apply overflow-x-auto;
}

.btn {
    @apply inline-flex items-center gap-1.5 rounded-xl border border-slate-300 px-3.5 py-2 font-semibold text-[14px] text-slate-800 bg-slate-100 hover:bg-slate-200 transition;
}

.btn.soft {
    @apply bg-emerald-50 border-emerald-200 text-emerald-800 hover:bg-emerald-100;
}

.btn.ghost {
    @apply bg-white text-slate-700 border-slate-300 hover:bg-slate-50;
}

.btn.primary {
    @apply bg-indigo-600 border-indigo-600 text-white hover:bg-indigo-700;
}

/* --- Section Title --- */
.sectionTitle {
    @apply flex justify-center;
}

.sectionPill {
    @apply inline-flex items-center gap-2 bg-white border-2 border-slate-900 rounded-xl px-3.5 py-1.5 font-extrabold text-slate-900;
}

/* --- Table --- */
.assess-table {
    @apply w-full min-w-[1100px] border-collapse text-[14px];
}

.assess-table th,
.assess-table td {
    @apply border border-slate-300 p-2 align-middle text-center;
}

.assess-table thead th {
    @apply bg-slate-50 font-bold;
}

.left {
    @apply text-left;
}

.criteriaCell {
    @apply bg-slate-50;
}

.tip {
    @apply text-slate-500 text-xs bg-slate-50;
}

.score {
    @apply w-20 text-center rounded-md border border-slate-300 px-2 py-1 outline-none focus:ring-2 focus:ring-indigo-200;
}

/* --- Person header cell --- */
.personHdr .hdr {
    @apply relative flex flex-col items-center gap-1;
}

.personHdr .emp {
    @apply w-24 rounded-md border border-slate-300 px-2 py-1 text-center outline-none focus:ring-2 focus:ring-indigo-200;
}

.personHdr .name {
    @apply text-[12px] text-slate-600 min-h-[18px];
}

.personHdr .del {
    @apply absolute -top-2 right-0 w-5 h-5 leading-4 text-center rounded-md border border-slate-400 bg-white text-slate-700 hover:bg-slate-50;
}
</style>
