import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildHeaderSection(
  BuildContext context,
  String imageLogoPath,
  String title,
  String toolTitle,
  String imageToolPath,
  String refString,
  String revString,
) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.20,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      border: Border.all(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Column(
          children: [
            Expanded(
              child: Image(image: AssetImage(imageLogoPath), height: 50),
              // image: AssetImage('images/siemens_logo.png'), height: 50),
            ),
            Expanded(
              child: Text(
                title,
                // 'Egypt Tooling Center',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Expanded(
              child: Text(
                toolTitle,
                // 'HYDRAULIC PUMP 700BAR;230V-1,5KW',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: Image(image: AssetImage(imageToolPath), height: 70),
              // image: AssetImage('images/report_tool.png'), height: 70),
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                refString,
                // 'Ref. ID:  ESC-T-P-001',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            Expanded(
              child: Text(
                revString,
                // 'Revision: 1.0',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
            Expanded(
              child: Text(
                "Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
