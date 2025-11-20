<template>
  <div class="min-h-screen bg-slate-50">
    <div class="mx-auto max-w-5xl px-6 py-10">
      <header class="mb-8 flex flex-col gap-2">
        <RouterLink to="/admin" class="text-sm font-semibold text-slate-500 hover:text-slate-800">
          ← กลับไปหน้าเมนูผู้ดูแล
        </RouterLink>
        <h1 class="text-2xl font-extrabold text-slate-800">ประวัติพนักงาน</h1>
        <p class="text-sm text-slate-500">
          หน้านี้เป็นต้นแบบสำหรับการสืบค้นและจัดการประวัติพนักงาน สามารถต่อยอดด้วยตารางค้นหา ตัวกรอง และการเชื่อมต่อฐานข้อมูล
        </p>
      </header>

      <section class="rounded-3xl border border-gray-200 bg-white p-6 shadow-lg">
        <h2 class="text-lg font-semibold text-slate-800">โครงร่างการแสดงผล</h2>
        <ul class="mt-4 space-y-2 text-sm text-slate-600">
          <li>• กล่องค้นหาพนักงาน (ชื่อ, รหัสพนักงาน, หน่วยงาน)</li>
          <li>• รายการผลลัพธ์แบบตาราง พร้อมคอลัมน์: ชื่อ-สกุล, หน่วยงาน, สถานะ QCC</li>
          <li>• แผงรายละเอียดด้านข้าง (side panel) เมื่อเลือกพนักงาน</li>
          <li>• ปุ่มดาวน์โหลดรายงานหรือส่งออกไฟล์ Excel</li>
        </ul>
      </section>
    </div>
  </div>
</template>

<script setup>
import { RouterLink } from 'vue-router'
</script>
