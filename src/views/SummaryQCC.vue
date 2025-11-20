<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <RegisterFlowSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :steps="registerSidebarSteps"
      current-key="summary"
    />

    <div class="bg-[#f0fbff] border-4 border-black rounded-3xl p-4 lg:p-6 flex-1 shadow-lg">
      <div class="text-center">
        <div class="text-[28px] font-black leading-tight">
          สรุปการดำเนินกิจกรรม <b>QCC</b>
        </div>
        <div class="text-xl font-semibold text-gray-600">
          สมัครเข้าร่วมกิจกรรม
        </div>
      </div>

      <div class="flex flex-wrap justify-center gap-3 mt-4">
        <div class="summary-pill">
          <span class="summary-pill__icon bg-green-500">✔</span>
          <span class="font-semibold text-green-700">ข้อมูลครบถ้วน</span>
        </div>
        <div class="summary-pill">
          <span class="summary-pill__icon bg-red-500">✖</span>
          <span class="font-semibold text-red-600">กรุณาทวนข้อมูลอีกครั้ง</span>
        </div>
      </div>

      <div class="mt-6 space-y-6">
        <section
          :class="['summary-card', registerStatus.complete ? 'summary-card--success' : 'summary-card--warn']">
          <div class="summary-card__header">
            <div class="summary-card__icon" :class="registerStatus.complete ? 'bg-emerald-500' : 'bg-red-500'">
              {{ registerStatus.complete ? '✔' : '!' }}
            </div>
            <div>
              <div class="summary-card__title">จดทะเบียนจัดตั้งกลุ่มกิจกรรม</div>
              <div class="summary-card__subtitle">
                {{ registerStatus.complete ? 'ข้อมูลครบถ้วน' : 'กรุณาตรวจสอบรายละเอียดที่ขาด' }}
              </div>
              <div v-if="!registerStatus.complete" class="summary-card__missing">
                ขาด: {{ registerStatus.missing.join(', ') }}
              </div>
            </div>
          </div>

          <div class="summary-card__body">
            <div v-for="row in registerRows" :key="row.label" class="summary-row">
              <div class="summary-row__label">{{ row.label }}</div>
              <div class="summary-row__value">
                <template v-if="row.lines?.length">
                  <ul class="list-disc pl-5 space-y-0.5">
                    <li v-for="(line, idx) in row.lines" :key="idx">{{ line }}</li>
                  </ul>
                </template>
                <template v-else>
                  {{ row.value || '—' }}
                </template>
              </div>
            </div>
          </div>
        </section>

        <section
          :class="['summary-card', minutesStatus.complete ? 'summary-card--success' : 'summary-card--warn']">
          <div class="summary-card__header">
            <div class="summary-card__icon" :class="minutesStatus.complete ? 'bg-emerald-500' : 'bg-red-500'">
              {{ minutesStatus.complete ? '✔' : '!' }}
            </div>
            <div>
              <div class="summary-card__title">บันทึกการประชุม ครั้งที่ 1</div>
              <div class="summary-card__subtitle">
                {{ minutesStatus.complete ? 'ข้อมูลครบถ้วน' : 'ยังมีรายละเอียดที่ต้องเพิ่มเติม' }}
              </div>
              <div v-if="!minutesStatus.complete" class="summary-card__missing">
                ขาด: {{ minutesStatus.missing.join(', ') }}
              </div>
            </div>
          </div>

          <div class="summary-card__body">
            <div v-for="row in minutesRows" :key="row.label" class="summary-row">
              <div class="summary-row__label">{{ row.label }}</div>
              <div class="summary-row__value">
                <template v-if="row.lines?.length">
                  <ul class="list-disc pl-5 space-y-0.5">
                    <li v-for="(line, idx) in row.lines" :key="idx">{{ line }}</li>
                  </ul>
                </template>
                <template v-else>
                  {{ row.value || '—' }}
                </template>
              </div>
            </div>
          </div>
        </section>
      </div>

      <section class="bg-white/70 border-2 border-black rounded-2xl p-4 mt-6 shadow-inner">
        <div class="font-bold text-lg mb-2">*หมายเหตุ*</div>
        <ol class="list-decimal pl-5 space-y-1 text-sm leading-relaxed">
          <li>หากบันทึกข้อมูลไม่ครบทุกขั้นตอน ระบบจะไม่สามารถส่งอนุมัติได้</li>
          <li>หากกดส่งข้อมูลให้ SV, TM ต้นสังกัด แล้วจะไม่สามารถแก้ไขรายละเอียดได้</li>
          <li>หากจำเป็นต้องการแก้ไขรายละเอียด กรุณาติดต่อ เจ้าหน้าที่ QCC</li>
        </ol>
      </section>

      <div class="flex flex-wrap justify-end gap-3 mt-6">
        <button class="nav-btn bg-white hover:bg-gray-100" @click="goBack">
          « ย้อนกลับ
        </button>
        <button
          class="nav-btn bg-[#d2fbe1] hover:bg-[#b8f3ce] disabled:opacity-70 disabled:cursor-not-allowed"
          :disabled="!overallComplete"
          @click="submitSummary">
          📨 ยืนยันส่งข้อมูล
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import RegisterFlowSidebar from '@/components/RegisterFlowSidebar.vue'
import { REGISTER_SIDEBAR_STEPS } from '@/constants/qccSteps'
import { useRegisterShared } from '@/stores/registerShared'
import { useMinutes1Shared } from '@/stores/minutes1Shared'

