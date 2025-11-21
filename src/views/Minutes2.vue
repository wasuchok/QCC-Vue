<template>
    <div class="flex flex-col lg:flex-row gap-4 items-start">
        <StepSidebar class="lg:sticky lg:top-6 flex-shrink-0" :sections="stepSections" current-key="minutes2" />
        <div class="bg-[#f3fbfb] border-4 border-black rounded-xl p-3.5 flex-1" id="mn_form"
            data-sub="บันทึกการประชุม QCC">
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
                    :disabled="ui.disabled" placeholder="" />

                <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">เริ่มเวลา</div>
                <input v-model="state.start" type="time"
                    class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                    :disabled="ui.disabled" placeholder="09:00" />

                <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">เสร็จเวลา</div>
                <input v-model="state.end" type="time"
                    class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                    :disabled="ui.disabled" placeholder="10:30" />
            </div>

            <!-- Attendees -->
            <div class="border-[3px] border-black rounded-xl p-2.5 bg-white mt-3">
                <div class="flex items-center gap-2.5">
                    <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">ผู้เข้าร่วมประชุม
                    </div>
                </div>

                <table class="w-full border-collapse mt-1.5">
                    <thead>
                        <tr>
                            <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left w-[120px]">รหัสพนักงาน
                            </th>
                            <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left">ชื่อ – นามสกุล (Auto)
                            </th>
                            <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] text-left w-[200px]">หน่วยงาน
                                (Auto)
                            </th>
                            <th class="border-2 border-black px-2 py-1.5 bg-[#f7f7f7] w-[72px]"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(a, idx) in state.attendees" :key="a.uid">
                            <td class="border-2 border-black px-2 py-1.5">
                                <input v-model="a.empId" readonly :disabled="ui.disabled"
                                    class="w-full px-2 py-1.5 border border-gray-300 rounded-md bg-gray-50"
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
                            <td class="border-2 border-black px-2 py-1.5 text-center">
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
            <div class="grid gap-2.5 items-center mt-3 grid-cols-[200px_1fr]">
                <div class="bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold">หัวข้อการประชุม</div>
                <input v-model="state.topic"
                    class="w-full px-2.5 py-2 border-2 border-black rounded-xl bg-white disabled:bg-gray-100"
                    :disabled="ui.disabled" />
            </div>

            <!-- Detail + files -->
            <div class="border-[3px] border-black rounded-xl p-2.5 bg-white mt-2.5">
                <div class="inline-block bg-[#fff2b8] border-2 border-black rounded-xl px-2.5 py-1.5 font-bold mb-1.5">
                    รายละเอียดการประชุม
                </div>
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

                <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-white font-bold"
                    @click="setDisabled(false)">
                    แก้ไข
                </button>

                <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-[#eafaf3] font-bold" @click="saveMinutes"
                    :disabled="ui.saving">
                    {{ ui.saving ? 'กำลังบันทึก…' : '💾 บันทึก' }}
                </button>

                <!-- ✅ ปุ่มถัดไป -->
                <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-[#eafaf3] font-bold" @click="goNext">
                    ถัดไป »
                </button>
            </div>

            <div class="text-gray-500 mt-1.5">{{ ui.saveMsg }}</div>
        </div>
    </div>
</template>

<script setup>
import StepSidebar from '@/components/StepSidebar.vue'
import { STEP1_SIDEBAR_SECTIONS } from '@/constants/qccSteps'
import { useRegisterShared } from '@/stores/registerShared'
import Swal from 'sweetalert2'
import { onMounted, reactive, watch } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const stepSections = STEP1_SIDEBAR_SECTIONS
const sharedRegister = useRegisterShared()
const REGISTER_FORM_KEY = 'qcc.register.form.v1'
const MINUTES2_STORAGE_KEY = 'qcc.minutes2.form.v1'

function prevRouter() {
    router.push('/register-qcc')
}

/* ---------- State ---------- */
const state = reactive({
    groupName: '',
    date: '',
    place: '',
    start: '09:00',
    end: '10:30',
    topic: '',
    detail: '',
    attendees: [],
    files: [],
    savedFiles: []
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
    fileNames: []
})

/* ---------- Init ---------- */
onMounted(() => {
    hydrateFromRegisterForm()
    hydrateFromSavedMinutes()
    if (!state.attendees.length) {
        for (let i = 0; i < 3; i++) addAttendee()
    }
})

function hydrateFromRegisterForm() {
    if (typeof window === 'undefined' || !window.localStorage) return
    try {
        const saved = window.localStorage.getItem(REGISTER_FORM_KEY)
        if (!saved) return
        const data = JSON.parse(saved)
        if (data?.s1_groupName && !state.groupName) {
            state.groupName = data.s1_groupName
        }
        // Prefill attendees from the registration form so employee IDs show up automatically
        if (!state.attendees.length && Array.isArray(data?.members) && data.members.length) {
            const deptLabel =
                data.s1_departmentName ||
                data.s1_department ||
                data.s1_teamName ||
                data.s1_team ||
                ''
            const revived = data.members
                .map((m, idx) => ({
                    uid: m.uid || cryptoRandom() || `reg-att-${idx}`,
                    empId: m.empId || '',
                    name: m.name || '',
                    dept: m.dept || deptLabel || m.position || '',
                }))
                .filter(a => a.empId || a.name)
            if (revived.length) {
                state.attendees.splice(0, state.attendees.length, ...revived)
            }
        }
    } catch (err) {
        console.warn('Hydrate minutes2 from register form failed:', err)
    }
}

function hydrateFromSavedMinutes() {
    if (typeof window === 'undefined' || !window.localStorage) return
    try {
        const saved = window.localStorage.getItem(MINUTES2_STORAGE_KEY)
        if (!saved) return
        const data = JSON.parse(saved)
        state.groupName = data.groupName || state.groupName
        state.date = data.date || state.date
        state.place = data.place || state.place
        state.start = data.start || state.start
        state.end = data.end || state.end
        state.topic = data.topic || state.topic
        state.detail = data.detail || state.detail
        if (Array.isArray(data.attendees) && data.attendees.length) {
            state.attendees.splice(
                0,
                state.attendees.length,
                ...data.attendees.map((a, idx) => ({
                    uid: a.uid || cryptoRandom() || `att-${idx}`,
                    empId: a.empId || '',
                    name: a.name || '',
                    dept: a.dept || '',
                }))
            )
        }
        if (Array.isArray(data.savedFiles)) {
            state.savedFiles = data.savedFiles
            ui.fileNames = data.savedFiles.map(f => f.name).filter(Boolean)
        }
    } catch (err) {
        console.warn('Hydrate minutes2 saved form failed:', err)
    }
}

/* ---------- Helpers ---------- */
function setDisabled(v) { ui.disabled = v }

function cryptoRandom() {
    const a = new Uint32Array(2); crypto.getRandomValues(a)
    return `${a[0].toString(16)}${a[1].toString(16)}`
}

/* ---------- Attendees ---------- */
function addAttendee() {
    state.attendees.push({ uid: cryptoRandom(), empId: '', name: '', dept: '' })
}

function removeAttendee(idx) {
    state.attendees.splice(idx, 1)
}

/* ---------- Files ---------- */
function onFilesChange(e) {
    const files = Array.from(e.target.files || [])
    state.files = files
    ui.fileNames = files.map(f => f.name)
}

function filesToMetas(files = []) {
    return Promise.all(
        files.map(
            file =>
                new Promise(resolve => {
                    const reader = new FileReader()
                    reader.onload = () => resolve({ name: file.name || 'file', dataUrl: reader.result || '' })
                    reader.onerror = () => resolve({ name: file.name || 'file', dataUrl: '' })
                    reader.readAsDataURL(file)
                })
        )
    )
}

/* ---------- Save ---------- */
async function saveMinutes() {
    ui.saveMsg = ''

    const missing = collectMissingFields()
    if (missing.length) {
        Swal.fire({
            icon: 'warning',
            title: 'กรอกข้อมูลไม่ครบ',
            html: `<div class="text-left">โปรดกรอกให้ครบ:</div><ul style="text-align:left; margin:10px 0 0 18px; list-style:disc;">${missing.map(m => `<li>${m}</li>`).join('')}</ul>`,
            confirmButtonText: 'ตกลง',
        })
        return
    }

    ui.saving = true
    ui.saveMsg = 'กำลังบันทึก...'

    try {
        const fileMetas = state.files.length ? await filesToMetas(state.files) : state.savedFiles || []
        const payload = {
            groupName: state.groupName,
            date: state.date,
            place: state.place,
            start: state.start,
            end: state.end,
            topic: state.topic,
            detail: state.detail,
            attendees: state.attendees.map(a => ({ ...a })),
            savedFiles: fileMetas,
        }
        window.localStorage.setItem(MINUTES2_STORAGE_KEY, JSON.stringify(payload))
        state.savedFiles = fileMetas
        ui.fileNames = fileMetas.map(f => f.name).filter(Boolean)
        ui.saveMsg = 'บันทึกเรียบร้อย (บันทึกในเครื่อง)'
        setDisabled(true)
    } catch (err) {
        console.error('Save minutes2 failed:', err)
        ui.saveMsg = 'บันทึกไม่สำเร็จ'
    } finally {
        ui.saving = false
    }
}

/* ---------- ไปหน้าถัดไป ---------- */
function goNext() {
    router.push('/summary-step1')
}

function collectMissingFields() {
    const missing = []
    if (!state.groupName) missing.push('ชื่อกลุ่ม')
    if (!state.date) missing.push('วันที่ประชุม')
    if (!state.place) missing.push('สถานที่')
    if (!state.start) missing.push('เวลาเริ่มประชุม')
    if (!state.end) missing.push('เวลาสิ้นสุดประชุม')
    if (!state.topic) missing.push('หัวข้อการประชุม')
    if (!state.detail) missing.push('รายละเอียดการประชุม')
    const attendeeFilled = state.attendees.filter(a => a.empId || a.name).length
    if (!attendeeFilled) missing.push('ผู้เข้าร่วมประชุม (กรอกอย่างน้อย 1 คน)')
    return missing
}
</script>
