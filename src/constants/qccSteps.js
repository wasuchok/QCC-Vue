export const QCC_FLOW_STEPS = [
  {
    key: 'register',
    label: 'สมัครเข้าร่วมกิจกรรม',
    description: 'ใบจดทะเบียนจัดตั้งกลุ่ม QCC',
    path: '/register-qcc',
  },
  {
    key: 'activity',
    label: 'ข้อมูลกิจกรรม QCC',
    description: 'รายละเอียดการจดทะเบียนกิจกรรม',
    path: '/activity-qcc',
  },
  {
    key: 'minutes1',
    label: 'บันทึกประชุม ครั้งที่ 1',
    description: 'Minutes of Meeting #1',
    path: '/minutes1',
  },
  {
    key: 'minutes2',
    label: 'บันทึกประชุม ครั้งที่ 2',
    description: 'Minutes of Meeting #2',
    path: '/minutes2',
  },
  {
    key: 'assess-pre',
    label: 'ประเมินก่อนทำกิจกรรม',
    description: 'Pre-Assessment Member Scores',
    path: '/assess-pre',
  },
  {
    key: 'minutes3',
    label: 'บันทึกประชุม ครั้งที่ 3',
    description: 'Minutes of Meeting #3',
    path: '/minutes3',
  },
  {
    key: 'minutes4',
    label: 'บันทึกประชุม ครั้งที่ 4',
    description: 'Minutes of Meeting #4',
    path: '/minutes4',
  },
  {
    key: 'minutes5',
    label: 'บันทึกประชุม ครั้งที่ 5',
    description: 'Minutes of Meeting #5',
    path: '/minutes5',
  },
]

export const REGISTER_SIDEBAR_STEPS = [
  {
    key: 'register',
    label: 'จดทะเบียนจัดตั้งกลุ่มกิจกรรม',
    description: 'บันทึกข้อมูลกลุ่ม QCC',
  },
  {
    key: 'minutes1',
    label: 'บันทึกประชุมครั้งที่ 1',
    description: 'Minutes of Meeting',
  },
  {
    key: 'summary',
    label: 'สรุปข้อมูลการทำกิจกรรม',
    description: 'ตรวจสอบและส่งข้อมูล',
  },
]

export const STEP1_SIDEBAR_SECTIONS = [
  {
    key: 'step0',
    label: 'STEP 0 : จดทะเบียนตั้งกลุ่ม',
    description: '-',
    items: [
      { key: 'register-qcc', label: 'ข้อมูลกิจกรรม QCC', path: '/register-qcc' },
      { key: 'minutes2', label: 'บันทึกประชุม ครั้งที่ 0', path: '/minutes2' },
      { key: 'summary-step1', label: 'สรุป STEP 0', path: '/summary-step1' },
    ],
  },
]

export const STEP2_SIDEBAR_SECTIONS = [
  {
    key: 'step2',
    label: 'STEP 2 : วิเคราะห์ปัญหา',
    description: 'เลือกสาเหตุและวางแผน',
    items: [
      { key: 'step2-problem', label: 'พิจารณาหัวข้อปัญหา', path: '/step2/problem' },
      { key: 'step2-priority', label: 'จัดลำดับความสำคัญ', path: '/step2/priority' },
      { key: 'minutes3', label: 'บันทึกประชุม ครั้งที่ 3', path: '/minutes3' },
      { key: 'summary-step2', label: 'สรุป STEP 2', path: '/summary-step2' },
    ],
  },
]

export const STEP3_SIDEBAR_SECTIONS = [
  {
    key: 'step3',
    label: 'STEP 3 : เหตุผลและแรงจูงใจ',
    description: 'ระบุผลกระทบและความสำคัญ',
    items: [
      { key: 'step3-motivation', label: 'เหตุผล (จูงใจ)', path: '/step3/motivation' },
      { key: 'step3-threeg', label: 'ลงหน้างานจริง (3G)', path: '/step3/three-g' },
      { key: 'minutes4', label: 'บันทึกประชุม ครั้งที่ 4', path: '/minutes4' },
      { key: 'step3-goals', label: 'จัดตั้งเป้าหมายกิจกรรม', path: '/step3/goals' },
      { key: 'step3-plan', label: 'แผนการดำเนินงาน', path: '/step3/plan' },
      { key: 'minutes5', label: 'บันทึกประชุม ครั้งที่ 5', path: '/minutes5' },
      { key: 'summary-step3', label: 'สรุป STEP 3', path: '/summary-step3' },
    ],
  },
]

export const STEP1_AND_2_SIDEBAR = [
  ...STEP1_SIDEBAR_SECTIONS,
  ...STEP2_SIDEBAR_SECTIONS,
  ...STEP3_SIDEBAR_SECTIONS,
]