const router = useRouter()
const registerSidebarSteps = REGISTER_SIDEBAR_STEPS
const sharedRegister = useRegisterShared()
const sharedMinutes1 = useMinutes1Shared()

const registerStatus = computed(() => {
  const missing = []
  if (!sharedRegister.registerDate) missing.push('วันที่ลงทะเบียน')
  if (!sharedRegister.groupName) missing.push('ชื่อกลุ่ม')
  if (!sharedRegister.department && !sharedRegister.departmentName) missing.push('ฝ่าย/Department')
  if (!sharedRegister.manager?.id) missing.push('ผู้จัดการทีม')
  if (!sharedRegister.members.length) missing.push('สมาชิกในกลุ่ม')
  return { complete: missing.length === 0, missing }
})

const minutesStatus = computed(() => {
  const missing = []
  if (!sharedMinutes1.date) missing.push('วันที่ประชุม')
  if (!sharedMinutes1.topic) missing.push('หัวข้อการประชุม')
  if (!sharedMinutes1.detail) missing.push('รายละเอียดการประชุม')
  if (!sharedMinutes1.attendees.length) missing.push('ผู้เข้าร่วม')
  return { complete: missing.length === 0, missing }
})

const registerRows = computed(() => {
  const advisors = sharedRegister.advisors?.map((adv, idx) => {
    const badge = adv.id ? `#${adv.id}` : ''
    const dept = adv.dept ? `(${adv.dept})` : ''
    return `${idx + 1}. ${adv.name || '—'} ${badge} ${dept}`.trim()
  }) ?? []

  const members = sharedRegister.members?.map((m, idx) => {
    const emp = m.empId ? `#${m.empId}` : ''
    const role = m.position ? `- ${m.position}` : ''
    return `${idx + 1}. ${m.name || '—'} ${emp} ${role}`.trim()
  }) ?? []

  return [
    { label: 'วันที่ลงทะเบียน', value: formatDate(sharedRegister.registerDate) },
    { label: 'เลขที่ทะเบียนกลุ่ม', value: sharedRegister.groupNo || '—' },
    {
      label: 'ฝ่าย / หน่วยงาน',
      value: sharedRegister.departmentName || sharedRegister.department || '—',
    },
    { label: 'ทีม / สายงาน', value: sharedRegister.teamName || sharedRegister.team || '—' },
    { label: 'ประเภทกลุ่ม', value: sharedRegister.groupType || '—' },
    { label: 'ชื่อกลุ่ม', value: sharedRegister.groupName || '—' },
    { label: 'คำขวัญ', value: sharedRegister.motto || '—' },
    { label: 'ที่ปรึกษา', lines: advisors },
    { label: 'ผู้จัดการทีม', value: formatManager(sharedRegister.manager) },
    { label: 'สมาชิกในกลุ่ม', lines: members },
  ]
})

