import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:test_app/common_widgets/build_pdf/build_pdf_header.dart';
import 'package:test_app/common_widgets/build_pdf/build_pdf_inspection_info_and_body.dart';
import 'package:test_app/common_widgets/build_pdf/build_pdf_signature_section.dart';

import '../../hydraulic_pump_checklist_model/hydraulic_pump_checklist_items.dart';

Future<Uint8List> generatePdf(
    pw.Font boldEnglishFont,
    pw.Font englishFont,
    pw.MemoryImage siemensLogo,
    pw.MemoryImage reportToolImage,
    pw.Font arabicFont) async {
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
        buildPdfHeader(
            formattedDate, boldEnglishFont, siemensLogo, reportToolImage),
        pw.SizedBox(height: 20),

        // Inspection Information Section
        buildPdfInspectionInfo(boldEnglishFont, englishFont),
        pw.SizedBox(height: 20),

        // Checklist Section
        buildPdfChecklist(arabicFont, englishFont, boldEnglishFont,
            HydraulicPumpChecklistModel.checklistItems),
        pw.SizedBox(height: 30),

        // Signature Section
        buildPdfSignatureSection(boldEnglishFont, englishFont),
      ],
    ),
  );

  return await pdf.save();
}
