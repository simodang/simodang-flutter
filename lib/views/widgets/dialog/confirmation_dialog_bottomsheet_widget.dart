import 'package:flutter/material.dart';

class ConfirmationDialogBottomSheetWidget extends StatelessWidget {
  const ConfirmationDialogBottomSheetWidget({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: Colors.green
            ),
            onPressed: onConfirm,
            child: const Text('Ya'),
          ),
          const SizedBox(height: 10),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
              backgroundColor: Colors.red
            ),
            onPressed: onCancel,
            child: const Text('Tidak'),
          )
        ],
      ),
    );
  }
}
