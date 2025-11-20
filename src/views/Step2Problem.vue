<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :sections="stepSections"
      current-key="step2-problem"
      title="STEP 2"
    />

    <div class="bg-[#f5fbff] border-4 border-black rounded-[28px] p-5 flex-1 space-y-4">
      <header class="space-y-2">
        <div class="flex items-center gap-3 text-lg font-bold">
          <span class="flex h-8 w-8 items-center justify-center rounded-full border-2 border-black bg-white">1</span>
          <span>พิจารณาหัวข้อปัญหา</span>
        </div>
        <p class="text-sm text-slate-600">
          ค้นหาปัญหาหรือวิธีการปรับปรุงจากกิจกรรมเพื่อแก้ไขปัญหาและปรับปรุงสิ่งต่อไปนี้
        </p>
        <ul class="text-xs text-slate-500 list-[lower-alpha] pl-6 leading-relaxed">
          <li>ประกันคุณภาพสินค้า/บริการ</li>
          <li>ประสิทธิภาพของการผลิต บริการ และงานอื่น ๆ</li>
          <li>ประหยัดหรือลดค่าใช้จ่าย</li>
          <li>ปลอดภัยและความเป็นระเบียบเรียบร้อย</li>
          <li>อื่น ๆ เช่น การเพิ่มความรู้ ความสามารถ ปรับปรุงสภาพแวดล้อมการทำงาน</li>
        </ul>
      </header>

      <div class="overflow-auto rounded-[24px] border-4 border-black bg-white">
        <table class="w-full border-collapse text-sm">
          <thead class="bg-[#fff6d1]">
            <tr>
              <th class="border border-black px-2 py-2 w-1/3">หัวข้อปัญหา</th>
              <th class="border border-black px-2 py-2">สาเหตุที่เลือก</th>
              <th class="border border-black px-2 py-2">หน่วยงานที่พบปัญหา</th>
              <th class="border border-black px-2 py-2 w-32">คะแนน</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in items" :key="item.key" class="align-top">
              <td class="border border-black px-3 py-3">
                <div class="font-semibold text-slate-900">{{ item.title }}</div>
                <div class="text-xs text-slate-500">{{ item.subtitle }}</div>
              </td>
              <td class="border border-black px-3 py-3">
                <textarea v-model="item.cause" class="table-input" rows="2" placeholder="ระบุสาเหตุหรือปัญหาย่อย"></textarea>
              </td>
              <td class="border border-black px-3 py-3">
                <input v-model="item.department" class="table-input" placeholder="หน่วยงาน/ไลน์ผลิต" />
              </td>
              <td class="border border-black px-2 py-3 text-center">
                <input v-model="item.score" type="number" min="0" max="10" class="table-input text-center" placeholder="0-10" />
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="rounded-[24px] border-4 border-black bg-white p-4 space-y-3">
        <div class="flex flex-wrap gap-3 items-center text-sm font-semibold">
          <button class="rounded-2xl border-2 border-black bg-[#fff4b8] px-4 py-2">เลือกหัวข้อปัญหาด้าน</button>
          <div class="flex-1">
            <input v-model="newIssue" class="table-input" placeholder="เช่น คุณภาพ" />
          </div>
        </div>
        <p class="text-xs text-slate-500">
          หมายเหตุ: สามารถเพิ่มหัวข้อปัญหาเพิ่มเติมในภายหลังได้ ระบบจะยังไม่ส่งให้ผู้อนุมัติจนกว่าจะกดส่งในหน้าสรุป STEP 2
        </p>
        <div class="flex flex-wrap gap-3 justify-end">
          <button class="action-btn bg-white" @click="setEditable(true)">แก้ไข</button>
          <button class="action-btn bg-white" @click="saveForm">💾 บันทึก</button>
          <button class="action-btn bg-[#d9fbe7]" @click="goNext">ถัดไป »</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive, ref } from 'vue'
import { useRouter } from 'vue-router'
import StepSidebar from '@/components/StepSidebar.vue'
import { STEP1_AND_2_SIDEBAR } from '@/constants/qccSteps'

const stepSections = STEP1_AND_2_SIDEBAR
const router = useRouter()
const newIssue = ref('')
const items = reactive([
  { key: 'safety', title: 'ความปลอดภัย', subtitle: 'Safety', cause: '', department: '', score: '' },
  { key: 'quality', title: 'ด้านคุณภาพ', subtitle: 'Quality', cause: '', department: '', score: '' },
  { key: 'productivity', title: 'ด้านการผลิต', subtitle: 'Productivity', cause: '', department: '', score: '' },
  { key: 'delivery', title: 'การส่งมอบ', subtitle: 'Delivery', cause: '', department: '', score: '' },
  { key: 'cost', title: 'ด้านต้นทุน', subtitle: 'Cost', cause: '', department: '', score: '' },
  { key: 'environment', title: 'สิ่งแวดล้อม', subtitle: 'Environment', cause: '', department: '', score: '' },
  { key: 'management', title: 'การจัดการ', subtitle: 'Management', cause: '', department: '', score: '' },
])

function goNext() {
  router.push('/step2/priority')
}

function setEditable() {
  alert('เปิดแก้ไขข้อมูล (ตัวอย่าง)')
}

function saveForm() {
  alert('บันทึกข้อมูล (ตัวอย่าง)')
}
</script>

<style scoped>
@reference "tailwindcss";

.table-input {
  @apply w-full rounded-xl border-2 border-black px-3 py-2 text-sm bg-white;
}
.table-input:focus {
  @apply outline-none ring-2 ring-slate-200;
}

.action-btn {
  @apply rounded-2xl border-2 border-black px-4 py-2 text-sm font-semibold shadow hover:-translate-y-0.5 transition;
}
</style>
