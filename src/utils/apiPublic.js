const DEFAULT_BASE_URL =
  (typeof import.meta !== 'undefined' && import.meta.env && import.meta.env.VITE_STRAPI_BASE_URL) ||
  'http://10.17.2.33:1338'

const baseUrl = trimTrailingSlash(DEFAULT_BASE_URL)

function trimTrailingSlash(url = '') {
  return url.replace(/\/+$/, '')
}

function isAbsoluteUrl(url = '') {
  return /^https?:\/\//i.test(url)
}

function buildApiUrl(path = '') {
  if (isAbsoluteUrl(path)) {
    return path
  }
  const normalizedPath = path.startsWith('/') ? path : `/${path}`
  const finalPath = normalizedPath.startsWith('/api/')
    ? normalizedPath
    : `/api${normalizedPath}`
  return `${baseUrl}${finalPath}`
}

async function parseResponseBody(response) {
  const text = await response.text()
  if (!text) return {}
  try {
    return JSON.parse(text)
  } catch {
    return { raw: text }
  }
}

export async function fetchApiPublic(path = '', options = {}) {
  const url = buildApiUrl(path)
  const headers = {
    Accept: 'application/json',
    ...(options.headers || {}),
  }
  const fetchOptions = {
    method: 'GET',
    ...options,
    headers,
  }
  const response = await fetch(url, fetchOptions)
  const payload = await parseResponseBody(response)
  if (!response.ok) {
    const error = new Error(`Request failed with status ${response.status}`)
    error.status = response.status
    error.payload = payload
    throw error
  }
  return payload
}

