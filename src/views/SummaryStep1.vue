<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar class="lg:sticky lg:top-6 flex-shrink-0" :sections="stepSections" current-key="summary-step1"
      title="สรุป STEP 0" />

    <div class="bg-[#f3fbfb] border-4 border-black rounded-3xl p-5 flex-1 space-y-5">
      <header class="text-center space-y-1">
        <div class="text-[28px] font-extrabold leading-tight">
          สรุปขั้นตอน <b>STEP 0</b>
        </div>
        <p class="text-sm text-slate-600">ตรวจสอบความครบถ้วนของกิจกรรมก่อนส่งให้ Admin อนุมัติ</p>
      </header>

      <section class="rounded-2xl border-4 border-black bg-white p-4">
        <div class="flex flex-wrap items-center gap-3 text-sm font-semibold">
          <span class="flex items-center gap-2 rounded-full bg-yellow-100 px-3 py-1 text-yellow-700">
            ▲ อยู่ระหว่างดำเนินการ
          </span>
          <span class="flex items-center gap-2 rounded-full bg-[#dbeafe] px-3 py-1 text-[#1d4ed8]">
            ⬤ ส่งให้ SV,TM ต้นสังกัดแล้ว
          </span>
          <span class="flex items-center gap-2 rounded-full bg-emerald-100 px-3 py-1 text-emerald-700">
            ⭕ Leader ยืนยัน
          </span>
        </div>
      </section>

      <section class="rounded-2xl border-4 border-black bg-white p-4">
        <h2 class="text-lg font-bold text-slate-800">ข้อมูลทีม</h2>
        <div v-if="teamApproved" class="mt-3 grid gap-3 sm:grid-cols-2 text-sm">
          <div>
            <p class="text-xs font-semibold text-slate-500">ชื่อกลุ่ม</p>
            <p class="font-semibold text-slate-900">{{ registerData.groupName || '—' }}</p>
          </div>
          <div>
            <p class="text-xs font-semibold text-slate-500">ฝ่าย / หน่วยงาน</p>
            <p class="font-semibold text-slate-900">{{ registerData.departmentName || registerData.department || '—'
            }}</p>
          </div>
          <div>
            <p class="text-xs font-semibold text-slate-500">ทีม / สายงาน</p>
            <p class="font-semibold text-slate-900">{{ registerData.teamName || registerData.team || '—' }}</p>
          </div>
          <div>
            <p class="text-xs font-semibold text-slate-500">ผู้จัดการทีม</p>
            <p class="font-semibold text-slate-900">{{ registerData.manager?.name || '—' }}</p>
          </div>
        </div>
        <p v-else
          class="mt-3 rounded-2xl border-2 border-dashed border-slate-300 bg-slate-50 px-4 py-3 text-sm text-slate-600">
          ข้อมูลทีมจะปรากฏหลังจากผู้ดูแลระบบอนุมัติใบสมัครหลักเรียบร้อยแล้ว
        </p>
      </section>

      <section class="grid gap-4 md:grid-cols-2">
        <article v-for="module in modules" :key="module.key"
          class="rounded-2xl border-4 border-black bg-white p-4 space-y-2"
          :class="module.complete ? 'bg-[#e8fff1]' : module.status === 'warning' ? 'bg-[#fff7db]' : ''">
          <div class="flex items-center justify-between">
            <h3 class="text-lg font-bold text-slate-900">{{ module.label }}</h3>
            <span class="rounded-full px-3 py-1 text-xs font-semibold" :class="statusBadgeClass(module)">
              {{ module.complete ? 'ครบถ้วน' : module.status === 'warning' ? 'ยังไม่ครบ' : 'ยังไม่เริ่ม' }}
            </span>
          </div>
          <p class="text-sm text-slate-600">{{ module.description }}</p>
          <ul class="text-xs text-slate-500 list-disc pl-5 space-y-1">
            <li v-for="msg in module.messages" :key="msg">{{ msg }}</li>
          </ul>
          <RouterLink :to="module.path"
            class="inline-flex items-center gap-2 rounded-xl border-2 border-black bg-white px-3 py-2 text-sm font-semibold hover:bg-slate-50">
            ไปยังหน้ากรอกข้อมูล
            <span aria-hidden="true">→</span>
          </RouterLink>
        </article>
      </section>

      <div class="flex justify-end">
        <button type="button"
          class="rounded-xl border-2 border-black bg-[#eafaf3] px-4 py-2 text-sm font-semibold hover:-translate-y-0.5 transition"
          @click="saveSummary">
          💾 บันทึกสรุป
        </button>
      </div>

    </div>
  </div>
