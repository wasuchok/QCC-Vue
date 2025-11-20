<template>
  <div class="min-h-screen bg-slate-50">
    <div class="mx-auto max-w-6xl px-6 py-10 space-y-6">
      <header class="flex flex-col gap-2">
        <RouterLink to="/admin" class="text-sm font-semibold text-slate-500 hover:text-slate-800">
          ← กลับไปหน้าเมนูผู้ดูแล
        </RouterLink>
        <div>
          <h1 class="text-3xl font-black text-slate-900">ศูนย์ติดตามคำขออนุมัติ QCC</h1>
          <p class="text-sm text-slate-500">
            ตรวจสอบคำขอลงทะเบียนจากหน้าสมัครเข้าร่วมกิจกรรม พร้อมประวัติการส่งและบันทึกคำแนะนำของผู้ดูแลระบบ
          </p>
        </div>
      </header>

      <section class="grid gap-5 lg:grid-cols-[240px_1fr]">
        <aside class="rounded-3xl border border-gray-200 bg-white/90 p-5 shadow-lg">
          <h2 class="text-sm font-semibold text-slate-600">สถานะคำขอ</h2>
          <ul class="mt-3 space-y-2">
            <li v-for="option in statusSidebarOptions" :key="option.value">
              <button
                class="w-full rounded-2xl border px-4 py-3 text-left text-sm font-semibold transition-all"
                :class="filters.status === option.value ? 'border-slate-900 bg-slate-900 text-white shadow-lg' : 'border-slate-200 bg-white text-slate-700 hover:border-slate-400 hover:shadow-md'"
                @click="filters.status = option.value"
              >
                <div class="flex items-center justify-between">
                  <span>{{ option.label }}</span>
                  <span class="text-xs font-normal" :class="filters.status === option.value ? 'text-white/70' : 'text-slate-400'">
                    {{ statusCounts[option.value] || 0 }} รายการ
                  </span>
                </div>
              </button>
            </li>
          </ul>
          <div class="mt-4 text-xs text-slate-500">
            * คลิกสถานะเพื่อกรองรายการคำขออนุมัติ<br />
            * จำนวนรายการจะอัปเดตตามข้อมูลล่าสุด
          </div>
        </aside>

        <div class="rounded-3xl border border-gray-200 bg-white p-5 shadow-lg space-y-4">
          <div class="flex flex-col gap-3 md:flex-row md:items-center md:justify-between">
            <input
              v-model="filters.search"
              class="rounded-2xl border border-slate-200 bg-white px-3 py-2 text-sm text-slate-700 focus:border-slate-500 focus:outline-none"
              placeholder="ค้นหาชื่อกลุ่ม / ฝ่าย"
            />
            <div class="text-sm text-slate-500">ทั้งหมด {{ filteredRequests.length }} รายการ</div>
          </div>

          <div class="overflow-auto rounded-2xl border border-slate-200">
            <table class="w-full min-w-[720px] table-fixed border-collapse text-sm">
              <thead class="bg-slate-50 text-left text-xs uppercase tracking-wide text-slate-500">
                <tr>
                  <th class="px-4 py-3 w-32">คำขอ</th>
                  <th class="px-4 py-3">ชื่อกลุ่ม</th>
                  <th class="px-4 py-3 w-56">ฝ่าย / ทีม</th>
                  <th class="px-4 py-3 w-48">หัวหน้าทีม</th>
                  <th class="px-4 py-3 w-40">สถานะ</th>
                  <th class="px-4 py-3 w-48">วันที่ส่ง</th>
                  <th class="px-4 py-3 w-32"></th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="request in filteredRequests"
                  :key="request.id"
                  class="border-t border-slate-100 hover:bg-slate-50 cursor-pointer transition-colors"
                  @click="openDetail(request.id)"
                >
                  <td class="px-4 py-3 font-semibold text-slate-700">{{ request.id }}</td>
                  <td class="px-4 py-3">
                    <div class="font-semibold text-slate-900">{{ request.groupName }}</div>
                    <div class="text-xs text-slate-500">{{ request.groupType }}</div>
                  </td>
                  <td class="px-4 py-3">
                    <div class="text-slate-900">{{ request.department }}</div>
                    <div class="text-xs text-slate-500">{{ request.team }}</div>
                  </td>
                  <td class="px-4 py-3 text-slate-700">{{ request.leader }}</td>
                  <td class="px-4 py-3">
                    <span class="rounded-full border px-3 py-1 text-xs font-semibold" :class="statusClasses(request.status)">
                      {{ statusLabel(request.status) }}
                    </span>
                  </td>
                  <td class="px-4 py-3 text-slate-600">{{ formatDateTime(request.submittedAt) }}</td>
                  <td class="px-4 py-3 text-right">
                    <button
                      class="rounded-xl border border-slate-300 px-3 py-1 text-xs font-semibold text-slate-700 hover:border-slate-500"
                      type="button"
                      @click.stop="openDetail(request.id)"
                    >
                      ดูรายละเอียด
                    </button>
                  </td>
                </tr>
              </tbody>
            </table>
            <p v-if="!filteredRequests.length" class="p-6 text-center text-sm text-slate-500">ยังไม่มีคำขอตามตัวกรองที่เลือก</p>
          </div>
        </div>
      </section>
    </div>

    <div
      v-if="showModal && currentRequest"
      class="fixed inset-0 z-50 flex items-center justify-center bg-black/50 px-4 py-6"
      @click.self="closeDetail"
    >
      <div class="max-h-full w-full max-w-4xl overflow-y-auto rounded-3xl bg-white p-6 shadow-2xl">
        <div class="flex items-start justify-between gap-4">
          <div>
            <p class="text-xs font-semibold uppercase tracking-wide text-slate-400">คำขอ #{{ currentRequest.id }}</p>
            <h2 class="text-2xl font-bold text-slate-900">{{ currentRequest.groupName }}</h2>
            <p class="text-sm text-slate-500">ส่งเมื่อ {{ formatDateTime(currentRequest.submittedAt, true) }} โดย {{ currentRequest.leader }}</p>
          </div>
          <button class="rounded-full bg-slate-100 p-2 text-slate-500 hover:bg-slate-200" @click="closeDetail">✕</button>
        </div>

        <div class="mt-4 flex flex-wrap items-center gap-2">
          <span class="rounded-full border px-4 py-2 text-sm font-semibold" :class="statusClasses(currentRequest.status)">
            {{ statusLabel(currentRequest.status) }}
          </span>
        </div>

        <dl class="mt-6 grid gap-4 sm:grid-cols-2">
          <div>
            <dt class="text-xs font-semibold uppercase tracking-wide text-slate-400">ฝ่าย / หน่วยงาน</dt>
            <dd class="text-sm text-slate-900">{{ currentRequest.department }}</dd>
          </div>
          <div>
            <dt class="text-xs font-semibold uppercase tracking-wide text-slate-400">ทีม / สายงาน</dt>
            <dd class="text-sm text-slate-900">{{ currentRequest.team }}</dd>
          </div>
          <div>
            <dt class="text-xs font-semibold uppercase tracking-wide text-slate-400">ประเภทกลุ่ม</dt>
            <dd class="text-sm text-slate-900">{{ currentRequest.groupType }}</dd>
          </div>
          <div>
            <dt class="text-xs font-semibold uppercase tracking-wide text-slate-400">คำขวัญทีม</dt>
            <dd class="text-sm text-slate-900">{{ currentRequest.motto || '—' }}</dd>
          </div>
        </dl>

        <div class="mt-6 grid gap-4 lg:grid-cols-2">
          <section class="rounded-2xl border border-slate-100 bg-slate-50/70 p-4">
            <h3 class="text-sm font-semibold text-slate-800">สมาชิกทีม ({{ currentRequest.members.length }})</h3>
            <ul class="mt-3 space-y-2 text-sm text-slate-700">
              <li v-for="member in currentRequest.members" :key="member.uid" class="rounded-xl border border-slate-100 bg-white px-3 py-2">
                <div class="font-semibold">{{ member.name || '(ไม่ระบุชื่อ)' }}</div>
                <div class="text-xs text-slate-500">
                  {{ member.role || 'สมาชิก' }} <span v-if="member.empId">• {{ member.empId }}</span>
                </div>
              </li>
            </ul>
          </section>

          <section class="rounded-2xl border border-slate-100 bg-white p-4">
            <h3 class="text-sm font-semibold text-slate-800">ที่ปรึกษา / ผู้จัดการทีม</h3>
            <ul class="mt-3 space-y-2 text-sm text-slate-700">
              <li v-for="advisor in currentRequest.advisors" :key="advisor.uid" class="rounded-xl border border-slate-100 bg-slate-50 px-3 py-2">
                <div class="font-semibold">{{ advisor.name || '(ไม่ระบุชื่อ)' }}</div>
                <div class="text-xs text-slate-500">{{ advisor.dept || '—' }} <span v-if="advisor.id">• {{ advisor.id }}</span></div>
              </li>
              <li class="rounded-xl border border-slate-100 bg-emerald-50 px-3 py-2">
                <div class="font-semibold text-emerald-800">{{ currentRequest.manager.name || 'ผู้จัดการทีม' }}</div>
                <div class="text-xs text-emerald-700">
                  Manager • {{ currentRequest.manager.dept || '—' }}
                  <span v-if="currentRequest.manager.id">• {{ currentRequest.manager.id }}</span>
                </div>
              </li>
            </ul>
          </section>
        </div>

        <section class="mt-6 rounded-2xl border border-slate-100 bg-white p-4">
          <h3 class="text-sm font-semibold text-slate-800">ประวัติการดำเนินการ</h3>
          <ul class="mt-3 space-y-3">
            <li v-for="event in currentRequest.history" :key="event.at + event.status" class="rounded-xl border border-slate-100 bg-slate-50 px-3 py-2">
              <div class="flex items-center justify-between text-xs text-slate-500">
                <span class="font-semibold text-slate-700">{{ statusLabel(event.status) }}</span>
                <span>{{ formatDateTime(event.at, true) }}</span>
              </div>
              <p class="mt-1 text-sm text-slate-800">{{ event.note }}</p>
              <p class="text-xs text-slate-500">โดย {{ event.actor }}</p>
            </li>
          </ul>
        </section>

        <section class="mt-6 rounded-2xl border border-slate-200 bg-slate-50/70 p-4">
          <h3 class="text-sm font-semibold text-slate-800">อนุมัติ / ขอแก้ไข</h3>
          <textarea
            v-model="remark"
            rows="3"
            class="mt-3 w-full rounded-2xl border border-slate-200 bg-white px-3 py-2 text-sm text-slate-700 focus:border-slate-500 focus:outline-none"
            placeholder="กรอกคำแนะนำสำหรับทีม (เช่น เอกสารไม่ครบ โปรดแนบใบ ตารางรายชื่อ)"
          ></textarea>
          <div class="mt-3 flex flex-wrap gap-2">
            <button
              type="button"
              class="rounded-2xl border border-emerald-600 bg-emerald-600/90 px-4 py-2 text-sm font-semibold text-white shadow hover:bg-emerald-600"
              @click="submitDecision('approved')"
            >
              ✔ อนุมัติ
            </button>
            <button
              type="button"
              class="rounded-2xl border border-sky-600 bg-white px-4 py-2 text-sm font-semibold text-sky-700 shadow hover:bg-sky-50"
              @click="submitDecision('needs-info')"
            >
              ✎ ขอข้อมูลเพิ่ม
            </button>
            <button
              type="button"
              class="rounded-2xl border border-rose-600 bg-white px-4 py-2 text-sm font-semibold text-rose-700 shadow hover:bg-rose-50"
              @click="submitDecision('rejected')"
            >
              ✖ ปฏิเสธ
            </button>
          </div>
          <p class="mt-2 text-xs text-slate-500">
            หมายเหตุทุกครั้งจะถูกบันทึกใน Transaction History และส่งแจ้งหัวหน้าทีมทันที
          </p>
        </section>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed, reactive, ref, watch } from 'vue'
