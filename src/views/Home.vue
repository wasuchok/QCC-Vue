<!-- HomeQCC.vue (no-JSX version) -->
<template>
    <div class="min-h-screen bg-[#f5f7fa]">
        <!-- Header -->
        <header class="py-8 text-center">
            <h1 class="text-3xl sm:text-4xl font-extrabold tracking-[0.35em] text-slate-800">
                QCC&nbsp;Plus
            </h1>
            <p class="mt-2 text-slate-500">Quality Control Circle • AOYAMA THAI</p>
        </header>

        <!-- Cards -->
        <main class="max-w-6xl mx-auto px-4 pb-10">
            <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3" role="list" aria-label="เมนูหลัก QCC">
                <button v-for="card in cards" :key="card.key" type="button"
                    class="group relative rounded-2xl border border-black/10 bg-white shadow-lg hover:shadow-2xl transition-all duration-300 outline-none focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:ring-indigo-500"
                    @click="go(card)">
                    <div :class="['h-2 rounded-t-2xl', card.bar]" />
                    <div class="flex flex-col items-center text-center px-6 py-7">
                        <!-- Icon -->
                        <div class="w-24 h-24 rounded-xl flex items-center justify-center shadow-md mb-4"
                            :class="card.iconWrap">
                            <div class="w-14 h-14" v-html="card.svg" aria-hidden="true"></div>
                        </div>

                        <div class="text-xl font-semibold text-slate-800">{{ card.th }}</div>
                        <div class="text-sm text-slate-500">{{ card.en }}</div>
                        <div class="mt-3 font-semibold text-amber-500 group-hover:text-amber-600">เปิดใช้งาน / Open
                        </div>
                    </div>
                    <div
                        class="absolute inset-0 rounded-2xl ring-1 ring-black/5 group-hover:ring-black/10 group-hover:scale-[1.01] transition-transform" />
                </button>
            </div>

            <footer class="text-center text-slate-400 text-sm mt-10">
                Create by : Wara (Wara_s@aoyama.co.th) 2025
            </footer>
        </main>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router' // ไม่มี router ก็ใช้งานได้ โค้ดมี fallback

/* ---------- SVG (string) ---------- */
const stroke = '#0f172a'
const w = '24'
const h = '24'
const svgWrap = (paths) => `
<svg viewBox="0 0 24 24" width="${w}" height="${h}" fill="none" xmlns="http://www.w3.org/2000/svg">
  ${paths}
</svg>
`

const svgs = {
    report: svgWrap(`
    <path d="M7 3h7l5 5v13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M14 3v4a1 1 0 0 0 1 1h4" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M8 14h8M8 18h8M8 10h4" stroke="${stroke}" stroke-width="1.5"/>
  `),
    signup: svgWrap(`
    <circle cx="9" cy="7" r="3.25" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M2.75 20a6.25 6.25 0 0 1 12.5 0" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M17 8v3m0 0v3m0-3h3m-3 0h-3" stroke="${stroke}" stroke-width="1.5"/>
  `),
    record: svgWrap(`
    <rect x="3" y="5" width="18" height="14" rx="2.5" stroke="${stroke}" stroke-width="1.5"/>
    <circle cx="9" cy="12" r="2.5" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M14 9h5M14 12h5M14 15h3" stroke="${stroke}" stroke-width="1.5"/>
  `),
    plan: svgWrap(`
    <path d="M4 5h16M4 10h16M4 15h10M4 20h6" stroke="${stroke}" stroke-width="1.5"/>
    <rect x="14.5" y="14.5" width="5" height="5" rx="1" stroke="${stroke}" stroke-width="1.5"/>
  `),
    tools: svgWrap(`
    <path d="M9 7l-6 6 1.5 1.5L10.5 8.5M13 6l5 5M15 4l5 5" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M14 14l6 6" stroke="${stroke}" stroke-width="1.5"/>
    <circle cx="12" cy="12" r="2" stroke="${stroke}" stroke-width="1.5"/>
  `),
    manual: svgWrap(`
    <path d="M6 4h9a3 3 0 0 1 3 3v13H9a3 3 0 0 1-3-3V4z" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M6 18a3 3 0 0 1 3-3h9" stroke="${stroke}" stroke-width="1.5"/>
    <path d="M9 8h6M9 11h6" stroke="${stroke}" stroke-width="1.5"/>
  `),
}

/* ---------- Cards config ---------- */
const cards = [
    { key: 'status', th: 'รายงานสถานะการดำเนินกิจกรรม QCC', en: 'Activity Status Report', svg: svgs.report, iconWrap: 'bg-emerald-100', bar: 'bg-emerald-300', route: { name: 'qcc-status' }, page: { key: 'status', title: 'รายงานสถานะการดำเนินกิจกรรม QCC' } },
    { key: 'register', th: 'สมัครเข้าร่วมกิจกรรม QCC', en: 'QCC Registration', svg: svgs.signup, iconWrap: 'bg-sky-100', bar: 'bg-sky-300', route: { name: 'register-qcc' }, page: { key: 'register-qcc', title: 'สมัครเข้าร่วมกิจกรรม QCC' } },
    { key: 'record', th: 'บันทึกการดำเนินกิจกรรม', en: 'Activity Recording', svg: svgs.record, iconWrap: 'bg-indigo-100', bar: 'bg-indigo-300', route: { name: 'login' }, page: { key: 'record', title: 'บันทึกการดำเนินกิจกรรม' } },
    { key: 'plan', th: 'แผนการดำเนินกิจกรรม QCC', en: 'Activity Plan', svg: svgs.plan, iconWrap: 'bg-amber-100', bar: 'bg-amber-300', route: { name: 'qcc-plan' }, page: { key: 'plan', title: 'แผนการดำเนินกิจกรรม QCC' } },
    { key: 'tools', th: 'เครื่องมือ QC 7 Tool', en: 'QC 7 Tools', svg: svgs.tools, iconWrap: 'bg-rose-100', bar: 'bg-rose-300', route: { name: 'qcc-7tools' }, page: { key: 'tools', title: 'เครื่องมือ QC 7 Tool' } },
    { key: 'manual', th: 'คู่มือกิจกรรม QCC', en: 'QCC User Manual', svg: svgs.manual, iconWrap: 'bg-teal-100', bar: 'bg-teal-300', route: { name: 'qcc-manual' }, page: { key: 'manual', title: 'คู่มือกิจกรรม QCC' } },
]

/* ---------- Navigation ---------- */
const router = (() => { try { return useRouter() } catch { return null } })()
function go(card) {
    if (typeof window !== 'undefined' && typeof window.openPage === 'function') {
        window.openPage(card.page.key, card.page.title)
    } else if (router && card.route) {
        router.push(card.route.name)
    } else {
        console.log('Navigate ->', card)
    }
}
</script>