</template>

<script setup>
import StepSidebar from '@/components/StepSidebar.vue'
import { STEP1_SIDEBAR_SECTIONS } from '@/constants/qccSteps'
import { computed, onMounted, reactive } from 'vue'
import { RouterLink } from 'vue-router'

const stepSections = STEP1_SIDEBAR_SECTIONS
const REGISTER_KEY = 'qcc.register.form.v1'
const MINUTES_KEY = 'qcc.minutes2.form.v1'

const registerData = reactive({
  groupName: '',
  department: '',
  departmentName: '',
  team: '',
  teamName: '',
  manager: { name: '' },
})

const localFlags = reactive({
  hasRegister: false,
  hasMinutes: false,
})

const teamApproved = computed(() => localFlags.hasRegister)

const modules = computed(() => [
  {
    key: 'register-qcc',
    label: 'ข้อมูลกิจกรรม QCC',
    description: 'รายละเอียดทีม ประเภทกลุ่ม และหัวข้อที่จะดำเนินงาน',
    path: '/register-qcc',
    complete: localFlags.hasRegister,
    status: localFlags.hasRegister ? 'complete' : 'warning',
    messages: localFlags.hasRegister
      ? ['ข้อมูลครบถ้วน']
      : ['ยังไม่ได้กรอกข้อมูลทีม (qcc.register.form.v1)'],
  },
  {
    key: 'minutes2',
    label: 'Minutes #1',
    description: 'บันทึกการประชุมครั้งที่ 1 พร้อมผู้เข้าร่วมและวาระประชุม',
    path: '/minutes2',
    complete: localFlags.hasMinutes,
    status: localFlags.hasMinutes ? 'complete' : 'warning',
    messages: localFlags.hasMinutes
      ? ['ข้อมูลครบถ้วน']
      : ['ยังไม่พบการบันทึก (qcc.minutes2.form.v1)'],
  },
])

function statusBadgeClass(module) {
  if (module.complete) return 'bg-emerald-100 text-emerald-700'
  if (module.status === 'warning') return 'bg-amber-100 text-amber-700'
  return 'bg-slate-200 text-slate-600'
}

function saveSummary() {
  alert('บันทึกสรุป STEP 0/1 (ตัวอย่าง)')
}

function hydrateFromLocalStorage() {
  if (typeof window === 'undefined' || !window.localStorage) return
  try {
    const regRaw = window.localStorage.getItem(REGISTER_KEY)
    const minRaw = window.localStorage.getItem(MINUTES_KEY)
    localFlags.hasRegister = Boolean(regRaw)
    localFlags.hasMinutes = Boolean(minRaw)

    if (regRaw) {
      const reg = JSON.parse(regRaw)
      registerData.groupName = reg.s1_groupName || ''
      registerData.department = reg.s1_department || ''
      registerData.departmentName = reg.s1_departmentName || ''
      registerData.team = reg.s1_team || ''
      registerData.teamName = reg.s1_teamName || ''
      registerData.manager.name = reg.manager?.name || ''
    }
  } catch (err) {
    console.warn('Hydrate summary failed:', err)
  }
}

onMounted(hydrateFromLocalStorage)
</script>