import { RouterLink } from 'vue-router'
import { useRegisterShared } from '@/stores/registerShared'

const sharedRegister = useRegisterShared()

const filters = reactive({
  status: 'all',
  search: '',
})

const requests = ref([])
const selectedId = ref('')
const remark = ref('')
const showModal = ref(false)

const statusMeta = {
  pending: { label: 'รออนุมัติ', class: 'border-amber-200 bg-amber-100 text-amber-700' },
  approved: { label: 'อนุมัติแล้ว', class: 'border-emerald-200 bg-emerald-100 text-emerald-700' },
  rejected: { label: 'ปฏิเสธ', class: 'border-rose-200 bg-rose-100 text-rose-700' },
  'needs-info': { label: 'ขอข้อมูลเพิ่ม', class: 'border-sky-200 bg-sky-100 text-sky-700' },
  draft: { label: 'บันทึกร่าง', class: 'border-slate-200 bg-slate-100 text-slate-600' },
}

const statusFilterOptions = [
  { value: 'pending', label: 'รออนุมัติ' },
  { value: 'approved', label: 'อนุมัติแล้ว' },
  { value: 'needs-info', label: 'ขอข้อมูลเพิ่ม' },
  { value: 'rejected', label: 'ปฏิเสธ' },
]

const statusSidebarOptions = computed(() => [
  { value: 'all', label: 'สถานะทั้งหมด' },
  ...statusFilterOptions,
])

