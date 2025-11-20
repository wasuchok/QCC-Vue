<template>
  <aside class="step-sidebar">
    <div class="step-sidebar__title">
      {{ title }}
    </div>

    <div v-for="section in displaySections" :key="section.key" class="sidebar-section">
      <button type="button" class="section-header" @click="toggleSection(section.key)">
        <div>
          <p class="section-header__label">{{ section.label }}</p>
          <p v-if="section.description" class="section-header__desc">{{ section.description }}</p>
        </div>
        <span class="section-header__icon">{{ isExpanded(section.key) ? '−' : '+' }}</span>
      </button>

      <transition name="collapse">
        <ul v-if="isExpanded(section.key)" class="section-list">
          <li v-for="item in section.items" :key="item.key">
            <RouterLink :to="item.path" class="section-item" :class="item.key === activeKey ? 'is-active' : ''">
              <span class="section-item__bullet"></span>
              <div>
                <p class="section-item__label">{{ item.label }}</p>
                <p v-if="item.description" class="section-item__desc">{{ item.description }}</p>
              </div>
            </RouterLink>
          </li>
        </ul>
      </transition>
    </div>

    <button type="button" class="logout-btn" @click="logout">
      ออกจากระบบ
    </button>
  </aside>
</template>

<script setup>
import { STEP1_SIDEBAR_SECTIONS } from '@/constants/qccSteps'
import { computed, ref, watch } from 'vue'
import { RouterLink, useRoute, useRouter } from 'vue-router'

const props = defineProps({
  sections: {
    type: Array,
    default: () => STEP1_SIDEBAR_SECTIONS,
  },
  currentKey: {
    type: String,
    default: '',
  },
  title: {
    type: String,
    default: 'จดทะเบียนจัดตั้งกลุ่ม',
  },
})

const displaySections = computed(() => (Array.isArray(props.sections) && props.sections.length ? props.sections : STEP1_SIDEBAR_SECTIONS))
const expandedKeys = ref([])
const route = useRoute()
const router = useRouter()

function resolveActiveItemKey(sections) {
  if (!sections.length) return ''
  if (props.currentKey) return props.currentKey
  const items = sections.flatMap(section => section.items || [])
  const match = items.find(item => item.path === route.path)
  return match?.key || (items[0]?.key || '')
}

function findSectionKeyForItem(sections, itemKey) {
  if (!sections.length) return ''
  const found = sections.find(section => (section.items || []).some(item => item.key === itemKey))
  return found?.key || sections[0].key
}

function ensureActiveSectionExpanded(sections) {
  if (!sections.length) return
  const activeItemKey = resolveActiveItemKey(sections)
  if (!activeItemKey) return
  const sectionKey = findSectionKeyForItem(sections, activeItemKey)
  if (sectionKey && !expandedKeys.value.includes(sectionKey)) {
    expandedKeys.value = [...expandedKeys.value, sectionKey]
  }
}

watch(
  displaySections,
  sections => {
    if (!sections.length) return
    if (!expandedKeys.value.length) {
      expandedKeys.value = [findSectionKeyForItem(sections, resolveActiveItemKey(sections))]
    }
    ensureActiveSectionExpanded(sections)
  },
  { immediate: true }
)

watch(
  () => [route.path, props.currentKey],
  () => {
    ensureActiveSectionExpanded(displaySections.value)
  }
)

function toggleSection(key) {
  if (expandedKeys.value.includes(key)) {
    expandedKeys.value = expandedKeys.value.filter(k => k !== key)
  } else {
    expandedKeys.value = [...expandedKeys.value, key]
  }
}

function isExpanded(key) {
  return expandedKeys.value.includes(key)
}

const activeKey = computed(() => {
  if (props.currentKey) return props.currentKey
  const items = displaySections.value.flatMap(section => section.items || [])
  const match = items.find(item => item.path === route.path)
  return match?.key || (items[0]?.key || '')
})

function logout() {
  try {
    localStorage.removeItem('auth.user')
  } catch (err) {
    // ignore storage issues
  }
  router.replace('/login')
}
</script>

<style scoped>
@reference "tailwindcss";

.step-sidebar {
  @apply w-full max-w-[260px] border-4 border-black rounded-[24px] bg-[#f9fbff] shadow-[4px_4px_0px_rgba(0, 0, 0, 0.25)];
}

.step-sidebar__title {
  @apply bg-[#dbe8ff] border-b-4 border-black rounded-t-[20px] px-4 py-4 text-center text-lg font-black text-slate-900;
}

.sidebar-section {
  @apply px-3 py-3;
}

.section-header {
  @apply flex w-full items-center justify-between rounded-2xl border-2 border-black bg-white px-3 py-2 text-left transition;
}

.section-header__label {
  @apply text-sm font-semibold text-slate-900;
}

.section-header__desc {
  @apply text-xs text-slate-500;
}

.section-header__icon {
  @apply text-lg font-black text-slate-800;
}

.section-list {
  @apply mt-3 flex flex-col gap-2;
}

.section-item {
  @apply flex gap-2 rounded-2xl border-2 border-black bg-white px-3 py-2 text-left transition hover:bg-[#eef5ff];
}

.section-item.is-active {
  @apply bg-[#d9f6e7] shadow-inner;
}

.section-item__bullet {
  @apply mt-1 h-3 w-3 rounded-full border-2 border-black;
}

.section-item.is-active .section-item__bullet {
  @apply bg-green-400 border-green-600;
}

.section-item__label {
  @apply text-sm font-semibold text-slate-900;
}

.section-item__desc {
  @apply text-xs text-slate-500;
}

.logout-btn {
  @apply mx-3 mb-4 mt-2 w-[calc(100%-1.5rem)] rounded-2xl border-2 border-black bg-white px-4 py-2 text-sm font-semibold shadow hover:-translate-y-0.5 transition;
}

.collapse-enter-active,
.collapse-leave-active {
  @apply transition-all duration-200 ease-in-out;
}

.collapse-enter-from,
.collapse-leave-to {
  @apply max-h-0 opacity-0;
}

.collapse-enter-to,
.collapse-leave-from {
  @apply max-h-60 opacity-100;
}
</style>
