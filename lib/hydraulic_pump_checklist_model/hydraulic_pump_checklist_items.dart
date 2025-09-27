class HydraulicPumpChecklistModel {
  final int id;
  final String description;
  final String arabicDescription;
  String? status;

  HydraulicPumpChecklistModel({
    required this.id,
    required this.description,
    required this.arabicDescription,
    this.status,
  });

   static final List<HydraulicPumpChecklistModel> checklistItems = [
    HydraulicPumpChecklistModel(
      id: 1,
      description:
          'Cleanliness: Ensure the pump, gauge, motor, fan, and connections are cleaned.',
      arabicDescription:
          'تأكد من نظافة المعدة بالكامل (المضخة, العداد, الموتور, التوصيلات, المروحة)',
    ),
    HydraulicPumpChecklistModel(
      id: 2,
      description: 'Check if any visible damage or crack in all parts.',
      arabicDescription:
          'تأكد اذا كان هناك أي كسور أو شروخ في جميع أجزاء المعدة',
    ),
    HydraulicPumpChecklistModel(
      id: 3,
      description:
          'Check oil level in the tank and quality (Refill or replace if necessary).',
      arabicDescription:
          'تأكد من مستوى الزيت في التانك ومن صلاحيته (إملأ أو غير الزيت إذا تطلب الأمر)',
    ),
    HydraulicPumpChecklistModel(
      id: 4,
      description:
          'Check if electrical safety test done or not (Certificate) and electric components okay. And ensure pressure gauge no crack and damage and in good conditions.',
      arabicDescription:
          'تأكد من أن الاختبارات الكهربائية اللازمة تمت بالفعل (يوجد شهادة) وان جميع الأجزاء الكهربية سليمة. كما تأكد من عداد الضغط لا يوجد به كسور او شروخ ويعمل جيدا.',
    ),
    HydraulicPumpChecklistModel(
      id: 5,
      description:
          'Ensure Remote control cable fully unrolled and not kinked, twisted or damaged.',
      arabicDescription:
          'تأكد أن كابل ريموت التحكم غير ملفوف بالكامل او غير ملتوي أو تالف',
    ),
    HydraulicPumpChecklistModel(
      id: 6,
      description:
          'All couplings and other connections are tight and not damaged or deformed.',
      arabicDescription:
          'جميع التوصيلات محكمة الربط وغير تالفة أو مشوهة او مكسورة',
    ),
    HydraulicPumpChecklistModel(
      id: 7,
      description:
          'Hydraulic hoses are securely connected, not kinked, twisted, or damaged and check it\'s connections ok and expiry date.',
      arabicDescription:
          'تأكد ان جميع الخراطيم محكمة التوصيل بأمان غير ملفوفة بالكامل وغير ملتوية ولا يوجد بها أي تلف واضح كما تأكد من أجزاء التوصيل الخاصة بها سليمة ومن تاريخ صلاحية الخرطوم',
    ),
    HydraulicPumpChecklistModel(
      id: 8,
      description:
          'Inspect the hydraulic hoses for damage with a set pressure of 2,900 psi (200 bar), 5,800 psi (400 bar) and 10,000 psi (700 bar).',
      arabicDescription:
          'إختبر الخراطيم عند ضغط 200 بار ثم 400 بار ثم 700 بار للتأكد من سالمتها',
    ),
    HydraulicPumpChecklistModel(
      id: 9,
      description:
          'Operate the pump and check if it operated smoothly without any issue or no (in low and high pressure) and check pressure relief valves.',
      arabicDescription:
          'قم بتشغيل المعدة وتأكد انها تعمل جيدا بدون أي مشاكل أثناء التشغيل في الضغط العالي والواطي وان المحابس تعمل جيدا.',
    ),
    HydraulicPumpChecklistModel(
      id: 10,
      description:
          'Check remote control with operation (start button, increase pressure button, and stop button) working correctly or no. And ensure Led light in panel should be green (OK).',
      arabicDescription:
          'تأكد أن ريموت التحكم يعمل جيدا دون أي أعطال أو مشاكل.(زر التشغيل,زر رفع الضغط, وزر الإيقاف). وتأكد أن لمبة اللوحة الكهربية باللون الأخضر',
    ),
    HydraulicPumpChecklistModel(
      id: 11,
      description:
          'Inspect for any signs of oil leaks around the pump, gauge, hoses, and adapter connections.',
      arabicDescription:
          'تأكد من انه لا يوجد أي تسريب للزيت حول المعدة والخراطيم والعداد والتوصيلات أثناء التشغيل.',
    ),
  ];

}