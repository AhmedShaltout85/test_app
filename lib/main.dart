// import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:test_app/hydraulic_pump_checklist_model/hydraulic_pump_checklist_items.dart';

import 'common_widgets/build_header_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hydraulic Pump Checklist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HydraulicPumpChecklist(),
    );
  }
}

class HydraulicPumpChecklist extends StatefulWidget {
  const HydraulicPumpChecklist({super.key});

  @override
  State<HydraulicPumpChecklist> createState() => _HydraulicPumpChecklistState();
}

class _HydraulicPumpChecklistState extends State<HydraulicPumpChecklist> {
  // final List<HydraulicPumpChecklistModel> _checklistItems = [
  //   HydraulicPumpChecklistModel(
  //     id: 1,
  //     description:
  //         'Cleanliness: Ensure the pump, gauge, motor, fan, and connections are cleaned.',
  //     arabicDescription:
  //         'تأكد من نظافة المعدة بالكامل (المضخة, العداد, الموتور, التوصيلات, المروحة)',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 2,
  //     description: 'Check if any visible damage or crack in all parts.',
  //     arabicDescription:
  //         'تأكد اذا كان هناك أي كسور أو شروخ في جميع أجزاء المعدة',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 3,
  //     description:
  //         'Check oil level in the tank and quality (Refill or replace if necessary).',
  //     arabicDescription:
  //         'تأكد من مستوى الزيت في التانك ومن صلاحيته (إملأ أو غير الزيت إذا تطلب الأمر)',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 4,
  //     description:
  //         'Check if electrical safety test done or not (Certificate) and electric components okay. And ensure pressure gauge no crack and damage and in good conditions.',
  //     arabicDescription:
  //         'تأكد من أن الاختبارات الكهربائية اللازمة تمت بالفعل (يوجد شهادة) وان جميع الأجزاء الكهربية سليمة. كما تأكد من عداد الضغط لا يوجد به كسور او شروخ ويعمل جيدا.',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 5,
  //     description:
  //         'Ensure Remote control cable fully unrolled and not kinked, twisted or damaged.',
  //     arabicDescription:
  //         'تأكد أن كابل ريموت التحكم غير ملفوف بالكامل او غير ملتوي أو تالف',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 6,
  //     description:
  //         'All couplings and other connections are tight and not damaged or deformed.',
  //     arabicDescription:
  //         'جميع التوصيلات محكمة الربط وغير تالفة أو مشوهة او مكسورة',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 7,
  //     description:
  //         'Hydraulic hoses are securely connected, not kinked, twisted, or damaged and check it\'s connections ok and expiry date.',
  //     arabicDescription:
  //         'تأكد ان جميع الخراطيم محكمة التوصيل بأمان غير ملفوفة بالكامل وغير ملتوية ولا يوجد بها أي تلف واضح كما تأكد من أجزاء التوصيل الخاصة بها سليمة ومن تاريخ صلاحية الخرطوم',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 8,
  //     description:
  //         'Inspect the hydraulic hoses for damage with a set pressure of 2,900 psi (200 bar), 5,800 psi (400 bar) and 10,000 psi (700 bar).',
  //     arabicDescription:
  //         'إختبر الخراطيم عند ضغط 200 بار ثم 400 بار ثم 700 بار للتأكد من سالمتها',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 9,
  //     description:
  //         'Operate the pump and check if it operated smoothly without any issue or no (in low and high pressure) and check pressure relief valves.',
  //     arabicDescription:
  //         'قم بتشغيل المعدة وتأكد انها تعمل جيدا بدون أي مشاكل أثناء التشغيل في الضغط العالي والواطي وان المحابس تعمل جيدا.',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 10,
  //     description:
  //         'Check remote control with operation (start button, increase pressure button, and stop button) working correctly or no. And ensure Led light in panel should be green (OK).',
  //     arabicDescription:
  //         'تأكد أن ريموت التحكم يعمل جيدا دون أي أعطال أو مشاكل.(زر التشغيل,زر رفع الضغط, وزر الإيقاف). وتأكد أن لمبة اللوحة الكهربية باللون الأخضر',
  //   ),
  //   HydraulicPumpChecklistModel(
  //     id: 11,
  //     description:
  //         'Inspect for any signs of oil leaks around the pump, gauge, hoses, and adapter connections.',
  //     arabicDescription:
  //         'تأكد من انه لا يوجد أي تسريب للزيت حول المعدة والخراطيم والعداد والتوصيلات أثناء التشغيل.',
  //   ),
  // ];

