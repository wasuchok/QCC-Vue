<template>
  <div class="min-h-screen bg-slate-100">
    <header class="bg-gradient-to-r from-slate-900 via-slate-800 to-slate-900 text-white">
      <div class="mx-auto flex max-w-6xl flex-col gap-6 px-6 py-8 lg:flex-row lg:items-center lg:justify-between">
        <div>
          <p class="text-xs uppercase tracking-wide text-white/70">QCC Admin Center</p>
          <h1 class="mt-1 text-3xl font-black">ศูนย์ควบคุมระบบกิจกรรม</h1>
          <p class="mt-2 max-w-xl text-sm text-white/80">
            แดชบอร์ดกลางสำหรับทีม QCC ช่วยตรวจสอบคำขอ อัปเดตข้อมูลพนักงาน และดูภาพรวมการดำเนินงานได้ในหน้าเดียว
          </p>
        </div>
        <div class="flex flex-wrap gap-3">
          <RouterLink
            to="/admin/registrations"
            class="inline-flex items-center gap-2 rounded-2xl bg-white/10 px-4 py-2 text-sm font-semibold text-white ring-1 ring-white/30 backdrop-blur transition hover:bg-white/20"
          >
            <span>ติดตามคำขออนุมัติ</span>
            <span aria-hidden="true">→</span>
          </RouterLink>
          <RouterLink
            to="/admin/employees"
            class="inline-flex items-center gap-2 rounded-2xl bg-white px-4 py-2 text-sm font-semibold text-slate-900 shadow-lg transition hover:-translate-y-0.5"
          >
            จัดการข้อมูลพนักงาน
            <span aria-hidden="true">↗</span>
          </RouterLink>
        </div>
      </div>
    </header>

    <main class="mx-auto max-w-6xl space-y-6 px-6 py-8">
      <section class="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        <article v-for="stat in statCards" :key="stat.label" class="rounded-3xl bg-white p-5 shadow-lg">
          <div class="flex items-center justify-between text-xs font-semibold uppercase tracking-wide text-slate-400">
            <span>{{ stat.label }}</span>
            <span :class="stat.trend.startsWith('+') ? 'text-emerald-500' : 'text-rose-500'">{{ stat.trend }}</span>
          </div>
          <p class="mt-3 text-3xl font-black text-slate-900">{{ stat.value }}</p>
          <p class="mt-1 text-xs text-slate-500">{{ stat.hint }}</p>
        </article>
      </section>

      <section class="grid gap-5 lg:grid-cols-[360px_1fr]">
        <div class="rounded-3xl bg-white p-5 shadow-lg">
          <h2 class="text-sm font-semibold uppercase tracking-wide text-slate-500">เมนูด่วน</h2>
          <ul class="mt-4 space-y-3">
            <li v-for="item in quickLinks" :key="item.title">
              <RouterLink
                :to="item.route"
                class="group flex items-center gap-3 rounded-2xl border border-slate-200 px-4 py-3 transition hover:-translate-y-0.5 hover:border-slate-400 hover:shadow-md"
              >
                <span class="flex h-11 w-11 items-center justify-center rounded-2xl bg-slate-900/5 text-lg">{{ item.icon }}</span>
                <span>
                  <span class="block text-sm font-semibold text-slate-900">{{ item.title }}</span>
                  <span class="block text-xs text-slate-500">{{ item.subtitle }}</span>
                </span>
                <span class="ml-auto text-slate-300 group-hover:text-slate-600" aria-hidden="true">→</span>
              </RouterLink>
            </li>
          </ul>
        </div>

        <div class="rounded-3xl bg-white p-5 shadow-lg">
          <div class="flex flex-col gap-2 md:flex-row md:items-center md:justify-between">
            <div>
              <h2 class="text-lg font-semibold text-slate-900">สถานะการดำเนินงานล่าสุด</h2>
              <p class="text-sm text-slate-500">ตัวอย่างกิจกรรมที่ต้องดูแลต่อ</p>
            </div>
            <RouterLink
              to="/admin/registrations"
              class="text-sm font-semibold text-slate-600 underline-offset-4 hover:text-slate-900 hover:underline"
            >
              ดูทั้งหมด
            </RouterLink>
          </div>

          <ul class="mt-4 space-y-3">
            <li
              v-for="request in recentRequests"
              :key="request.id"
              class="rounded-2xl border border-slate-100 bg-slate-50/70 px-4 py-3"
            >
              <div class="flex flex-wrap items-center justify-between gap-2">
                <div>
                  <p class="text-sm font-semibold text-slate-900">{{ request.groupName }}</p>
                  <p class="text-xs text-slate-500">{{ request.department }} • {{ request.team }}</p>
                </div>
                <span class="rounded-full px-3 py-1 text-xs font-semibold" :class="request.badgeClass">
                  {{ request.status }}
                </span>
              </div>
              <p class="mt-1 text-xs text-slate-500">{{ request.note }}</p>
            </li>
          </ul>
        </div>
      </section>

      <section class="grid gap-5 lg:grid-cols-2">
        <article class="rounded-3xl bg-white p-5 shadow-lg">
          <h2 class="text-lg font-semibold text-slate-900">ภารกิจที่ต้องติดตาม</h2>
          <ul class="mt-4 space-y-3 text-sm text-slate-700">
            <li v-for="task in followUpTasks" :key="task.title" class="rounded-2xl border border-slate-100 p-4">
              <div class="flex items-center justify-between">
                <p class="font-semibold text-slate-900">{{ task.title }}</p>
                <span class="text-xs text-slate-400">{{ task.deadline }}</span>
              </div>
              <p class="mt-1 text-xs text-slate-500">{{ task.detail }}</p>
            </li>
          </ul>
        </article>

        <article class="rounded-3xl bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 p-6 text-white shadow-lg">
          <h2 class="text-lg font-semibold">ศูนย์ช่วยเหลือ</h2>
          <p class="mt-2 text-sm text-white/80">
            หากต้องการเพิ่มสิทธิ์ผู้ใช้งานหรือมีปัญหาเกี่ยวกับการอนุมัติ ให้ติดต่อ QCC Support ได้ทุกวันทำการ 08:00-18:00 น.
          </p>
          <div class="mt-4 grid gap-3 text-sm">
            <div class="rounded-2xl bg-white/10 px-4 py-3">
              <p class="text-xs uppercase tracking-wide text-white/60">ช่องทางด่วน</p>
              <p class="text-lg font-bold">ภายใน 1234</p>
            </div>
            <div class="rounded-2xl bg-white/10 px-4 py-3">
              <p class="text-xs uppercase tracking-wide text-white/60">อีเมล</p>
              <p class="text-lg font-bold">qcc-support@company.com</p>
            </div>
          </div>
        </article>
      </section>
    </main>
  </div>
