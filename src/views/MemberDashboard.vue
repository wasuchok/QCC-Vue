<template>
  <div class="min-h-screen bg-gradient-to-b from-[#e1ecff] to-[#f7fbff] py-8 px-4">
    <div class="mx-auto max-w-6xl rounded-[32px] border-4 border-black bg-white shadow-2xl overflow-hidden">
      <div class="grid lg:grid-cols-[210px_1fr]">
        <aside class="border-r-4 border-black bg-[#f3fbfb] p-4">
          <div class="flex flex-col gap-4">
            <button class="rounded-2xl border-2 border-black bg-white py-3 text-sm font-semibold">
              รายงานสถานะ
            </button>
            <RouterLink
              to="/"
              class="rounded-2xl border-2 border-black bg-[#e6f0ff] py-3 text-center text-sm font-semibold hover:bg-[#cddffc]"
            >
              ← กลับสู่หน้าหลัก
            </RouterLink>
          </div>
        </aside>

        <div class="p-6">
          <div class="rounded-[24px] border-4 border-black bg-[#f4fbff] p-4">
            <div class="flex flex-col gap-2 text-center">
              <h1 class="text-3xl font-black text-slate-900">สัญลักษณ์แสดงสถานะของการดำเนินกิจกรรม QCC</h1>
              <p class="text-xs text-slate-500">ข้อมูลจะอัปเดตตามคำสั่งอนุมัติจากผู้ดูแลระบบ</p>
            </div>

            <div class="mt-4 grid gap-3 rounded-2xl border-2 border-black bg-white p-3 text-xs font-semibold text-slate-700 md:grid-cols-3">
              <div class="flex items-center gap-2">
                <span class="flex h-7 w-7 items-center justify-center rounded-full bg-yellow-400 text-black">▲</span>
                อยู่ในระหว่างดำเนินการ
              </div>
              <div class="flex items-center gap-2">
                <span class="h-4 w-10 rounded-full bg-blue-600"></span>
                SV, TM ต้นสังกัด อนุมัติ
              </div>
              <div class="flex items-center gap-2">
                <span class="h-6 w-6 rounded-full border-4 border-emerald-500"></span>
                Leader กิจกรรม QCC
              </div>
            </div>
          </div>

          <div class="mt-6 overflow-auto rounded-[24px] border-4 border-black">
            <table class="w-full border-collapse">
              <thead class="bg-[#eaf6ff] text-sm font-semibold">
                <tr>
                  <th class="border border-black px-3 py-2 text-center w-16">No.</th>
                  <th class="border border-black px-3 py-2 w-32">Logo</th>
                  <th class="border border-black px-3 py-2 text-left">Team</th>
                  <th v-for="step in steps" :key="step" class="border border-black px-2 py-2 text-center text-xs">
                    {{ step }}
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(team, index) in tableTeams" :key="team.id" class="text-sm">
                  <td class="border border-black px-3 py-4 text-center font-semibold">{{ index + 1 }}</td>
                  <td class="border border-black px-3 py-3 text-center">
                    <div class="flex items-center justify-center">
                      <img
                        v-if="teamDisplayable(team)"
                        :src="team.logo"
                        :alt="team.name"
                        class="max-h-16 rounded-lg border border-black object-contain"
                      />
                      <div
                        v-else
                        class="flex h-16 w-16 items-center justify-center rounded-full border-2 border-dashed border-slate-300 text-[10px] text-slate-400"
                      >
                        รออนุมัติ
                      </div>
                    </div>
                  </td>
                  <td class="border border-black px-4 py-3">
                    <div class="font-semibold text-slate-900">
                      {{ teamDisplayable(team) ? team.name : '—' }}
                    </div>
                    <div class="text-xs text-slate-500">
                      {{ teamDisplayable(team) ? team.department : 'อยู่ระหว่างดำเนินการ' }}
                    </div>
                  </td>
                  <td
                    v-for="(step, idx) in team.stepStates"
                    :key="`${team.id}-step-${idx}`"
                    class="border border-black px-2 py-3 text-center"
                  >
                    <span
                      v-if="step === 'done'"
                      class="inline-flex h-6 w-6 items-center justify-center rounded-full bg-emerald-500 text-white text-xs font-bold"
                    >
                      ✔
                    </span>
                    <span
                      v-else-if="step === 'in-progress'"
                      class="inline-flex h-6 w-6 items-center justify-center rounded-full bg-yellow-400 text-black text-xs font-bold"
                    >
                      ●
                    </span>
                    <span v-else class="inline-flex h-6 w-6 items-center justify-center rounded-full border-2 border-slate-200"></span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { RouterLink } from 'vue-router'
import { useRegisterShared } from '@/stores/registerShared'

const sharedRegister = useRegisterShared()
const steps = ['STEP 1', 'STEP 2', 'STEP 3', 'STEP 4', 'STEP 5', 'STEP 6', 'STEP 7', 'STEP 8']

const defaultTeams = [
  {
    id: 'T001',
    name: 'ราพณาสูร',
    department: 'ฝ่ายผลิต',
    logo: 'https://placehold.co/120x80/ffd966/222?text=TEAM+1',
    status: 'approved',
    stepStates: ['done', 'done', 'in-progress', 'pending', 'pending', 'pending', 'pending', 'pending'],
  },
  {
    id: 'T002',
    name: 'Khu - Bah Bah Bah',
    department: 'Non Production',
    logo: 'https://placehold.co/120x80/93c5fd/111?text=TEAM+2',
    status: 'approved',
    stepStates: ['done', 'done', 'done', 'pending', 'pending', 'pending', 'pending', 'pending'],
  },
  {
    id: 'T003',
    name: 'AC New Inspire',
    department: 'ฝ่ายนวัตกรรม',
    logo: 'https://placehold.co/120x80/f9a8d4/111?text=TEAM+3',
    status: 'pending',
    stepStates: ['in-progress', 'pending', 'pending', 'pending', 'pending', 'pending', 'pending', 'pending'],
  },
  {
    id: 'T004',
    name: 'HR Positive Learning Season 8',
    department: 'ฝ่ายทรัพยากรบุคคล',
    logo: 'https://placehold.co/120x80/ffe0b5/111?text=TEAM+4',
    status: 'approved',
    stepStates: ['done', 'done', 'done', 'done', 'in-progress', 'pending', 'pending', 'pending'],
  },
]

const tableTeams = computed(() => {
  const sharedTeam = buildTeamFromShared(sharedRegister)
  const list = [...defaultTeams]
  if (sharedTeam) list.unshift(sharedTeam)
  return list
})

function buildTeamFromShared(shared) {
  if (!shared || !shared.groupName) return null
  return {
    id: 'LOCAL',
    name: shared.groupName,
    department: shared.departmentName || shared.department || '—',
    logo: shared.logoUrl || 'https://placehold.co/120x80/cccccc/111?text=Logo',
    status: shared.approved ? 'approved' : 'pending',
    stepStates: Array(steps.length)
      .fill(0)
      .map((_, idx) => (idx === 0 ? 'in-progress' : 'pending')),
  }
}

function teamDisplayable(team) {
  return team.status === 'approved'
}
</script>