const statusCounts = computed(() => {
  const counts = { all: requests.value.length }
  statusFilterOptions.forEach(opt => {
    counts[opt.value] = 0
  })
  requests.value.forEach(req => {
    if (typeof counts[req.status] === 'number') counts[req.status] += 1
    counts.all += 0 // keep property
  })
  return counts
})

const filteredRequests = computed(() => {
  const search = filters.search.trim().toLowerCase()
  return requests.value.filter(request => {
    const matchStatus = filters.status === 'all' || request.status === filters.status
    const matchSearch =
      !search ||
      request.groupName.toLowerCase().includes(search) ||
      request.department.toLowerCase().includes(search) ||
      (request.team || '').toLowerCase().includes(search)
    return matchStatus && matchSearch
  })
})

const currentRequest = computed(() => requests.value.find(req => req.id === selectedId.value) || null)

watch(
  () => sharedRegister.lastUpdated,
  () => {
    requests.value = createSeedRequests(sharedRegister)
    if (selectedId.value && !requests.value.some(req => req.id === selectedId.value)) {
      selectedId.value = ''
      showModal.value = false
    }
  },
  { immediate: true }
)

function openDetail(id) {
  selectedId.value = id
  remark.value = ''
  showModal.value = true
}

function closeDetail() {
  showModal.value = false
}