</template>

<script setup>
const statCards = [
  { label: 'คำขอรออนุมัติ', value: '5', trend: '+2', hint: 'ต้องตรวจสอบภายใน 3 วันทำการ' },
  { label: 'ทีมลงทะเบียนปีนี้', value: '34', trend: '+6', hint: 'เพิ่มขึ้นจากปีก่อน 15%' },
  { label: 'ผู้ใช้งานในระบบ', value: '248', trend: '+4', hint: 'รวมทุกหน่วยงานที่มีบัญชี' },
  { label: 'การแจ้งเตือนใหม่', value: '12', trend: '+1', hint: 'มาจากคำขอ และการปรับบทบาท' },
]

const quickLinks = [
  {
    title: 'คำขออนุมัติกลุ่ม QCC',
    subtitle: 'ตรวจสอบ/อนุมัติ หรือขอข้อมูลเพิ่มเติม',
    route: '/admin/registrations',
    icon: '🗂️',
  },
  {
    title: 'ประวัติพนักงาน',
    subtitle: 'ค้นหาและอัปเดตข้อมูลบุคลากร',
    route: '/admin/employees',
    icon: '👥',
  },
  {
    title: 'กำหนดการอบรม',
    subtitle: 'บันทึกและเผยแพร่ตารางอบรม',
    route: '/',
    icon: '📅',
  },
]

const recentRequests = [
  { id: 'REQ-1052', groupName: 'Delta Kaizen Lab', department: 'ฝ่ายผลิต', team: 'Press Line A', status: 'รออนุมัติ', badgeClass: 'bg-amber-100 text-amber-700', note: 'แนบสรุปผลกระทบเรียบร้อย รออนุมัติ' },
  { id: 'REQ-1046', groupName: 'Omega Innovators', department: 'ฝ่ายวิศวกรรม', team: 'R&D Automation', status: 'ขอข้อมูลเพิ่ม', badgeClass: 'bg-sky-100 text-sky-700', note: 'ขอรายละเอียดค่าใช้จ่ายเพิ่มเติม' },
  { id: 'REQ-0999', groupName: 'Sigma Lean Force', department: 'ฝ่ายโลจิสติกส์', team: 'Logistics North', status: 'อนุมัติแล้ว', badgeClass: 'bg-emerald-100 text-emerald-700', note: 'อนุมัติใน 11 เม.ย. 2568' },
]

const followUpTasks = [
  { title: 'ตรวจสอบหัวข้ออบรมใหม่', deadline: 'ครบกำหนด: 20 พ.ค.', detail: 'ยืนยันหัวข้อการอบรมให้ทีมที่เริ่มกิจกรรมไตรมาสหน้า' },
  { title: 'สรุปผลการอนุมัติรอบเดือนนี้', deadline: 'ครบกำหนด: 25 พ.ค.', detail: 'เตรียมรายงานสำหรับผู้บริหารก่อนประชุมสรุป' },
  { title: 'อัปเดตโครงสร้างทีม', deadline: 'ครบกำหนด: 28 พ.ค.', detail: 'ตรวจสอบทีมที่เปลี่ยนหัวหน้าหรือสมาชิก' },
]
</script>
