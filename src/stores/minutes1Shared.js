import { reactive } from 'vue'

const STORAGE_KEY = 'qcc.minutes1.shared.v1'

function normalizeAttendee(input = {}, index = 0) {
  return {
    uid: input.uid || `m1-attendee-${Date.now()}-${index}`,
    empId: input.empId || '',
    name: input.name || '',
    dept: input.dept || '',
  }
}

function toPlain() {
  return {
    groupName: shared.groupName,
    date: shared.date,
    place: shared.place,
    start: shared.start,
    end: shared.end,
    topic: shared.topic,
    detail: shared.detail,
    attendees: shared.attendees.map(att => ({ ...att })),
    fileNames: [...shared.fileNames],
    lastUpdated: shared.lastUpdated,
  }
}

function persist() {
  if (typeof window === 'undefined' || !window.localStorage) return
  try {
    window.localStorage.setItem(STORAGE_KEY, JSON.stringify(toPlain()))
  } catch (err) {
    console.warn('Persist minutes1 shared failed:', err)
  }
}

function applyShared(payload = {}, opts = {}) {
  const { skipPersist = false, skipStamp = false } = opts
  if (Object.prototype.hasOwnProperty.call(payload, 'groupName')) {
    shared.groupName = payload.groupName || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'date')) {
    shared.date = payload.date || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'place')) {
    shared.place = payload.place || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'start')) {
    shared.start = payload.start || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'end')) {
    shared.end = payload.end || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'topic')) {
    shared.topic = payload.topic || ''
  }
  if (Object.prototype.hasOwnProperty.call(payload, 'detail')) {
    shared.detail = payload.detail || ''
  }
  if (Array.isArray(payload.attendees)) {
    shared.attendees.splice(0, shared.attendees.length, ...payload.attendees.map(normalizeAttendee))
  }
  if (Array.isArray(payload.fileNames)) {
    const names = payload.fileNames
      .map(name => String(name ?? '').trim())
      .filter(name => name.length > 0)
    shared.fileNames.splice(0, shared.fileNames.length, ...names)
  }
  if (!skipStamp) {
    shared.lastUpdated = Date.now()
  }
  if (!skipPersist) {
    persist()
  }
}

function hydrate() {
  if (hydrated) return
  hydrated = true
  if (typeof window === 'undefined' || !window.localStorage) return
  try {
    const raw = window.localStorage.getItem(STORAGE_KEY)
    if (!raw) return
    const parsed = JSON.parse(raw)
    applyShared(parsed, { skipPersist: true, skipStamp: true })
    shared.lastUpdated = Date.now()
  } catch (err) {
    console.warn('Hydrate minutes1 shared failed:', err)
  }
}

export function updateMinutes1Shared(payload) {
  hydrate()
  applyShared(payload)
}

export function resetMinutes1Shared() {
  shared.groupName = ''
  shared.date = ''
  shared.place = ''
  shared.start = ''
  shared.end = ''
  shared.topic = ''
  shared.detail = ''
  shared.attendees.splice(0, shared.attendees.length)
  shared.fileNames.splice(0, shared.fileNames.length)
  shared.lastUpdated = Date.now()
  persist()
}

export function useMinutes1Shared() {
  hydrate()
  return shared
}

export function getMinutes1Snapshot() {
  hydrate()
  return toPlain()
}

let hydrated = false
const shared = reactive({
  groupName: '',
  date: '',
  place: '',
  start: '',
  end: '',
  topic: '',
  detail: '',
  attendees: [],
  fileNames: [],
  lastUpdated: 0,
})