function submitDecision(status) {
  const targetIndex = requests.value.findIndex(req => req.id === currentRequest.value?.id)
  if (targetIndex === -1) return
  const noteFallback = {
    approved: 'อนุมัติให้ดำเนินกิจกรรมตามแผนที่เสนอ',
    rejected: 'ปฏิเสธการอนุมัติ โปรดปรับปรุงข้อมูลและส่งใหม่',
    'needs-info': 'กรุณาแก้ไขรายละเอียดให้ครบถ้วนแล้วส่งกลับมาอีกครั้ง',
  }
  const message = remark.value.trim() || noteFallback[status] || ''
  const now = new Date().toISOString()
  const target = requests.value[targetIndex]
  target.status = status
  target.history = [
    {
      status,
      note: message,
      actor: 'QCC Admin',
      at: now,
    },
    ...target.history,
  ]
  remark.value = ''
}

function statusLabel(status) {
  return statusMeta[status]?.label || status
}

function statusClasses(status) {
  return statusMeta[status]?.class || 'border-slate-200 bg-slate-100 text-slate-600'
}

function formatDateTime(value, withTime = false) {
  if (!value) return '—'
  try {
    const date = new Date(value)
    return date.toLocaleString('th-TH', withTime ? { dateStyle: 'medium', timeStyle: 'short' } : { dateStyle: 'medium' })
  } catch {
    return value
  }
}

