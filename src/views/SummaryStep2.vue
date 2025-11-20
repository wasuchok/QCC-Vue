<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :sections="stepSections"
      current-key="summary-step2"
      title="STEP 2"
    />

    <div class="bg-[#f3fbfb] border-4 border-black rounded-[28px] p-5 flex-1 space-y-5">
      <header class="text-center space-y-1">
        <div class="text-[28px] font-extrabold leading-tight">
          สรุปผลการวิเคราะห์ปัญหา <b>STEP 2</b>
        </div>
        <p class="text-sm text-slate-600">ตรวจสอบความครบถ้วนก่อนส่งต่อให้ผู้อนุมัติ</p>
      </header>

      <section class="rounded-2xl border-4 border-black bg-white p-4">
        <div class="flex flex-wrap items-center gap-3 text-sm font-semibold">
          <span class="flex items-center gap-2 rounded-full bg-yellow-100 px-3 py-1 text-yellow-700">
            ▲ อยู่ระหว่างดำเนินการ
          </span>
          <span class="flex items-center gap-2 rounded-full bg-blue-100 px-3 py-1 text-blue-700">
            ⬤ รออนุมัติ
          </span>
          <span class="flex items-center gap-2 rounded-full bg-emerald-100 px-3 py-1 text-emerald-700">
            ⭕ เสร็จสิ้น
          </span>
        </div>
      </section>

      <section class="grid gap-4 md:grid-cols-2">
        <article
          v-for="module in modules"
          :key="module.key"
          class="rounded-2xl border-4 border-black bg-white p-4 space-y-2"
          :class="module.complete ? 'bg-[#e8fff1]' : module.status === 'warning' ? 'bg-[#fff7db]' : ''"
        >
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
          <RouterLink
            :to="module.path"
            class="inline-flex items-center gap-2 rounded-xl border-2 border-black bg-white px-3 py-2 text-sm font-semibold hover:bg-slate-50"
          >
            ไปยังหน้ากรอกข้อมูล
            <span aria-hidden="true">→</span>
          </RouterLink>
        </article>
      </section>

      <section class="rounded-2xl border-4 border-black bg-white p-4 space-y-3">
        <h2 class="text-lg font-bold text-slate-800">สรุปภาพรวมทีม</h2>
        <div class="grid gap-3 sm:grid-cols-2 text-sm">
          <div>
            <p class="text-xs font-semibold text-slate-500">หัวข้อกิจกรรม</p>
            <p class="font-semibold text-slate-900">{{ sharedRegister.groupName || '—' }}</p>
          </div>
          <div>
            <p class="text-xs font-semibold text-slate-500">หน่วยงาน</p>
            <p class="font-semibold text-slate-900">{{ sharedRegister.departmentName || sharedRegister.department || '—' }}</p>
          </div>
          <div>
            <p class="text-xs font-semibold text-slate-500">ทีม / สายงาน</p>
            <p class="font-semibold text-slate-900">{{ sharedRegister.teamName || sharedRegister.team || '—' }}</p>
          </div>
          <div>
            <p class="text-xs font-semibold text-slate-500">ผู้จัดการทีม</p>
            <p class="font-semibold text-slate-900">{{ sharedRegister.manager?.name || '—' }}</p>
          </div>
        </div>
        <p class="text-xs text-slate-500">
          หมายเหตุ: ระบบจะแจ้งเตือนผู้อนุมัติเมื่อทุกหัวข้อใน STEP 2 ถูกกรอกครบถ้วนและบันทึกเรียบร้อย
        </p>
      </section>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { RouterLink } from 'vue-router'
import StepSidebar from '@/components/StepSidebar.vue'
import { STEP1_AND_2_SIDEBAR } from '@/constants/qccSteps'
import { useRegisterShared } from '@/stores/registerShared'

const sharedRegister = useRegisterShared()
const stepSections = STEP1_AND_2_SIDEBAR

const modules = computed(() => [
  {
    key: 'step2-problem',
    label: 'พิจารณาหัวข้อปัญหา',
    description: 'กรอกตารางปัญหาและสาเหตุเบื้องต้น',
    path: '/step2/problem',
    complete: false,
    status: 'warning',
    messages: ['ยังไม่แนบหัวข้อปัญหาครบถ้วน', 'ทบทวนความเกี่ยวข้องกับหน่วยงาน'],
  },
  {
    key: 'step2-priority',
    label: 'จัดลำดับความสำคัญ',
    description: 'คำนวณคะแนนเพื่อหาเรื่องที่ควรทำก่อน',
    path: '/step2/priority',
    complete: false,
    status: 'pending',
    messages: ['กรอกค่าความเป็นไปได้/รุนแรง/ความถี่ เพื่อให้ระบบคำนวณคะแนน'],
  },
  {
    key: 'minutes3',
    label: 'บันทึกประชุม ครั้งที่ 3',
    description: 'สรุปมติการเลือกปัญหาและแผนการแก้ไข',
    path: '/minutes3',
    complete: false,
    status: 'pending',
    messages: ['ยังไม่มีบันทึกการประชุมครั้งที่ 3', 'กรอกหลังจากสรุปหัวข้อที่จะทำ'],
  },
])

function statusBadgeClass(module) {
  if (module.complete) return 'bg-emerald-100 text-emerald-700'
  if (module.status === 'warning') return 'bg-amber-100 text-amber-700'
  return 'bg-slate-200 text-slate-600'
}
</script>
