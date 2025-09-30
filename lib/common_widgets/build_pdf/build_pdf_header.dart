import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget buildPdfHeader(
  String date,
  pw.Font boldEnglishFont,
  pw.MemoryImage siemensLogo,
  pw.MemoryImage reportToolImage,
  ) {
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
            pw.Image(siemensLogo, height: 40),
            pw.SizedBox(height: 10),
            pw.Text(
              'Egypt Tooling Center',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue,
                font: boldEnglishFont,
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
                font: boldEnglishFont,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Image(reportToolImage, height: 50),
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
                font: boldEnglishFont,
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              'Revision: 1.0',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue,
                fontSize: 10,
                font: boldEnglishFont,
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              "Date: $date",
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue,
                fontSize: 10,
                font: boldEnglishFont,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
