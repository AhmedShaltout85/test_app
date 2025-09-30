import 'package:flutter/material.dart';

Widget buildInfoField(String label, String controllerKey) {
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
            controller: textControllers[controllerKey],
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

final Map<String, TextEditingController> textControllers = {
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