  // Text editing controllers for the form fields
  final Map<String, TextEditingController> _textControllers = {
    'kitSku': TextEditingController(),
    'itemSku': TextEditingController(),
    'kitDescription': TextEditingController(),
    'itemDescription': TextEditingController(text: 'HYDRAULIC PUMP'),
    'kitSerialNo': TextEditingController(),
    'itemSerialNo': TextEditingController(),
    'inspectedBy': TextEditingController(),
    'itemModel': TextEditingController(),
    'inspectionDate': TextEditingController(),
    'nextInspectionDate': TextEditingController(),
    'signatureName': TextEditingController(),
    'signatureDate': TextEditingController(),
  };

  bool _isGeneratingPdf = false;
  late pw.Font _arabicFont;
  late pw.Font _englishFont;
  late pw.Font _boldEnglishFont;
  bool _fontLoaded = false;
  late pw.MemoryImage _siemensLogo;
  late pw.MemoryImage _reportToolImage;
  bool _imagesLoaded = false;

  @override
  void initState() {
    super.initState();
    // Set default inspection date to today
    _textControllers['inspectionDate']?.text =
        DateFormat('dd/MM/yyyy').format(DateTime.now());

    // Load fonts and images
    _loadResources();
  }

  Future<void> _loadResources() async {
    try {
      // Load Arabic font
      final arabicFontData = await rootBundle.load('fonts/Amiri-Bold.ttf');
      _arabicFont = pw.Font.ttf(arabicFontData);

      // Load English fonts that support Unicode
      final englishFontData =
          await rootBundle.load('fonts/NotoSans-Regular.ttf');
      _englishFont = pw.Font.ttf(englishFontData);

      final boldEnglishFontData =
          await rootBundle.load('fonts/NotoSans-Bold.ttf');
      _boldEnglishFont = pw.Font.ttf(boldEnglishFontData);

      // Load images
      final siemensLogoData = await rootBundle.load('images/siemens_logo.png');
      final reportToolData = await rootBundle.load('images/report_tool.png');

      _siemensLogo = pw.MemoryImage(siemensLogoData.buffer.asUint8List());
      _reportToolImage = pw.MemoryImage(reportToolData.buffer.asUint8List());

      setState(() {
        _fontLoaded = true;
        _imagesLoaded = true;
      });
    } catch (e) {
      // Fallback to default fonts if custom fonts fail to load
      await _loadFallbackFonts();

      // Create placeholder images if image loading fails
      _siemensLogo = await _createPlaceholderImage();
      _reportToolImage = await _createPlaceholderImage();

      setState(() {
        _fontLoaded = true;
        _imagesLoaded = true;
      });
    }
  }

  Future<void> _loadFallbackFonts() async {
    try {
      // Try to load any available font that supports Unicode
      final fontData = await rootBundle.load('fonts/DejaVuSans.ttf');
      _arabicFont = pw.Font.ttf(fontData);
      _englishFont = pw.Font.ttf(fontData);
      _boldEnglishFont = pw.Font.ttf(fontData);
    } catch (e) {
      // Final fallback - use the default font but with fontFallback
      _arabicFont = pw.Font.courier();
      _englishFont = pw.Font.courier();
      _boldEnglishFont = pw.Font.courierBold();
    }
  }

  Future<pw.MemoryImage> _createPlaceholderImage() async {
    // Create a simple placeholder image
    final image = await _generatePlaceholderImage();
    return pw.MemoryImage(image);
  }