const minutesRows = computed(() => {
  const attendees = sharedMinutes1.attendees?.map((att, idx) => {
    const emp = att.empId ? `#${att.empId}` : ''
    const dept = att.dept ? `(${att.dept})` : ''
    return `${idx + 1}. ${emp} ${att.name || '—'} ${dept}`.trim()
  }) ?? []

  return [
    { label: 'วันที่ประชุม', value: formatDate(sharedMinutes1.date) },
    { label: 'สถานที่', value: sharedMinutes1.place || '—' },
    { label: 'เวลา', value: formatTimeRange(sharedMinutes1.start, sharedMinutes1.end) },
    { label: 'หัวข้อการประชุม', value: sharedMinutes1.topic || '—' },
    { label: 'รายละเอียด', value: sharedMinutes1.detail || '—' },
    { label: 'ผู้เข้าร่วม', lines: attendees },
    { label: 'ไฟล์แนบ', lines: sharedMinutes1.fileNames || [] },
  ]
})

const overallComplete = computed(
  () => registerStatus.value.complete && minutesStatus.value.complete
)

function formatDate(value) {
  if (!value) return '—'
  try {
    return new Date(value).toLocaleDateString('th-TH', {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
    })
  } catch {
    return value
  }
}

function formatManager(manager = {}) {
  if (!manager?.id && !manager?.name) return '—'
  const segments = []
  if (manager.name) segments.push(manager.name)
  if (manager.id) segments.push(`#${manager.id}`)
  if (manager.dept) segments.push(manager.dept)
  return segments.join(' • ')
}

function formatTimeRange(start, end) {
  if (start && end) return `${start} - ${end}`
  return start || end || '—'
}

function goBack() {
  router.back()
}

function submitSummary() {
  if (!overallComplete.value) {
    alert('กรุณาตรวจสอบให้ครบถ้วนก่อนยืนยันส่งข้อมูล')
    return
  }
  alert('ส่งข้อมูลสำเร็จ (โหมดทดสอบ)')
}
</script>

<style scoped>
@reference "tailwindcss";

.summary-pill {
  @apply flex items-center gap-2 bg-white border-2 border-black rounded-2xl px-4 py-2 shadow;
}

.summary-pill__icon {
  @apply text-white font-bold rounded-full w-7 h-7 flex items-center justify-center shadow-inner;
}

.summary-card {
  @apply border-4 border-black rounded-3xl p-4 shadow-lg bg-white transition-all;
}

.summary-card--success {
  @apply bg-[#e5ffe8];
}

.summary-card--warn {
  @apply bg-[#fff2f0];
}

.summary-card__header {
  @apply flex items-center gap-3;
}

.summary-card__icon {
  @apply text-white font-bold rounded-full w-11 h-11 flex items-center justify-center shadow;
}

.summary-card__title {
  @apply text-xl font-bold;
}

.summary-card__subtitle {
  @apply text-sm font-semibold text-gray-600;
}

.summary-card__missing {
  @apply text-sm text-red-700 font-semibold;
}

.summary-card__body {
  @apply mt-4 bg-white/80 border-2 border-black rounded-2xl divide-y;
}

.summary-row {
  @apply grid md:grid-cols-[220px_1fr] gap-2 px-3 py-2;
}

.summary-row__label {
  @apply font-semibold text-gray-700;
}

.summary-row__value {
  @apply text-gray-900 whitespace-pre-line;
}

.nav-btn {
  @apply border-2 border-black rounded-2xl px-5 py-2 font-bold shadow;
}
</style>
