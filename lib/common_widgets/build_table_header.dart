import 'package:flutter/material.dart';

Widget buildTableHeader(String serialNo, String description, String okString,
    String notOkString, String naString) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.blue[50],
      border: Border.all(color: Colors.blue[300]!),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        SizedBox(
            width: 40,
            child: Text(serialNo,
            // child: Text('No.',
                style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            flex: 3,
            child: Text(description,
            // child: Text('Description',
                style: const TextStyle(fontWeight: FontWeight.bold))),
        SizedBox(
            width: 60,
            child: Text(okString,
            // child: Text('OK',
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)),
        SizedBox(
            width: 80,
            child: Text(notOkString,
            // child: Text('Not OK',
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)),
        SizedBox(
            width: 40,
            child: Text(naString,
            // child: Text('N/A',
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)),
      ],
    ),
  );
}
