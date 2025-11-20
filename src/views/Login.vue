<template>
    <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-[#f0f4f8] to-[#dbeafe]">
        <!-- Card -->
        <div class="w-full max-w-md bg-white/80 backdrop-blur-xl shadow-xl rounded-2xl p-8 border border-slate-200">
            <!-- Logo / Title -->
            <div class="text-center mb-8">
                <div class="w-16 h-16 mx-auto mb-3 rounded-full bg-indigo-100 flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8 text-indigo-600" viewBox="0 0 24 24"
                        fill="none">
                        <path stroke="currentColor" stroke-width="1.6" d="M12 3l8 6v12H4V9l8-6z" />
                    </svg>
                </div>
                <h1 class="text-2xl font-extrabold text-slate-800 tracking-wide">QCC SYSTEM</h1>
                <p class="text-slate-500 text-sm mt-1">เข้าสู่ระบบเพื่อจัดการกิจกรรม QCC</p>
            </div>

            <!-- Form -->
            <form @submit.prevent="login" class="space-y-5">
                <!-- Username -->
                <div>
                    <label class="block text-slate-700 font-semibold mb-1">ชื่อผู้ใช้</label>
                    <input v-model="username" type="text" placeholder="เช่น admin"
                        class="w-full px-4 py-2.5 border-2 border-slate-300 rounded-xl focus:border-indigo-500 focus:ring focus:ring-indigo-100 outline-none transition-all"
                        required />
                </div>

                <!-- Password -->
                <div>
                    <label class="block text-slate-700 font-semibold mb-1">รหัสผ่าน</label>
                    <div class="relative">
                        <input v-model="password" :type="showPassword ? 'text' : 'password'" placeholder="••••••••"
                            class="w-full px-4 py-2.5 border-2 border-slate-300 rounded-xl focus:border-indigo-500 focus:ring focus:ring-indigo-100 outline-none transition-all"
                            required />
                        <button type="button"
                            class="absolute inset-y-0 right-3 flex items-center text-slate-400 hover:text-slate-600"
                            @click="showPassword = !showPassword">
                            <svg v-if="showPassword" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-width="1.6"
                                    d="M3 3l18 18M10.73 10.73a3 3 0 104.24 4.24M9.88 9.88A8.988 8.988 0 0112 9c5 0 9 4 9 4s-.59.68-1.64 1.61M15.88 15.88A8.988 8.988 0 0112 17c-5 0-9-4-9-4s1.64-1.88 4.12-3.11" />
                            </svg>
                            <svg v-else xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-width="1.6"
                                    d="M2.458 12C3.732 7.943 7.523 5 12 5c4.477 0 8.268 2.943 9.542 7-1.274 4.057-5.065 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                <circle cx="12" cy="12" r="3" />
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Remember -->
                <label class="flex items-center gap-2 text-sm cursor-pointer select-none">
                    <input v-model="remember" type="checkbox" class="rounded text-indigo-600 focus:ring-indigo-500" />
                    <span class="text-slate-600">จดจำการเข้าสู่ระบบ</span>
                </label>

                <!-- Button -->
                <button type="submit"
                    class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-2.5 rounded-xl shadow transition-all"
                    :disabled="loading">
                    <span v-if="!loading">เข้าสู่ระบบ</span>
                    <span v-else class="flex justify-center items-center gap-2">
                        <svg class="w-5 h-5 animate-spin" viewBox="0 0 24 24" fill="none">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="white" stroke-width="4"></circle>
                            <path class="opacity-75" fill="white" d="M4 12a8 8 0 018-8v4a4 4 0 00-4 4H4z"></path>
                        </svg>
                        กำลังตรวจสอบ...
                    </span>
                </button>

                <!-- 🔙 ปุ่มย้อนกลับหน้าหลัก -->
                <button type="button" @click="goHome"
                    class="w-full bg-white hover:bg-slate-50 text-slate-700 font-semibold py-2.5 rounded-xl border-2 border-slate-300 flex items-center justify-center gap-2 transition-all">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-slate-500" fill="none"
                        viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"
                            d="M3 12l9-9 9 9M4 10v10h16V10" />
                    </svg>
                    ย้อนกลับหน้าหลัก
                </button>
            </form>

            <!-- Error Message -->
            <p v-if="errorMsg" class="mt-4 text-center text-red-600 font-semibold">
                ⚠️ {{ errorMsg }}
            </p>

            <!-- Footer -->
            <p class="mt-10 text-center text-xs text-slate-400">
                © 2025 AOYAMA THAI CO., LTD. | Quality Control Circle Portal
            </p>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const username = ref('')
const password = ref('')
const remember = ref(false)
const loading = ref(false)
const showPassword = ref(false)
const errorMsg = ref('')

function goHome() {
    router.push('/') // 🔙 กลับไปหน้าหลัก (Home.vue)
}

async function login() {
    errorMsg.value = ''
    loading.value = true

    // mock ตรวจสอบ (แทนที่ด้วย API จริงได้)
    setTimeout(() => {
        const ok = username.value === 'admin' && password.value === 'admin'
        if (ok) {
            const user = {
                empId: '000001',
                name: 'Admin',
                dept: 'QCC',
                role: 'admin',
                remember: remember.value,
                loggedAt: new Date().toISOString(),
            }
            localStorage.setItem('auth.user', JSON.stringify(user))
            router.replace('/activity-qcc')
        } else {
            errorMsg.value = 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง'
        }
        loading.value = false
    }, 900)
}
</script>
