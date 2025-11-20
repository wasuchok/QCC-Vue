import { createRouter, createWebHistory } from 'vue-router'
import Home from '@/views/Home.vue'
import Login from '@/views/Login.vue'
import Minutes1 from '@/views/Minutes1.vue'
import Minutes2 from '@/views/Minutes2.vue'
import RegisterQCC from '@/views/RegisterQCC.vue'
import ActivityQCC from '@/views/ActivityQCC.vue'
import AssessPre from '@/views/AssessPre.vue'
import Minutes3 from '@/views/Minutes3.vue'
import Minutes4 from '@/views/Minutes4.vue'
import Minutes5 from '@/views/Minutes5.vue'
import AdminDashboard from '@/views/AdminDashboard.vue'
import AdminEmployeeHistory from '@/views/AdminEmployeeHistory.vue'
import AdminRegistrationInfo from '@/views/AdminRegistrationInfo.vue'
import MemberDashboard from '@/views/MemberDashboard.vue'
import SummaryQCC from '@/views/SummaryQCC.vue'
import SummaryStep1 from '@/views/SummaryStep1.vue'
import SummaryStep2 from '@/views/SummaryStep2.vue'
import SummaryStep3 from '@/views/SummaryStep3.vue'
import Step2Problem from '@/views/Step2Problem.vue'
import Step2Priority from '@/views/Step2Priority.vue'
import Step3Motivation from '@/views/Step3Motivation.vue'
import Step3ThreeG from '@/views/Step3ThreeG.vue'
import Step3Goals from '@/views/Step3Goals.vue'
import Step3Plan from '@/views/Step3Plan.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', component: Home },
    { path: '/login', component: Login },
    { path: '/register-qcc', component: RegisterQCC },
    { path: '/activity-qcc', component: ActivityQCC },
    { path: '/minutes1', component: Minutes1 },
    { path: '/minutes2', component: Minutes2 },
    { path: '/assess-pre', component: AssessPre },
    { path: '/minutes3', component: Minutes3 },
    { path: '/minutes4', component: Minutes4 },
    { path: '/minutes5', component: Minutes5 },
    { path: '/summary-qcc', component: SummaryQCC },
    { path: '/summary-step1', component: SummaryStep1 },
    { path: '/summary-step2', component: SummaryStep2 },
    { path: '/summary-step3', component: SummaryStep3 },
    { path: '/step2/problem', component: Step2Problem },
    { path: '/step2/priority', component: Step2Priority },
    { path: '/step3/motivation', component: Step3Motivation },
    { path: '/step3/three-g', component: Step3ThreeG },
    { path: '/step3/goals', component: Step3Goals },
    { path: '/step3/plan', component: Step3Plan },
    { path: '/admin', component: AdminDashboard },
    { path: '/admin/employees', component: AdminEmployeeHistory },
    { path: '/admin/registrations', component: AdminRegistrationInfo },
    { path: '/dashboard', component: MemberDashboard }
  ],
})

export default router
