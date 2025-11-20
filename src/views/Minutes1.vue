<!-- MinutesQCC.vue -->
<template>
    <div class="flex flex-col lg:flex-row gap-4 items-start">
        <RegisterFlowSidebar
            class="lg:sticky lg:top-6 flex-shrink-0"
            :steps="registerSidebarSteps"
            current-key="minutes1"
        />
        <div class="bg-[#f3fbfb] border-4 border-black rounded-xl p-3.5 flex-1" id="mn_form" data-sub="บันทึกการประชุม QCC">
        <!-- Title -->
        <div class="text-[26px] font-extrabold text-center my-1.5 leading-tight">
            บันทึกการประชุมกิจกรรมกลุ่ม <b>QCC</b><br />
            <span class="text-gray-500 font-semibold text-[0.9em]">Minutes of QCC Activity Meeting</span>
        </div>

        <!-- Header grid -->
        <div class="grid gap-2.5 items-center"
            :class="['grid-cols-[200px_1fr_200px_1fr]', 'max-[1200px]:grid-cols-[200px_1fr]']">
            <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">ชื่อกลุ่ม</div>
            <input v-model="state.groupName"
                class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                :disabled="ui.disabled" placeholder="ชื่อกลุ่ม" />

            <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">วันที่ประชุม</div>
            <input v-model="state.date" type="date"
                class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                :disabled="ui.disabled" />

            <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">สถานที่</div>
            <input v-model="state.place"
                class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                :disabled="ui.disabled" placeholder="Room S" />

            <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">เริ่มเวลา</div>
            <input v-model="state.start"
                class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                :disabled="ui.disabled" placeholder="09:00" />

            <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">เสร็จเวลา</div>
            <input v-model="state.end"
                class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                :disabled="ui.disabled" placeholder="10:30" />
        </div>

        <!-- Attendees -->
        <div class="border-[3px] border-black rounded-xl p-2.5 bg-white mt-3">
            <div class="flex items-center gap-2.5">
                <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">ผู้เข้าร่วมประชุม
                </div>
                <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-[#eef2ff] font-bold" @click="addAttendee"
                    :disabled="ui.disabled">
                    + เพิ่มเติม
                </button>
            </div>

            <table class="w-full border-collapse mt-1.5">
                <thead>
                    <tr>
                        <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left w-[120px]">รหัสพนักงาน</th>
                        <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left">ชื่อ – นามสกุล (Auto)</th>
                        <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left w-[200px]">หน่วยงาน (Auto)
                        </th>
                        <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] w-[72px]"></th>
                    </tr>
                </thead>
                <tbody id="attBody">
                    <tr v-for="(a, idx) in state.attendees" :key="a.uid">
                        <td class="border-2 border-black px-2 py-1.5">
                            <input v-model="a.empId" @blur="fillAttendee(idx)" :disabled="ui.disabled"
                                class="w-full px-2 py-1.5 border border-gray-300 rounded-md disabled:bg-gray-100"
                                placeholder="รหัส" />
                        </td>
                        <td class="border-2 border-black px-2 py-1.5">
                            <input v-model="a.name" readonly placeholder="(Auto)"
                                class="w-full px-2 py-1.5 border border-gray-300 rounded-md bg-gray-50" />
                        </td>
                        <td class="border-2 border-black px-2 py-1.5">
                            <input v-model="a.dept" readonly placeholder="(Auto)"
                                class="w-full px-2 py-1.5 border border-gray-300 rounded-md bg-gray-50" />
                        </td>
                        <td class="border-2 border-black px-2 py-1.5">
                            <button class="border-2 border-black rounded-xl px-3 py-2 bg-[#ffecec] font-bold"
                                @click="removeAttendee(idx)" :disabled="ui.disabled">
                                ลบ
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Topic -->
        <div class="grid gap-2.5 items-center mt-3" :class="['grid-cols-[200px_1fr]']">
            <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">หัวข้อการประชุม</div>
            <input v-model="state.topic"
                class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                :disabled="ui.disabled" />
        </div>

        <!-- Detail + files -->
        <div class="border-[3px] border-black rounded-xl p-2.5 bg-white mt-2.5">
            <div class="inline-block bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold mb-1.5">
                รายละเอียดการประชุม</div>
            <textarea v-model="state.detail"
                class="w-full min-h-[160px] px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                :disabled="ui.disabled" placeholder="รายละเอียด/ข้อเสนอ..."></textarea>

            <div class="mt-2">
                <label
                    class="inline-block text-center border-2 border-black rounded-xl px-3.5 py-2 bg-[#eafaf3] font-bold cursor-pointer">
                    📎 คลิกเพื่อแนบไฟล์
                    <input type="file" multiple class="hidden" :disabled="ui.disabled" @change="onFilesChange" />
                </label>
                <div v-if="ui.fileNames.length" class="text-sm text-gray-500 mt-1">
                    ไฟล์แนบ: {{ ui.fileNames.join(', ') }}
                </div>
            </div>
        </div>

        <!-- Footer buttons -->
        <div class="flex gap-2 justify-end mt-3 items-center">
            <span class="text-gray-500 font-bold mr-auto">
                {{ ui.disabled ? '🔒 ล็อกไว้' : '✏️ แก้ไขได้' }}
            </span>

            <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-white font-bold" @click="prevRouter">
                « ย้อนกลับ
            </button>

            <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-white font-bold" @click="setDisabled(false)">
                แก้ไข
            </button>

            <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-[#eafaf3] font-bold" @click="saveMinutes"
                :disabled="ui.saving">
                {{ ui.saving ? 'กำลังบันทึก…' : '💾 บันทึก' }}
            </button>

            <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-[#eafaf3] font-bold" @click="goNext">
                ถัดไป »
            </button>
        </div>

        <div class="text-gray-500 mt-1.5">{{ ui.saveMsg }}</div>
    </div>
    </div>
</template>

<script setup>
  import { onMounted, reactive, watch } from 'vue'
  import { useRouter } from 'vue-router'
  import RegisterFlowSidebar from '@/components/RegisterFlowSidebar.vue'
  import { REGISTER_SIDEBAR_STEPS } from '@/constants/qccSteps'
  import { useRegisterShared } from '@/stores/registerShared'
  import { useMinutes1Shared, updateMinutes1Shared } from '@/stores/minutes1Shared'
  
  const router = useRouter()
  const sharedRegister = useRegisterShared()
  const sharedMinutes1 = useMinutes1Shared()
  const registerSidebarSteps = REGISTER_SIDEBAR_STEPS

function prevRouter() {
    router.go(-1)
}

/* ---------- State ---------- */
const state = reactive({
    // head
    groupName: '',
    date: '',
    place: 'Room S',
    start: '09:00',
    end: '10:30',
    topic: '',
    detail: '',
    // attendees
    attendees: [],
    // files
    files: /** @type {File[]} */ ([]),
})

function syncGroupNameFromShared() {
    const nextName = sharedRegister.groupName || ''
    if (state.groupName !== nextName) {
        state.groupName = nextName
    }
}

watch(
    () => sharedRegister.lastUpdated,
    () => {
        syncGroupNameFromShared()
    },
    { immediate: true }
)

const ui = reactive({
    disabled: false,
    saving: false,
    saveMsg: '',
    fileNames: /** @type {string[]} */ ([]),
})

function hydrateStateFromMinutesShared() {
    const hasPersisted = !!sharedMinutes1.lastUpdated
    state.groupName = sharedMinutes1.groupName || sharedRegister.groupName || state.groupName
    state.date = sharedMinutes1.date || ''
    state.place = hasPersisted ? (sharedMinutes1.place || '') : (sharedMinutes1.place || 'Room S')
    state.start = hasPersisted ? (sharedMinutes1.start || '') : (sharedMinutes1.start || '09:00')
    state.end = hasPersisted ? (sharedMinutes1.end || '') : (sharedMinutes1.end || '10:30')
    state.topic = sharedMinutes1.topic || ''
    state.detail = sharedMinutes1.detail || ''

    if (sharedMinutes1.attendees.length) {
        const revived = sharedMinutes1.attendees.map(row => ({
            uid: row.uid || cryptoRandom(),
            empId: row.empId || '',
            name: row.name || '',
            dept: row.dept || '',
        }))
        state.attendees.splice(0, state.attendees.length, ...revived)
    } else {
        state.attendees.splice(0, state.attendees.length)
    }

    ui.fileNames = sharedMinutes1.fileNames.length ? [...sharedMinutes1.fileNames] : []
}

/* ---------- Init ---------- */
onMounted(() => {
    hydrateStateFromMinutesShared()
    if (!state.attendees.length) {
        for (let i = 0; i < 3; i++) addAttendee()
    }
})

/* ---------- Helpers ---------- */
function setDisabled(v) { ui.disabled = v }

function hasGAS() {
    try { return !!(google && google.script && google.script.run) } catch { return false }
}

function safeGetValueById(id) {
    const el = typeof document !== 'undefined' ? document.getElementById(id) : null
    return el && 'value' in el ? String(el.value || '').trim() : ''
}

function cryptoRandom() {
    if (typeof crypto !== 'undefined' && crypto.getRandomValues) {
        const a = new Uint32Array(2); crypto.getRandomValues(a)
        return `${a[0].toString(16)}${a[1].toString(16)}`
    }
    return String(Math.random()).slice(2)
}

function buildMinutesSharedPayload() {
    return {
        groupName: state.groupName?.trim() || '',
        date: state.date || '',
        place: state.place?.trim() || '',
        start: state.start?.trim() || '',
        end: state.end?.trim() || '',
        topic: state.topic?.trim() || '',
        detail: state.detail?.trim() || '',
        attendees: state.attendees.map(row => ({
            uid: row.uid || cryptoRandom(),
            empId: row.empId?.trim() || '',
            name: row.name?.trim() || '',
            dept: row.dept?.trim() || '',
        })),
        fileNames: ui.fileNames.slice(),
    }
}

function persistMinutesSharedFromState() {
    updateMinutes1Shared(buildMinutesSharedPayload())
}

/* ---------- Attendees ---------- */
function addAttendee() {
    state.attendees.push({ uid: cryptoRandom(), empId: '', name: '', dept: '' })
}

function removeAttendee(idx) {
    state.attendees.splice(idx, 1)
}

function fillAttendee(idx) {
    const code = state.attendees[idx]?.empId?.trim()
    if (!code) return

    if (hasGAS()) {
        // eslint-disable-next-line no-undef
        google.script.run.withSuccessHandler((emp) => {
            if (!emp) return
            const row = state.attendees[idx]
            row.name = emp?.FullName || ''
            row.dept = emp?.Dept || ''
        }).getEmployeeByCode(code)
    } else {
        // mock ทดสอบโลคัล
        const row = state.attendees[idx]
        row.name = 'สมชาย ใจดี'
        row.dept = 'ฝ่ายผลิต'
    }
}

/* ---------- Files ---------- */
function onFilesChange(e) {
    const files = Array.from(e.target.files || [])
    state.files = files
    ui.fileNames = files.map(f => f.name)
}

function fileToBase64(file) {
    return new Promise((resolve, reject) => {
        const r = new FileReader()
        r.onload = ev => resolve(String(ev.target.result || ''))
        r.onerror = reject
        r.readAsDataURL(file)
    })
}

async function filesToBase64(files) {
    const out = []
    for (const f of files) {
        const data = await fileToBase64(f)
        out.push({ name: f.name, type: f.type, data })
    }
    return out
}


function goNext() {
    if (typeof window !== 'undefined' && typeof window.openPage === 'function') {
        window.openPage('summary-qcc', 'สรุปการดำเนินกิจกรรม QCC')
    } else {
        router.push('/summary-qcc')
    }
}

function handleSaveSuccess(message) {
    ui.saveMsg = message
    setDisabled(true)
    ui.saving = false
    persistMinutesSharedFromState()
}

/* ---------- Save ---------- */
async function saveMinutes() {
    ui.saveMsg = ''
    if (!state.date) {
        alert('กรุณาเลือก "วันที่ประชุม"')
        return
    }

    const department = safeGetValueById('global_department') || safeGetValueById('global_team')
    const head = {
        groupNo: safeGetValueById('global_groupNo'),
        department,
        team: department,
        groupName: state.groupName?.trim(),
        date: state.date, // ใช้ค่าที่ผู้ใช้เลือกเอง
        place: state.place?.trim(),
        start: state.start?.trim(),
        end: state.end?.trim(),
        topic: state.topic?.trim(),
    }

    const attendees = state.attendees.map(a => ({
        empId: a.empId?.trim(),
        name: a.name?.trim(),
        dept: a.dept?.trim(),
    }))

    ui.saving = true
    ui.saveMsg = 'กำลังบันทึก...'

    try {
        let files = []
        if (state.files?.length) {
            files = await filesToBase64(state.files)
        }

        if (hasGAS()) {
            // eslint-disable-next-line no-undef
            google.script.run
                .withSuccessHandler(() => {
                    handleSaveSuccess('บันทึกสำเร็จ')
                })
                .withFailureHandler((err) => {
                    ui.saveMsg = `บันทึกล้มเหลว: ${err?.message || err}`
                    ui.saving = false
                })
                .submitStep('Step 1', 'บันทึกการประชุม QCC', { head, attendees, detail: state.detail?.trim() }, files)
        } else {
            // โหมดทดสอบ
            console.log('Submit payload:', { head, attendees, detail: state.detail, files })
            await new Promise(r => setTimeout(r, 600))
            handleSaveSuccess('บันทึกสำเร็จ (โหมดทดสอบ)')
        }
    } catch (e) {
        ui.saveMsg = `เกิดข้อผิดพลาด: ${e?.message || e}`
        ui.saving = false
    }
}
</script>
