import 'package:flutter/material.dart';

import '../hydraulic_pump_checklist_model/hydraulic_pump_checklist_items.dart';

class BuildChecklistItem extends StatefulWidget {
 final HydraulicPumpChecklistModel item;
  const BuildChecklistItem({super.key, required this.item});

  @override
  State<BuildChecklistItem> createState() => _BuildChecklistItemState();
}

class _BuildChecklistItemState extends State<BuildChecklistItem> {
  
  @override
  Widget build(BuildContext context) {
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
                  widget.item.id.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.description,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.item.arabicDescription,
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
                  groupValue: widget.item.status,
                  onChanged: (value) {
                    setState(() {
                      widget.item.status = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 80,
                child: Radio<String>(
                  value: 'Not OK',
                  groupValue: widget.item.status,
                  onChanged: (value) {
                    setState(() {
                      widget.item.status = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 40,
                child: Radio<String>(
                  value: 'NA',
                  groupValue: widget.item.status,
                  onChanged: (value) {
                    setState(() {
                      widget.item.status = value;
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
}
