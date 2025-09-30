import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../build_report/build_info_text_field.dart';

//Build the inspection info table
pw.Widget buildPdfSignatureSection(
  pw.Font boldEnglishFont,
  pw.Font englishFont,
) {
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
                  font: boldEnglishFont,
                )),
            pw.SizedBox(height: 20),
            pw.Container(
              width: double.infinity,
              height: 1,
              color: PdfColors.black,
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              textControllers['signatureName']?.text.isEmpty ?? true
                  ? '(Name)'
                  : textControllers['signatureName']!.text,
              style: pw.TextStyle(
                fontSize: 10,
                font: englishFont,
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
                  font: boldEnglishFont,
                )),
            pw.SizedBox(height: 20),
            pw.Container(
              width: double.infinity,
              height: 1,
              color: PdfColors.black,
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              textControllers['signatureDate']?.text.isEmpty ?? true
                  ? '(Date)'
                  : textControllers['signatureDate']!.text,
              style: pw.TextStyle(
                fontSize: 10,
                font: englishFont,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
