<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :sections="stepSections"
      current-key="step2-priority"
      title="STEP 2"
    />

    <div class="bg-[#f5fbff] border-4 border-black rounded-[28px] p-5 flex-1 space-y-4">
      <header class="space-y-2">
        <div class="flex items-center gap-3 text-lg font-bold">
          <span class="flex h-8 w-8 items-center justify-center rounded-full border-2 border-black bg-white">2</span>
          <span>การจัดลำดับความสำคัญของปัญหา</span>
        </div>
        <p class="text-sm text-slate-600">
          วิเคราะห์ความเป็นไปได้ ความรุนแรง และความถี่ เพื่อเลือกหัวข้อที่จะดำเนินกิจกรรมก่อน
        </p>
      </header>

      <div class="overflow-auto rounded-[24px] border-4 border-black bg-white">
        <table class="w-full border-collapse text-sm">
          <thead class="bg-[#fff6d1]">
            <tr>
              <th class="border border-black px-2 py-2 w-32">หัวข้อปัญหา</th>
              <th class="border border-black px-2 py-2">ความเป็นไปได้</th>
              <th class="border border-black px-2 py-2">ความรุนแรง</th>
              <th class="border border-black px-2 py-2">ความถี่</th>
              <th class="border border-black px-2 py-2 w-24">คะแนน</th>
              <th class="border border-black px-2 py-2 w-32">ผู้นำเสนอ</th>
            </tr>
            <tr class="bg-[#fff6d1] text-xs text-center">
              <th></th>
              <th>1 2 3 4</th>
              <th>1 2 3 4</th>
              <th>1 2 3 4</th>
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="row in rows" :key="row.id">
              <td class="border border-black px-3 py-3">
                <input v-model="row.title" class="table-input" placeholder="หัวข้อปัญหา" />
              </td>
              <td class="border border-black px-2 py-3 text-center">
                <input v-model.number="row.probability" type="number" min="1" max="4" class="table-input text-center" />
              </td>
              <td class="border border-black px-2 py-3 text-center">
                <input v-model.number="row.severity" type="number" min="1" max="4" class="table-input text-center" />
              </td>
              <td class="border border-black px-2 py-3 text-center">
                <input v-model.number="row.frequency" type="number" min="1" max="4" class="table-input text-center" />
              </td>
              <td class="border border-black px-2 py-3 text-center font-semibold">
                {{ calcScore(row) }}
              </td>
              <td class="border border-black px-2 py-3">
                <input v-model="row.owner" class="table-input" placeholder="ผู้เสนอ" />
              </td>
            </tr>
          </tbody>
          <tfoot>
            <tr class="bg-[#fff6d1] font-bold">
              <td class="border border-black px-3 py-2 text-center">รวม</td>
              <td class="border border-black px-2 py-2 text-center">{{ total('probability') }}</td>
              <td class="border border-black px-2 py-2 text-center">{{ total('severity') }}</td>
              <td class="border border-black px-2 py-2 text-center">{{ total('frequency') }}</td>
              <td class="border border-black px-2 py-2 text-center">{{ totalScore }}</td>
              <td class="border border-black px-2 py-2"></td>
            </tr>
          </tfoot>
        </table>
      </div>

      <section class="rounded-[24px] border-4 border-black bg-white p-4 space-y-3">
        <div class="flex flex-col gap-2 text-sm font-semibold">
          <label>2.1 หัวข้อ (เรื่อง) กิจกรรม</label>
          <input class="table-input" placeholder="Auto" readonly />
        </div>
        <div class="rounded-2xl border-2 border-black bg-[#fff4b8] p-4 text-sm">
          กรุณาแนบ Pareto / แผนภูมิพาเรโต แสดงหัวข้อปัญหา
        </div>
        <div class="flex gap-3 justify-end">
          <button class="action-btn bg-white" @click="goBack">« ย้อนกลับ</button>
          <button class="action-btn bg-white" @click="editMode">แก้ไข</button>
          <button class="action-btn bg-white" @click="savePriority">💾 บันทึก</button>
          <button class="action-btn bg-[#d9fbe7]" @click="goNext">ถัดไป »</button>
        </div>
      </section>
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

const rows = reactive([
  { id: 'r1', title: '', probability: 1, severity: 1, frequency: 1, owner: '' },
  { id: 'r2', title: '', probability: 1, severity: 1, frequency: 1, owner: '' },
  { id: 'r3', title: '', probability: 1, severity: 1, frequency: 1, owner: '' },
])

function calcScore(row) {
  return (row.probability || 0) * (row.severity || 0) * (row.frequency || 0)
}

const totalScore = computed(() => rows.reduce((sum, row) => sum + calcScore(row), 0))

function total(field) {
  return rows.reduce((sum, row) => sum + Number(row[field] || 0), 0)
}

function editMode() {
  alert('เปิดโหมดแก้ไข (ตัวอย่าง)')
}

function savePriority() {
  alert('บันทึกข้อมูล (ตัวอย่าง)')
}

function goNext() {
  router.push('/step3/motivation')
}

function goBack() {
  router.push('/step2/problem')
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