function createSeedRequests(shared) {
  const seeds = [
    {
      id: 'REQ-1052',
      groupName: 'Delta Kaizen Lab',
      department: 'ฝ่ายผลิต',
      team: 'Press Line A',
      groupType: 'ลดของเสีย / QCC',
      motto: 'Zero Defect Everyday',
      status: 'pending',
      submittedAt: '2025-05-01T08:15:00+07:00',
      leader: 'วรพล สมคิด',
      manager: { name: 'สุกัญญา ขจรศักดิ์', dept: 'ฝ่ายผลิต', id: 'M-208' },
      advisors: [
        { uid: 'adv-1', name: 'ดร.กมล สุวรรณ', dept: 'QCC Office', id: 'SV-04' },
        { uid: 'adv-2', name: 'ชาญชัย อินทร์ทอง', dept: 'Production Support', id: 'SV-12' },
      ],
      members: [
        { uid: 'mem-1', name: 'วรพล สมคิด', empId: '620145', role: 'หัวหน้าทีม' },
        { uid: 'mem-2', name: 'ฐิติภัทร มณีคำ', empId: '640211', role: 'รองหัวหน้า' },
        { uid: 'mem-3', name: 'ทอฝัน จิตรานุรักษ์', empId: '650077', role: 'เลขานุการ' },
      ],
      history: [
        { status: 'pending', note: 'ส่งคำขออนุมัติจากระบบหน้าบ้าน', actor: 'ระบบ', at: '2025-05-01T08:15:00+07:00' },
        { status: 'draft', note: 'บันทึกข้อมูลทีมเรียบร้อย', actor: 'หัวหน้าทีม', at: '2025-04-30T19:02:00+07:00' },
      ],
    },
    {
      id: 'REQ-1046',
      groupName: 'Omega Innovators',
      department: 'ฝ่ายวิศวกรรม',
      team: 'R&D Automation',
      groupType: 'นวัตกรรมเพิ่มประสิทธิภาพ',
      motto: 'Improve for Impact',
      status: 'needs-info',
      submittedAt: '2025-04-25T10:42:00+07:00',
      leader: 'ภิญญดา บุญเลิศ',
      manager: { name: 'ชรินทร์ พิมพ์ใจ', dept: 'ฝ่ายวิศวกรรม', id: 'M-115' },
      advisors: [{ uid: 'adv-3', name: 'อาทิตย์ ลีลาวัณย์', dept: 'QCC Office', id: 'SV-05' }],
      members: [
        { uid: 'mem-4', name: 'ภิญญดา บุญเลิศ', empId: '600211', role: 'หัวหน้าทีม' },
        { uid: 'mem-5', name: 'ธนกรณ์ ศรีสวัสดิ์', empId: '620512', role: 'รองหัวหน้า' },
        { uid: 'mem-6', name: 'จตุรงค์ ชูใจ', empId: '630334', role: 'เลขานุการ' },
        { uid: 'mem-7', name: 'ภาคภูมิ ตั้งเจริญ', empId: '650120', role: 'สมาชิก' },
      ],
      history: [
        { status: 'needs-info', note: 'โปรดแนบเอกสารบทสรุปผลกระทบและประมาณการค่าใช้จ่าย', actor: 'QCC Admin', at: '2025-04-28T15:10:00+07:00' },
        { status: 'pending', note: 'ส่งคำขออนุมัติ', actor: 'ระบบ', at: '2025-04-25T10:42:00+07:00' },
      ],
    },
    {
      id: 'REQ-0999',
      groupName: 'Sigma Lean Force',
      department: 'ฝ่ายโลจิสติกส์',
      team: 'Logistics North',
      groupType: 'LEAN / ลดเวลาการขนย้าย',
      motto: 'Faster & Safer',
      status: 'approved',
      submittedAt: '2025-04-10T09:00:00+07:00',
      leader: 'สมคิด กุลวงศ์',
      manager: { name: 'สาริศา ทองดี', dept: 'ฝ่ายโลจิสติกส์', id: 'M-066' },
      advisors: [{ uid: 'adv-4', name: 'ณิชา ปัญญาไว', dept: 'QCC Office', id: 'SV-02' }],
      members: [
        { uid: 'mem-8', name: 'สมคิด กุลวงศ์', empId: '591344', role: 'หัวหน้าทีม' },
        { uid: 'mem-9', name: 'อาทิตยา วงษ์วานิช', empId: '600421', role: 'รองหัวหน้า' },
        { uid: 'mem-10', name: 'ปฏิภาณ โชติช่วง', empId: '620788', role: 'เลขานุการ' },
      ],
      history: [
        { status: 'approved', note: 'ข้อมูลครบถ้วน อนุมัติให้ดำเนินกิจกรรม', actor: 'QCC Admin', at: '2025-04-11T11:30:00+07:00' },
        { status: 'pending', note: 'ส่งคำขออนุมัติ', actor: 'ระบบ', at: '2025-04-10T09:00:00+07:00' },
      ],
    },
  ]

  const sharedRequest = buildRequestFromShared(shared)
  if (sharedRequest) {
    seeds.unshift(sharedRequest)
  }
  return seeds
}

