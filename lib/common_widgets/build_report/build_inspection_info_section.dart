import 'package:flutter/material.dart';

import 'build_info_text_field.dart';

Widget buildInspectionInfoSection() {
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
            buildInfoField('KIT SKU', 'kitSku'),
            const SizedBox(width: 16),
            buildInfoField('Item SKU', 'itemSku'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            buildInfoField('KIT description', 'kitDescription'),
            const SizedBox(width: 16),
            buildInfoField('Item description', 'itemDescription'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            buildInfoField('KIT serial No.', 'kitSerialNo'),
            const SizedBox(width: 16),
            buildInfoField('Item serial No.', 'itemSerialNo'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            buildInfoField('Inspected by', 'inspectedBy'),
            const SizedBox(width: 16),
            buildInfoField('Item Model', 'itemModel'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            buildInfoField('Inspection date', 'inspectionDate'),
            const SizedBox(width: 16),
            buildInfoField('Next inspection date', 'nextInspectionDate'),
          ],
        ),
      ],
    ),
  );
}
