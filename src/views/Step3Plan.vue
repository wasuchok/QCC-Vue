<template>
  <div class="flex flex-col lg:flex-row gap-4 items-start">
    <StepSidebar
      class="lg:sticky lg:top-6 flex-shrink-0"
      :sections="stepSections"
      current-key="step3-plan"
      title="STEP 3"
    />

    <div class="bg-gradient-to-br from-[#eef5ff] via-white to-[#fdf2ff] border border-white/60 shadow-lg rounded-[32px] p-6 flex-1 space-y-6">
      <header class="text-center space-y-1">
        <div class="text-[28px] font-extrabold leading-tight">แผนการดำเนินงาน</div>
        <p class="text-sm text-slate-600">กำหนดกิจกรรมตาม PDCA พร้อมเครื่องหมาย Plan/Actual แยกแต่ละหัวข้อ</p>
      </header>

      <div class="space-y-6">
        <article
          v-for="stage in stages"
          :key="stage.key"
          class="stage-card rounded-3xl border border-white/50 shadow-md p-4 space-y-4"
          :class="stageColorClass(stage.key)"
        >
          <div class="flex flex-wrap justify-between items-center gap-3">
            <div>
              <p class="stage-title text-lg font-bold">{{ stage.label }}</p>
              <p class="text-xs text-slate-600">เพิ่มหัวข้อย่อยได้หลายรายการ</p>
            </div>
            <button class="action-btn bg-white" @click="addTask(stage.key)">+ เพิ่มหัวข้อ</button>
          </div>

          <div class="overflow-auto rounded-2xl border border-slate-100 bg-white/80 backdrop-blur">
            <table class="plan-table w-full border-collapse text-xs text-slate-700">
              <thead>
                <tr class="bg-[#fff2b8] text-slate-900">
                  <th rowspan="2" class="section-col">Section</th>
                  <th rowspan="2" class="detail-col">Detail</th>
                  <th rowspan="2" class="type-col">ประเภท</th>
                  <th v-for="month in months" :key="`${stage.key}-${month}-h`" :colspan="weeks.length" class="border border-black px-2 py-1">
                    {{ month }}
                  </th>
                </tr>
                <tr class="bg-[#e3f2fd] text-slate-700">
                  <th v-for="month in months" :key="`${stage.key}-${month}-weeks`" class="border border-black px-1 py-1">
                    <div class="grid grid-cols-4 gap-1 font-semibold">
                      <span v-for="week in weeks" :key="week">{{ week }}</span>
                    </div>
                  </th>
                </tr>
              </thead>
              <tbody>
                <template v-for="(task, idx) in stage.tasks" :key="task.id">
                  <tr>
                    <td class="section-cell" rowspan="2">{{ stage.label }}</td>
                    <td class="detail-cell" rowspan="2">
                      <textarea
                        v-model="task.detail"
                        class="task-input min-h-[100px]"
                        placeholder="รายละเอียดกิจกรรม"
                      ></textarea>
                      <button
                        v-if="stage.tasks.length > 1"
                        class="action-btn-secondary mt-2"
                        type="button"
                        @click="removeTask(stage.key, task.id)"
                      >
                        ลบหัวข้อ
                      </button>
                    </td>
                    <td class="type-cell text-blue-600">Plan</td>
                    <td
                      v-for="month in months"
                      :key="`${task.id}-${month}-plan`"
                      class="border border-black px-1 py-1"
                    >
                      <div class="grid grid-cols-4 gap-1">
                        <button
                          v-for="week in weeks"
                          :key="week"
                          type="button"
                          class="week-cell"
                          :class="task.schedulePlan[month][week] ? 'is-plan' : ''"
                          @click="toggleWeek(stage.key, task.id, 'plan', month, week)"
                        >
                          {{ week }}
                        </button>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="type-cell text-red-600">Actual</td>
                    <td
                      v-for="month in months"
                      :key="`${task.id}-${month}-actual`"
                      class="border border-black px-1 py-1"
                    >
                      <div class="grid grid-cols-4 gap-1">
                        <button
                          v-for="week in weeks"
                          :key="week"
                          type="button"
                          class="week-cell"
                          :class="task.scheduleActual[month][week] ? 'is-actual' : ''"
                          @click="toggleWeek(stage.key, task.id, 'actual', month, week)"
                        >
                          {{ week }}
                        </button>
                      </div>
                    </td>
                  </tr>
                </template>
              </tbody>
            </table>
          </div>
        </article>
      </div>

      <section class="rounded-[24px] border border-white/60 bg-white/90 backdrop-blur p-4 space-y-3 text-sm shadow-md">
        <div class="grid gap-3 sm:grid-cols-2">
          <div class="flex flex-col gap-1">
            <label class="font-semibold">ระยะเวลาดำเนินกิจกรรม (เริ่ม)</label>
            <input type="date" v-model="timeline.start" class="timeline-input" />
          </div>
          <div class="flex flex-col gap-1">
            <label class="font-semibold">ระยะเวลาดำเนินกิจกรรม (ถึง)</label>
            <input type="date" v-model="timeline.end" class="timeline-input" />
          </div>
        </div>
        <div class="grid gap-3 sm:grid-cols-2">
          <div class="flex items-center gap-2">
            <label class="font-semibold whitespace-nowrap">กำหนดการประชุม</label>
            <input type="number" min="1" v-model.number="timeline.frequency" class="timeline-input" />
            <span>ครั้ง / เดือน</span>
          </div>
          <p class="text-xs text-red-600">
            * ระยะเวลาดำเนินกิจกรรมไม่ควรเกิน 30 เมษายน
          </p>
        </div>
      </section>

      <div class="flex flex-wrap gap-3 justify-end">
        <button class="action-btn bg-white" @click="goBack">« ย้อนกลับ</button>
        <button class="action-btn bg-white" @click="savePlan">💾 บันทึก</button>
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
const months = ['Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov']
const weeks = ['W1', 'W2', 'W3', 'W4']