  Future<Uint8List> _generatePlaceholderImage() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Container(
            width: 100,
            height: 50,
            color: PdfColors.grey,
            child: pw.Center(
              child: pw.Text(
                'Image',
                style: pw.TextStyle(color: PdfColors.white, font: _englishFont),
              ),
            ),
          ),
        ),
      ),
    );
    return await pdf.save();
  }

  @override
  void dispose() {
    // Dispose all controllers when widget is disposed
    for (var controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hydraulic Pump Checklist'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 2,
        centerTitle: true,
        actions: [
          IconButton(
            icon: _isGeneratingPdf || !_fontLoaded || !_imagesLoaded
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.save),
            onPressed: (_isGeneratingPdf || !_fontLoaded || !_imagesLoaded)
                ? null
                : _saveFormData,
            tooltip: 'Save Form and Generate PDF',
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _clearForm,
            tooltip: 'Clear Form',
          ),
        ],
      ),
      body: (!_fontLoaded || !_imagesLoaded || _isGeneratingPdf)
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading...', style: TextStyle(fontSize: 16)),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  buildHeaderSection(
                    context,
                    'images/siemens_logo.png',
                    'Egypt Tooling Center',
                    'Hydraulic Pump Checklist',
                    'images/report_tool.png',
                    'Ref. ID:  ESC-T-P-001',
                    'Revision: 1.0',
                  ),
                  const SizedBox(height: 24),

                  // Inspection Information Section
                  _buildInspectionInfoSection(),
                  const SizedBox(height: 24),

                  // Checklist Table Header
                  _buildTableHeader(),
                  const SizedBox(height: 16),
                  const Text('Visual Inspections And Functional Inspections: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),

                  // Checklist Items
                  ...HydraulicPumpChecklistModel.checklistItems
                      .map((item) => _buildChecklistItem(item)),

                  const SizedBox(height: 32),

                  // Signature Section
                  _buildSignatureSection(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
    );
  }

  // Widget _buildHeaderSection() {
  //   return Container(
  //     height: MediaQuery.of(context).size.height * 0.20,
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.grey[100],
  //       border: Border.all(color: Colors.grey[300]!),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Row(
  //       children: [
  //         const Column(
  //           children: [
  //             Expanded(
  //               child: Image(
  //                   image: AssetImage('images/siemens_logo.png'), height: 50),
  //             ),
  //             Expanded(
  //               child: Text(
  //                 'Egypt Tooling Center',
  //                 style: TextStyle(
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.blue,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         const Spacer(),
  //         const Column(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 'HYDRAULIC PUMP 700BAR;230V-1,5KW',
  //                 style: TextStyle(
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.blue,
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: Image(
  //                   image: AssetImage('images/report_tool.png'), height: 70),
  //             ),
  //           ],
  //         ),
  //         const Spacer(),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             const Expanded(
  //               child: Text(
  //                 'Ref. ID:  ESC-T-P-001',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold, color: Colors.blue),
  //               ),
  //             ),
  //             const Expanded(
  //               child: Text(
  //                 'Revision: 1.0',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold, color: Colors.blue),
  //               ),
  //             ),
  //             Expanded(
  //               child: Text(
  //                 "Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.bold, color: Colors.blue),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildInspectionInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildInfoField('KIT SKU', 'kitSku'),
              const SizedBox(width: 16),
              _buildInfoField('Item SKU', 'itemSku'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildInfoField('KIT description', 'kitDescription'),
              const SizedBox(width: 16),
              _buildInfoField('Item description', 'itemDescription'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildInfoField('KIT serial No.', 'kitSerialNo'),
              const SizedBox(width: 16),
              _buildInfoField('Item serial No.', 'itemSerialNo'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildInfoField('Inspected by', 'inspectedBy'),
              const SizedBox(width: 16),
              _buildInfoField('Item Model', 'itemModel'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildInfoField('Inspection date', 'inspectionDate'),
              const SizedBox(width: 16),
              _buildInfoField('Next inspection date', 'nextInspectionDate'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label, String controllerKey) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              controller: _textControllers[controllerKey],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border.all(color: Colors.blue[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          SizedBox(
              width: 40,
              child:
                  Text('No.', style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              flex: 3,
              child: Text('Descriptions',
                  style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(
              width: 60,
              child: Text('OK',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)),
          SizedBox(
              width: 80,
              child: Text('Not OK',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)),
          SizedBox(
              width: 40,
              child: Text('NA',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(HydraulicPumpChecklistModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  item.id.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.description,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.arabicDescription,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 60,
                child: Radio<String>(
                  value: 'OK',
                  groupValue: item.status,
                  onChanged: (value) {
                    setState(() {
                      item.status = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 80,
                child: Radio<String>(
                  value: 'Not OK',
                  groupValue: item.status,
                  onChanged: (value) {
                    setState(() {
                      item.status = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 40,
                child: Radio<String>(
                  value: 'NA',
                  groupValue: item.status,
                  onChanged: (value) {
                    setState(() {
                      item.status = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignatureSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Signature with name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        controller: _textControllers['signatureName'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          hintText: 'Enter name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Signature date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        controller: _textControllers['signatureDate'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          hintText: 'Enter date',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _saveFormData() async {
    setState(() {
      _isGeneratingPdf = true;
    });

    try {
      // Validate form data
      if (_textControllers['inspectedBy']?.text.trim().isEmpty ?? true) {
        throw Exception('Please enter inspector name');
      }

      // Generate PDF
      final pdf = await _generatePdf();

      // Save and share PDF
      await Printing.sharePdf(
          bytes: pdf,
          filename:
              'hydraulic-pump-checklist-${DateTime.now().millisecondsSinceEpoch}.pdf');

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('PDF generated and shared successfully!',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error generating PDF: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isGeneratingPdf = false;
        });
      }
    }
  }

  Future<Uint8List> _generatePdf() async {
    final pdf = pw.Document();
    final now = DateTime.now();
    final formattedDate = DateFormat('dd MMM yyyy').format(now);

    // Add a page to the PDF
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) => [
          // Header Section
          _buildPdfHeader(formattedDate),
          pw.SizedBox(height: 20),

          // Inspection Information Section
          _buildPdfInspectionInfo(),
          pw.SizedBox(height: 20),

          // Checklist Section
          _buildPdfChecklist(),
          pw.SizedBox(height: 30),

          // Signature Section
          _buildPdfSignatureSection(),
        ],
      ),
    );

    return await pdf.save();
  }

  pw.Widget _buildPdfHeader(String date) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(16),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            children: [
              pw.Image(_siemensLogo, height: 40),
              pw.SizedBox(height: 10),
              pw.Text(
                'Egypt Tooling Center',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue,
                  font: _boldEnglishFont,
                ),
              ),
            ],
          ),
          pw.Column(
            children: [
              pw.Text(
                'HYDRAULIC PUMP 700BAR;230V-1,5KW',
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue,
                  font: _boldEnglishFont,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Image(_reportToolImage, height: 50),
            ],
          ),
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Ref. ID: ESC-T-P-001',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue,
                  fontSize: 10,
                  font: _boldEnglishFont,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                'Revision: 1.0',
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue,
                  fontSize: 10,
                  font: _boldEnglishFont,
                ),
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                "Date: $date",
                style: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.blue,
                  fontSize: 10,
                  font: _boldEnglishFont,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  pw.Widget _buildPdfInspectionInfo() {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey),
      children: [
        _buildPdfInfoRow('KIT SKU', _textControllers['kitSku']?.text ?? ''),
        _buildPdfInfoRow('Item SKU', _textControllers['itemSku']?.text ?? ''),
        _buildPdfInfoRow(
            'KIT description', _textControllers['kitDescription']?.text ?? ''),
        _buildPdfInfoRow('Item description',
            _textControllers['itemDescription']?.text ?? ''),
        _buildPdfInfoRow(
            'KIT serial No.', _textControllers['kitSerialNo']?.text ?? ''),
        _buildPdfInfoRow(
            'Item serial No.', _textControllers['itemSerialNo']?.text ?? ''),
        _buildPdfInfoRow(
            'Inspected by', _textControllers['inspectedBy']?.text ?? ''),
        _buildPdfInfoRow(
            'Item Model', _textControllers['itemModel']?.text ?? ''),
        _buildPdfInfoRow(
            'Inspection date', _textControllers['inspectionDate']?.text ?? ''),
        _buildPdfInfoRow('Next inspection date',
            _textControllers['nextInspectionDate']?.text ?? ''),
      ],
    );
  }

  pw.TableRow _buildPdfInfoRow(String label, String value) {
    return pw.TableRow(
      children: [
        pw.Container(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(
            label,
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 10,
              font: _boldEnglishFont,
            ),
          ),
        ),
        pw.Container(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(
            value.isEmpty ? '-' : value,
            style: pw.TextStyle(
              fontSize: 10,
              font: _englishFont,
            ),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildPdfChecklist() {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.grey),
      columnWidths: {
        0: const pw.FlexColumnWidth(0.5),
        1: const pw.FlexColumnWidth(4),
        2: const pw.FlexColumnWidth(0.5),
        3: const pw.FlexColumnWidth(0.7),
        4: const pw.FlexColumnWidth(0.5),
      },
      children: [
        // Header row
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.blue50),
          children: [
            _buildPdfTableCell('No.', isHeader: true),
            _buildPdfTableCell('Descriptions', isHeader: true),
            _buildPdfTableCell('OK', isHeader: true),
            _buildPdfTableCell('Not OK', isHeader: true),
            _buildPdfTableCell('NA', isHeader: true),
          ],
        ),
        // Checklist items
        for (var item in HydraulicPumpChecklistModel.checklistItems)
          pw.TableRow(
            children: [
              _buildPdfTableCell(item.id.toString()),
              pw.Container(
                padding: const pw.EdgeInsets.all(6),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      item.description,
                      style: pw.TextStyle(
                        fontSize: 9,
                        font: _englishFont,
                      ),
                      textDirection: pw.TextDirection.ltr,
                    ),
                    pw.SizedBox(height: 3),
                    pw.Text(
                      item.arabicDescription,
                      style: pw.TextStyle(
                        fontSize: 9,
                        font: _arabicFont,
                      ),
                      textDirection: pw.TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              _buildPdfTableCell(item.status == 'OK' ? '*' : ''),
              _buildPdfTableCell(item.status == 'Not OK' ? '*' : ''),
              _buildPdfTableCell(item.status == 'NA' ? '*' : ''),
            ],
          ),
      ],
    );
  }

  pw.Widget _buildPdfTableCell(String text, {bool isHeader = false}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(6),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
          fontSize: isHeader ? 10 : 9,
          font: isHeader ? _boldEnglishFont : _englishFont,
        ),
        textAlign: pw.TextAlign.center,
      ),
    );
  }

  pw.Widget _buildPdfSignatureSection() {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Signature with name',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 12,
                    font: _boldEnglishFont,
                  )),
              pw.SizedBox(height: 20),
              pw.Container(
                width: double.infinity,
                height: 1,
                color: PdfColors.black,
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                _textControllers['signatureName']?.text.isEmpty ?? true
                    ? '(Name)'
                    : _textControllers['signatureName']!.text,
                style: pw.TextStyle(
                  fontSize: 10,
                  font: _englishFont,
                ),
              ),
            ],
          ),
        ),
        pw.SizedBox(width: 20),
        pw.Expanded(
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Signature date',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 12,
                    font: _boldEnglishFont,
                  )),
              pw.SizedBox(height: 20),
              pw.Container(
                width: double.infinity,
                height: 1,
                color: PdfColors.black,
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                _textControllers['signatureDate']?.text.isEmpty ?? true
                    ? '(Date)'
                    : _textControllers['signatureDate']!.text,
                style: pw.TextStyle(
                  fontSize: 10,
                  font: _englishFont,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _clearForm() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Form'),
        content: const Text('Are you sure you want to clear all form data?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              clearForm();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Form cleared successfully',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  Map<String, String> getFormData() {
    Map<String, String> formData = {};
    _textControllers.forEach((key, controller) {
      formData[key] = controller.text;
    });

    for (var item in HydraulicPumpChecklistModel.checklistItems) {
      formData['checklist_${item.id}'] = item.status ?? 'Not Set';
    }

    return formData;
  }

  void clearForm() {
    setState(() {
      for (var controller in _textControllers.values) {
        controller.clear();
      }
      _textControllers['itemDescription']?.text = 'HYDRAULIC PUMP';
      _textControllers['inspectionDate']?.text =
          DateFormat('dd/MM/yyyy').format(DateTime.now());

      for (var item in HydraulicPumpChecklistModel.checklistItems) {
        item.status = null;
      }
    });
  }
}

// class ChecklistItem {
//   final int id;
//   final String description;
//   final String arabicDescription;
//   String? status;

//   ChecklistItem({
//     required this.id,
//     required this.description,
//     required this.arabicDescription,
//     this.status,
//   });
// }

