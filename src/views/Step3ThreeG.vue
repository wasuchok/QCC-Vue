<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :sections="stepSections"
      current-key="step3-threeg"
      title="STEP 3"
    />

    <div class="bg-[#f5fbff] border-4 border-black rounded-[28px] p-5 flex-1 space-y-4">
      <header class="space-y-2">
        <div class="flex items-center gap-3 text-lg font-bold">
          <span class="flex h-8 w-8 items-center justify-center rounded-full border-2 border-black bg-white">3.2</span>
          <span>ลงหน้างานจริง สำรวจโดยใช้ 3G</span>
        </div>
        <p class="text-sm text-slate-600">
          ตรวจสอบสถานที่จริง วัตถุจริง และข้อเท็จจริง เพื่อรวบรวมหลักฐานก่อนพัฒนากิจกรรม
        </p>
      </header>

      <section class="rounded-[24px] border-4 border-black bg-white p-4 space-y-4">
        <p class="text-xs text-slate-500">
          บันทึกผลจากการลงพื้นที่ตามหลัก 3G (Genba / Genbutsu / Genjitsu) พร้อมแนบภาพหรือไฟล์ประกอบ
        </p>
        <div class="grid gap-4 md:grid-cols-3">
          <article
            v-for="(area, idx) in threeGAreas"
            :key="area.key"
            class="rounded-3xl border-2 border-black bg-[#f8fdff] p-4 flex flex-col gap-3"
          >
            <div>
              <h3 class="text-base font-bold text-slate-900">{{ area.title }}</h3>
              <p class="text-xs font-semibold text-slate-500">{{ area.subtitle }}</p>
              <p class="text-xs text-slate-500">{{ area.description }}</p>
            </div>
            <textarea
              v-model="area.notes"
              class="table-input min-h-[200px]"
              :placeholder="`ระบุสิ่งที่พบจาก ${area.title}`"
            ></textarea>
            <label class="flex cursor-pointer flex-col items-center justify-center gap-1 rounded-2xl border-2 border-dashed border-slate-400 bg-white px-3 py-3 text-sm font-semibold text-slate-600 hover:bg-slate-50 transition">
              <input
                class="hidden"
                type="file"
                multiple
                @change="on3GFilesChange(idx, $event)"
              />
              📎 คลิก เพื่อแนบไฟล์
              <span class="text-xs font-normal">รองรับหลายไฟล์</span>
            </label>
            <ul v-if="area.fileNames.length" class="text-xs text-slate-600 space-y-1">
              <li v-for="name in area.fileNames" :key="name" class="flex items-center gap-1">
                <span>•</span>
                <span>{{ name }}</span>
              </li>
            </ul>
          </article>
        </div>
      </section>

      <div class="flex flex-wrap gap-3 justify-end">
        <button class="action-btn bg-white" @click="goBack">« ย้อนกลับ</button>
        <button class="action-btn bg-white" @click="saveThreeG">💾 บันทึก</button>
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

const stepSections = STEP1_AND_2_SIDEBAR
const router = useRouter()

const threeGAreas = reactive([
  {
    key: 'genba',
    title: 'Genba (現場)',
    subtitle: 'สถานที่จริงที่เกิดเหตุ',
    description: 'ลงหน้างานเพื่อดูสภาพพื้นที่ เครื่องจักร หรือขั้นตอนการทำงานจริง',
    notes: '',
    fileNames: [],
  },
  {
    key: 'genbutsu',
    title: 'Genbutsu (現物)',
    subtitle: 'ของจริง',
    description: 'ตรวจสอบวัตถุ อุปกรณ์ หรือชิ้นส่วนที่เกี่ยวข้องกับปัญหา',
    notes: '',
    fileNames: [],
  },
  {
    key: 'genjitsu',
    title: 'Genjitsu (現実)',
    subtitle: 'ข้อเท็จจริง',
    description: 'รวบรวมข้อมูลจริง ตัวเลข หรือหลักฐานที่ยืนยันปัญหา',
    notes: '',
    fileNames: [],
  },
])

function on3GFilesChange(index, event) {
  const files = Array.from(event?.target?.files || [])
  threeGAreas[index].fileNames = files.map(file => file.name)
}

function saveThreeG() {
  alert('บันทึกข้อมูล (ตัวอย่าง)')
}

function goNext() {
  router.push('/minutes4')
}

function goBack() {
  router.push('/step3/motivation')
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