function cryptoId() {
  if (typeof crypto !== 'undefined' && crypto.randomUUID) {
    return crypto.randomUUID()
  }
  return Math.random().toString(36).slice(2, 10)
}

function createSchedule() {
  return months.reduce((acc, month) => {
    acc[month] = weeks.reduce((wkAcc, week) => {
      wkAcc[week] = ''
      return wkAcc
    }, {})
    return acc
  }, {})
}

function createTask(stageKey) {
  return {
    id: `${stageKey}-${cryptoId()}`,
    detail: '',
    schedulePlan: createSchedule(),
    scheduleActual: createSchedule(),
  }
}

const stageMeta = {
  P: { label: 'Plan', className: 'stage-plan' },
  D: { label: 'Do', className: 'stage-do' },
  C: { label: 'Check', className: 'stage-check' },
  A: { label: 'Act', className: 'stage-act' },
}

const stages = reactive(Object.keys(stageMeta).map(key => ({
  key,
  label: stageMeta[key].label,
  tasks: [createTask(key)],
})))

const timeline = reactive({
  start: '',
  end: '',
  frequency: 1,
})

function findTask(stageKey, taskId) {
  const stage = stages.find(item => item.key === stageKey)
  if (!stage) return null
  const task = stage.tasks.find(t => t.id === taskId)
  if (!task) return null
  return { stage, task }
}

function toggleWeek(stageKey, taskId, type, month, week) {
  const found = findTask(stageKey, taskId)
  if (!found) return
  const schedule = type === 'plan' ? found.task.schedulePlan : found.task.scheduleActual
  schedule[month][week] = !schedule[month][week]
}

function addTask(stageKey) {
  const stage = stages.find(item => item.key === stageKey)
  if (!stage) return
  stage.tasks.push(createTask(stageKey))
}

function removeTask(stageKey, taskId) {
  const stage = stages.find(item => item.key === stageKey)
  if (!stage || stage.tasks.length <= 1) return
  const index = stage.tasks.findIndex(task => task.id === taskId)
  if (index >= 0) {
    stage.tasks.splice(index, 1)
  }
}

function savePlan() {
  alert('บันทึกข้อมูลแผนการดำเนินงาน (ตัวอย่าง)')
}

function goBack() {
  router.push('/step3/goals')
}

function goNext() {
  router.push('/minutes5')
}

function stageColorClass(key) {
  return stageMeta[key]?.className || ''
}
</script>

<style scoped>
@reference "tailwindcss";

.stage-card {
  @apply bg-white/80 backdrop-blur;
}
.stage-plan {
  @apply border-blue-200 bg-gradient-to-br from-[#e3f2ff] to-white;
}
.stage-plan .stage-title {
  @apply text-blue-700;
}
.stage-do {
  @apply border-amber-200 bg-gradient-to-br from-[#fff5db] to-white;
}
.stage-do .stage-title {
  @apply text-amber-700;
}
.stage-check {
  @apply border-emerald-200 bg-gradient-to-br from-[#e6fff5] to-white;
}
.stage-check .stage-title {
  @apply text-emerald-700;
}
.stage-act {
  @apply border-rose-200 bg-gradient-to-br from-[#ffe5ed] to-white;
}
.stage-act .stage-title {
  @apply text-rose-700;
}

.task-label {
  @apply text-xs font-semibold text-slate-500;
}

.task-input {
  @apply w-full rounded-2xl border border-slate-200 px-3 py-2 text-sm bg-white shadow-inner shadow-white;
}

.week-cell {
  @apply rounded-md border border-slate-300 text-[10px] font-semibold py-1 text-center transition;
}
.week-cell.is-plan {
  @apply bg-blue-100 border-blue-400 text-blue-700 shadow-sm;
}
.week-cell.is-actual {
  @apply bg-red-100 border-red-400 text-red-600 shadow-sm;
}

.legend {
  @apply inline-flex items-center rounded-xl border px-2 py-0.5 text-[11px] font-semibold shadow-sm;
}
.legend.plan {
  @apply border-blue-500 text-blue-600;
}
.legend.actual {
  @apply border-red-500 text-red-600;
}

.timeline-input {
  @apply rounded-2xl border border-slate-200 px-3 py-2 text-sm w-full bg-white;
}

.action-btn {
  @apply rounded-2xl border border-slate-300 px-4 py-2 text-sm font-semibold shadow-sm bg-white hover:-translate-y-0.5 transition;
}
.action-btn-secondary {
  @apply rounded-xl border border-rose-200 px-3 py-2 text-xs font-semibold text-rose-600 bg-white hover:bg-rose-50 transition;
}
</style>
