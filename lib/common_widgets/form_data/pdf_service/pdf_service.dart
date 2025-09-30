import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:test_app/common_widgets/build_pdf/generate_pdf.dart';

/// Generates and shares a PDF document
/// Returns true if successful, throws Exception on failure
class PdfService {
  static Future<bool> generateAndSharePdf({
    required Map<String, TextEditingController> textControllers,
    required pw.Font boldEnglishFont,
    required pw.Font englishFont,
    required dynamic siemensLogo,
    required dynamic reportToolImage,
    required pw.Font arabicFont,
     Future<Uint8List> Function(
      pw.Font boldEnglishFont,
      pw.Font englishFont,
      dynamic siemensLogo,
      dynamic reportToolImage,
      pw.Font arabicFont,
    )? generatePdfFunction,
  }) async {
    // Validate form data
    _validateFormData(textControllers);

    // Generate PDF
    final pdf = await generatePdf(
        boldEnglishFont, englishFont, siemensLogo, reportToolImage, arabicFont);
    // generatePdfFunction(
    //   boldEnglishFont,
    //   englishFont,
    //   siemensLogo,
    //   reportToolImage,
    //   arabicFont,
    // );

    // Save and share PDF
    await Printing.sharePdf(
      bytes: pdf,
      filename:
          'hydraulic-pump-checklist-${DateTime.now().millisecondsSinceEpoch}.pdf',
    );

    return true;
  }

  /// Validates required form fields
  static void _validateFormData(
      Map<String, TextEditingController> textControllers) {
    if (textControllers['inspectedBy']?.text.trim().isEmpty ?? true) {
      throw Exception('Please enter inspector name');
    }
  }

  /// Shows success message
  static void showSuccessMessage(BuildContext context) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'PDF generated and shared successfully!',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  /// Shows error message
  static void showErrorMessage(BuildContext context, dynamic error) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error generating PDF: $error'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
