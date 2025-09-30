import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../hydraulic_pump_checklist_model/hydraulic_pump_checklist_items.dart';
import '../build_report/build_info_text_field.dart';

// Build the inspection info table
pw.Widget buildPdfInspectionInfo(pw.Font boldEnglishFont, pw.Font englishFont) {
  return pw.Table(
    border: pw.TableBorder.all(color: PdfColors.grey),
    children: [
      _buildPdfInfoRow('KIT SKU', textControllers['kitSku']?.text ?? '',
          boldEnglishFont, englishFont),
      _buildPdfInfoRow('Item SKU', textControllers['itemSku']?.text ?? '',
          boldEnglishFont, englishFont),
      _buildPdfInfoRow(
          'KIT description',
          textControllers['kitDescription']?.text ?? '',
          boldEnglishFont,
          englishFont),
      _buildPdfInfoRow(
          'Item description',
          textControllers['itemDescription']?.text ?? '',
          boldEnglishFont,
          englishFont),
      _buildPdfInfoRow(
          'KIT serial No.',
          textControllers['kitSerialNo']?.text ?? '',
          boldEnglishFont,
          englishFont),
      _buildPdfInfoRow(
          'Item serial No.',
          textControllers['itemSerialNo']?.text ?? '',
          boldEnglishFont,
          englishFont),
      _buildPdfInfoRow(
          'Inspected by',
          textControllers['inspectedBy']?.text ?? '',
          boldEnglishFont,
          englishFont),
      _buildPdfInfoRow('Item Model', textControllers['itemModel']?.text ?? '',
          boldEnglishFont, englishFont),
      _buildPdfInfoRow(
          'Inspection date',
          textControllers['inspectionDate']?.text ?? '',
          boldEnglishFont,
          englishFont),
      _buildPdfInfoRow(
          'Next inspection date',
          textControllers['nextInspectionDate']?.text ?? '',
          boldEnglishFont,
          englishFont),
    ],
  );
}

//Build info row
pw.TableRow _buildPdfInfoRow(
    String label, String value, pw.Font boldEnglishFont, pw.Font englishFont) {
  return pw.TableRow(
    children: [
      pw.Container(
        padding: const pw.EdgeInsets.all(8),
        child: pw.Text(
          label,
          style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            fontSize: 10,
            font: boldEnglishFont,
          ),
        ),
      ),
      pw.Container(
        padding: const pw.EdgeInsets.all(8),
        child: pw.Text(
          value.isEmpty ? '-' : value,
          style: pw.TextStyle(
            fontSize: 10,
            font: englishFont,
          ),
        ),
      ),
    ],
  );
}

//Build the inspection info table
pw.Widget buildPdfChecklist(
  pw.Font arabicFont,
  pw.Font englishFont,
  pw.Font boldEnglishFont,
  List<HydraulicPumpChecklistModel> checklistItems,
) {
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
          _buildPdfTableCell('No.', boldEnglishFont, englishFont,
              isHeader: true),
          _buildPdfTableCell('Descriptions', boldEnglishFont, englishFont,
              isHeader: true),
          _buildPdfTableCell('OK', boldEnglishFont, englishFont,
              isHeader: true),
          _buildPdfTableCell('Not OK', boldEnglishFont, englishFont,
              isHeader: true),
          _buildPdfTableCell('NA', boldEnglishFont, englishFont,
              isHeader: true),
        ],
      ),
      // Checklist items
      for (var item in checklistItems)
        pw.TableRow(
          children: [
            _buildPdfTableCell(
                item.id.toString(), boldEnglishFont, englishFont),
            pw.Container(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    item.description,
                    style: pw.TextStyle(
                      fontSize: 9,
                      font: englishFont,
                    ),
                    textDirection: pw.TextDirection.ltr,
                  ),
                  pw.SizedBox(height: 3),
                  pw.Text(
                    item.arabicDescription,
                    style: pw.TextStyle(
                      fontSize: 9,
                      font: arabicFont,
                    ),
                    textDirection: pw.TextDirection.rtl,
                  ),
                ],
              ),
            ),
            _buildPdfTableCell(
                item.status == 'OK' ? '*' : '', boldEnglishFont, englishFont),
            _buildPdfTableCell(item.status == 'Not OK' ? '*' : '',
                boldEnglishFont, englishFont),
            _buildPdfTableCell(
                item.status == 'NA' ? '*' : '', boldEnglishFont, englishFont),
          ],
        ),
    ],
  );
}

//Build table cell
pw.Widget _buildPdfTableCell(
    String text, pw.Font boldEnglishFont, pw.Font englishFont,
    {bool isHeader = false}) {
  return pw.Container(
    padding: const pw.EdgeInsets.all(6),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
        fontSize: isHeader ? 10 : 9,
        font: isHeader ? boldEnglishFont : englishFont,
      ),
      textAlign: pw.TextAlign.center,
    ),
  );
}


