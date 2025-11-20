<template>
    <div class="flex flex-col lg:flex-row gap-4 items-start">
        <StepSidebar
            class="lg:sticky lg:top-6 flex-shrink-0"
            :sections="stepSections"
            current-key="minutes4"
        />
        <div class="bg-[#f3fbfb] border-4 border-black rounded-xl p-3.5 flex-1" id="mn_form4" data-sub="บันทึกการประชุม QCC #4">
        <!-- Title -->
        <div class="text-[26px] font-extrabold text-center my-1.5 leading-tight">
            บันทึกการประชุมกิจกรรมกลุ่ม <b>QCC</b><br />
            <span class="text-gray-500 font-semibold text-[0.9em]">Minutes of QCC Activity Meeting #4</span>
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
                <tbody>
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

            <button class="border-2 border-black rounded-xl px-3.5 py-2 bg-white font-bold" @click="setDisabled(false)">
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
    import { onMounted, reactive, watch } from 'vue'
    import { useRouter } from 'vue-router'
    import StepSidebar from '@/components/StepSidebar.vue'
    import { STEP1_AND_2_SIDEBAR } from '@/constants/qccSteps'
    import { useRegisterShared } from '@/stores/registerShared'
    
    const router = useRouter()
  const stepSections = STEP1_AND_2_SIDEBAR
  const sharedRegister = useRegisterShared()

function prevRouter() {
    router.go(-1)
}

/* ---------- State ---------- */
const state = reactive({
    groupName: '',
    date: '',
    place: 'Room S',
    start: '09:00',
    end: '10:30',
    topic: '',
    detail: '',
    attendees: [],
    files: []
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
    for (let i = 0; i < 3; i++) addAttendee()
})

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

function fillAttendee(idx) {
    const code = state.attendees[idx]?.empId?.trim()
    if (!code) return
    const row = state.attendees[idx]
    row.name = 'สมชาย ใจดี'
    row.dept = 'ฝ่ายผลิต'
}

/* ---------- Files ---------- */
function onFilesChange(e) {
    const files = Array.from(e.target.files || [])
    state.files = files
    ui.fileNames = files.map(f => f.name)
}

/* ---------- Save ---------- */
async function saveMinutes() {
    ui.saveMsg = ''
    if (!state.date) {
        alert('กรุณาเลือก "วันที่ประชุม"')
        return
    }

    ui.saving = true
    ui.saveMsg = 'กำลังบันทึก...'

    await new Promise(r => setTimeout(r, 600))
    ui.saveMsg = 'บันทึกสำเร็จ (โหมดทดสอบ)'
    ui.saving = false
    setDisabled(true)
}

/* ---------- ไปหน้าถัดไป ---------- */
function goNext() {
    router.push('/step3/goals')
}
</script>
