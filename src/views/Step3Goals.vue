<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :sections="stepSections"
      current-key="step3-goals"
      title="STEP 3"
    />

    <div class="bg-[#f5fbff] border-4 border-black rounded-[28px] p-5 flex-1 space-y-5">
      <header class="text-center space-y-1">
        <div class="text-[28px] font-extrabold leading-tight">
          จัดตั้งเป้าหมายกิจกรรม และเป้าหมายพัฒนาบุคลากร
        </div>
        <p class="text-sm text-slate-600">กรอกแผนพัฒนาทั้งรายบุคคลและระดับทีม พร้อมแนบเอกสารประกอบ</p>
      </header>

      <section class="grid gap-5 md:grid-cols-2">
        <article
          v-for="card in goalCards"
          :key="card.key"
          class="rounded-[32px] border-4 border-black bg-white p-4 flex flex-col gap-3"
        >
          <header class="inline-flex rounded-2xl border-2 border-black bg-[#fff2b8] px-4 py-1 text-sm font-bold justify-center">
            {{ card.title }}
          </header>
          <textarea
            v-model="card.value"
            class="min-h-[220px] rounded-2xl border-2 border-black px-3 py-2 text-sm bg-white"
            placeholder="รายละเอียดเป้าหมาย..."
          ></textarea>
          <button
            type="button"
            class="inline-flex items-center justify-center rounded-2xl border-2 border-black bg-[#eafaf3] px-3 py-2 text-sm font-semibold"
            @click="openFilePicker(card.key)"
          >
            📎 คลิก เพื่อแนบไฟล์
          </button>
          <ul v-if="card.files.length" class="text-xs text-slate-500 pl-3 space-y-1">
            <li v-for="name in card.files" :key="name">• {{ name }}</li>
          </ul>
        </article>
      </section>

      <div class="rounded-2xl border-4 border-black bg-white p-4 space-y-2 text-sm">
        <p class="text-slate-600">หมายเหตุ: สามารถแนบไฟล์ เช่น แผนการฝึกอบรมหรือพัฒนาทีม เพื่อใช้ยืนยันแผนงานกับผู้อนุมัติ</p>
        <ul class="text-xs text-slate-500 list-disc pl-5">
          <li>รองรับไฟล์ภาพและ PDF ขนาดไม่เกิน 5MB ต่อไฟล์</li>
          <li>หากยังไม่พร้อมแนบไฟล์ สามารถกลับมาอัปเดตภายหลังได้</li>
        </ul>
      </div>

      <div class="flex flex-wrap gap-3 justify-end">
        <button class="action-btn bg-white" @click="goBack">« ย้อนกลับ</button>
        <button class="action-btn bg-white" @click="saveGoals">💾 บันทึก</button>
        <button class="action-btn bg-[#d9fbe7]" @click="goNext">ถัดไป »</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue'
import { useRouter } from 'vue-router'
import StepSidebar from '@/components/StepSidebar.vue'
import { STEP1_AND_2_SIDEBAR } from '@/constants/qccSteps'

const router = useRouter()
const stepSections = STEP1_AND_2_SIDEBAR

const goalCards = reactive([
  { key: 'individual', title: 'พัฒนาบุคลากร', value: '', files: [] },
  { key: 'team', title: 'พัฒนากลุ่ม', value: '', files: [] },
])

function openFilePicker(key) {
  const input = document.createElement('input')
  input.type = 'file'
  input.multiple = true
  input.accept = '.pdf,image/*'
  input.onchange = event => {
    const files = Array.from(event.target.files || [])
    const card = goalCards.find(item => item.key === key)
    if (card) {
      card.files = files.map(file => file.name)
    }
  }
  input.click()
}

function saveGoals() {
  alert('บันทึกข้อมูล (ตัวอย่าง)')
}

function goNext() {
  router.push('/step3/plan')
}

function goBack() {
  router.push('/summary-step3')
}
</script>

<style scoped>
@reference "tailwindcss";

.action-btn {
  @apply rounded-2xl border-2 border-black px-4 py-2 text-sm font-semibold shadow hover:-translate-y-0.5 transition;
}
</style>
