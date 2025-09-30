import 'package:flutter/material.dart';

void clearFormDialog(BuildContext context, void Function()? clearForm) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Clear Form'),
      content: const Text('Are you sure you want to clear all form data?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            clearForm!();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Form cleared successfully',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.orange,
              ),
            );
          },
          child: const Text('Clear'),
        ),
      ],
    ),
  );
}
