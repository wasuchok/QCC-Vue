<template>
  <aside class="register-sidebar">
    <div class="register-sidebar__header">
      <div class="register-sidebar__title">
        {{ title }}
      </div>
    </div>

    <ul class="register-sidebar__steps">
      <li v-for="(step, idx) in displaySteps" :key="step.key"
        :class="['sidebar-step', stepState(idx)]">
        <div class="sidebar-step__icon" :class="iconState(idx)">
          <span v-if="iconState(idx) !== 'pending'">✔</span>
        </div>
        <div class="sidebar-step__text">
          <div class="sidebar-step__label">
            {{ step.label }}
          </div>
          <div v-if="step.description" class="sidebar-step__description">
            {{ step.description }}
          </div>
        </div>
      </li>
    </ul>
  </aside>
</template>

<script setup>
import { computed } from 'vue'
import { REGISTER_SIDEBAR_STEPS } from '@/constants/qccSteps'

const props = defineProps({
  steps: {
    type: Array,
    default: () => [...REGISTER_SIDEBAR_STEPS],
  },
  currentKey: {
    type: String,
    default: 'register',
  },
  title: {
    type: String,
    default: 'สมัครเข้าร่วมกิจกรรม',
  },
})

const displaySteps = computed(() => {
  if (Array.isArray(props.steps) && props.steps.length) return props.steps
  return REGISTER_SIDEBAR_STEPS
})

const currentIndex = computed(() =>
  displaySteps.value.findIndex(step => step.key === props.currentKey)
)

function stepState(idx) {
  if (currentIndex.value === -1) return idx === 0 ? 'is-active' : 'is-pending'
  if (idx < currentIndex.value) return 'is-complete'
  if (idx === currentIndex.value) return 'is-active'
  return 'is-pending'
}

function iconState(idx) {
  const state = stepState(idx)
  if (state === 'is-complete' || state === 'is-active') return 'complete'
  return 'pending'
}
</script>

<style scoped>
@reference "tailwindcss";

.register-sidebar {
  @apply w-full max-w-[260px] border-4 border-black rounded-[24px] bg-[#f4fbfa] shadow-[4px_4px_0px_rgba(0,0,0,0.35)];
}

.register-sidebar__header {
  @apply bg-[#fff4b8] border-b-4 border-black rounded-t-[20px] px-3 py-4 text-center;
}

.register-sidebar__title {
  @apply font-bold text-lg leading-tight;
}

.register-sidebar__steps {
  @apply flex flex-col gap-3 px-3 py-4;
}

.sidebar-step {
  @apply flex items-center gap-3 border-2 border-black rounded-2xl px-3 py-3 bg-white transition-all;
}

.sidebar-step.is-active {
  @apply bg-[#d3fbe9] shadow-inner;
}

.sidebar-step.is-complete {
  @apply bg-[#e5ffe5];
}

.sidebar-step.is-pending {
  @apply bg-white;
}

.sidebar-step__icon {
  @apply flex items-center justify-center w-8 h-8 rounded-full border-2 border-black text-sm font-bold;
}

.sidebar-step__icon.complete {
  @apply bg-[#4ade80] text-white;
}

.sidebar-step__icon.pending {
  @apply bg-white;
}

.sidebar-step__text {
  @apply flex flex-col text-sm;
}

.sidebar-step__label {
  @apply font-semibold text-gray-900 leading-snug;
}

.sidebar-step__description {
  @apply text-xs text-gray-500;
}
</style>