function buildRequestFromShared(shared) {
  if (!shared || (!shared.groupName && !shared.department && !shared.team)) return null
  const now = shared.lastUpdated || Date.now()
  const members = (shared.members || []).map((member, idx) => ({
    uid: member.uid || `shared-member-${idx}`,
    name: member.name || `พนักงาน ${member.empId || idx + 1}`,
    empId: member.empId || '',
    role: member.position || (idx === 0 ? 'หัวหน้าทีม (จากฟอร์ม)' : 'สมาชิก'),
  }))

  return {
    id: 'REQ-LOCAL',
    groupName: shared.groupName || '(ยังไม่ระบุชื่อกลุ่ม)',
    department: shared.departmentName || shared.department || '—',
    team: shared.teamName || shared.team || '—',
    groupType: shared.groupType || '—',
    motto: shared.motto || '',
    status: 'pending',
    submittedAt: new Date(now).toISOString(),
    leader: members[0]?.name || 'หัวหน้าทีม (ยังไม่ระบุ)',
    manager: {
      id: shared.manager?.id || '',
      name: shared.manager?.name || '—',
      dept: shared.manager?.dept || shared.teamName || shared.departmentName || '',
    },
    advisors: (shared.advisors || []).map((advisor, idx) => ({
      uid: advisor.uid || `shared-adv-${idx}`,
      name: advisor.name || '',
      dept: advisor.dept || '',
      id: advisor.id || '',
    })),
    members,
    history: [
      {
        status: 'pending',
        note: 'สร้างคำขอจากข้อมูลล่าสุดของหน้า RegisterQCC',
        actor: 'ระบบ',
        at: new Date(now).toISOString(),
      },
    ],
  }
}
</script>
