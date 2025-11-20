<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :sections="stepSections"
      current-key="step3-motivation"
      title="STEP 3"
    />

    <div class="bg-[#f5fbff] border-4 border-black rounded-[28px] p-5 flex-1 space-y-4">
      <header class="space-y-2">
        <div class="flex items-center gap-3 text-lg font-bold">
          <span class="flex h-8 w-8 items-center justify-center rounded-full border-2 border-black bg-white">3</span>
          <span>เหตุผล (จูงใจ) ที่เลือกทำกิจกรรมเรื่องนี้</span>
        </div>
        <p class="text-sm text-slate-600">
          ระบุผลกระทบที่ทีมต้องการแก้ไข ทั้งด้านคุณภาพชีวิตในการทำงานและคุณภาพงาน เพื่อยืนยันว่ากิจกรรมนี้มีความสำคัญ
        </p>
      </header>

      <section class="rounded-[24px] border-4 border-black bg-white p-4 space-y-4">
        <div class="overflow-auto rounded-2xl border-2 border-black">
          <table class="w-full border-collapse text-sm">
            <thead>
              <tr class="bg-[#cfeeff] text-slate-900">
                <th colspan="2" class="border border-black px-3 py-2 text-center font-semibold">คุณภาพชีวิตในการทำงาน</th>
                <th colspan="2" class="border border-black px-3 py-2 text-center font-semibold">คุณภาพงาน</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="row in motivationRows" :key="row.key" class="align-top">
                <td class="border border-black px-3 py-3 w-40">
                  <template v-if="row.left">
                    <div class="font-semibold text-slate-900">{{ row.left.title }}</div>
                    <div class="text-xs text-slate-500">{{ row.left.subtitle }}</div>
                  </template>
                </td>
                <td class="border border-black px-3 py-3">
                  <textarea
                    v-if="row.left"
                    v-model="row.left.value"
                    class="table-input min-h-[80px]"
                    placeholder="ระบุเหตุผล หรือผลกระทบต่อคุณภาพชีวิตในการทำงาน"
                  ></textarea>
                </td>
                <td class="border border-black px-3 py-3 w-40">
                  <template v-if="row.right">
                    <div class="font-semibold text-slate-900">{{ row.right.title }}</div>
                    <div class="text-xs text-slate-500">{{ row.right.subtitle }}</div>
                  </template>
                </td>
                <td class="border border-black px-3 py-3">
                  <textarea
                    v-if="row.right"
                    v-model="row.right.value"
                    class="table-input min-h-[80px]"
                    placeholder="ระบุเหตุผล หรือผลกระทบต่อคุณภาพงาน"
                  ></textarea>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <p class="text-xs text-slate-500">
          หมายเหตุ: ใช้ข้อมูลนี้อธิบายผู้เกี่ยวข้องว่าทำไมทีมจึงเลือกหัวข้อดังกล่าว หากยังรวบรวมไม่ครบสามารถกลับมาแก้ไขภายหลังได้
        </p>
      </section>

      <div class="flex flex-wrap gap-3 justify-end">
        <button class="action-btn bg-white" @click="goBack">« ย้อนกลับ</button>
        <button class="action-btn bg-white" @click="saveMotivation">💾 บันทึก</button>
        <button class="action-btn bg-[#d9fbe7]" @click="goNext">ถัดไป »</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed, reactive } from 'vue'
import { useRouter } from 'vue-router'
import StepSidebar from '@/components/StepSidebar.vue'
import { STEP1_AND_2_SIDEBAR } from '@/constants/qccSteps'

const stepSections = STEP1_AND_2_SIDEBAR
const router = useRouter()

const motivationColumns = reactive({
  workLife: [
    { key: 'safety', title: 'ความปลอดภัย', subtitle: 'Safety', value: '' },
    { key: 'environment', title: 'สภาพแวดล้อม', subtitle: 'Environment', value: '' },
    { key: 'development', title: 'การพัฒนา', subtitle: 'Development', value: '' },
    { key: 'management', title: 'การบริหารจัดการ', subtitle: 'Management', value: '' },
  ],
  workQuality: [
    { key: 'quality', title: 'คุณภาพ', subtitle: 'Quality', value: '' },
    { key: 'cost', title: 'ราคา', subtitle: 'Cost', value: '' },
    { key: 'delivery', title: 'การส่งมอบ', subtitle: 'Delivery', value: '' },
    { key: 'productivity', title: 'การผลิต', subtitle: 'Productivity', value: '' },
  ],
})

const motivationRows = computed(() => {
  const max = Math.max(motivationColumns.workLife.length, motivationColumns.workQuality.length)
  return Array.from({ length: max }, (_, index) => ({
    key: `motivation-${index}`,
    left: motivationColumns.workLife[index] || null,
    right: motivationColumns.workQuality[index] || null,
  }))
})

function saveMotivation() {
  alert('บันทึกข้อมูล (ตัวอย่าง)')
}

function goNext() {
  router.push('/step3/three-g')
}

function goBack() {
  router.push('/step2/priority')
}
</script>

<style scoped>
@reference "tailwindcss";

.table-input {
  @apply w-full rounded-xl border-2 border-black px-2 py-2 text-sm bg-white;
}

.action-btn {
  @apply rounded-2xl border-2 border-black px-4 py-2 text-sm font-semibold shadow hover:-translate-y-0.5 transition;
}
</style>
