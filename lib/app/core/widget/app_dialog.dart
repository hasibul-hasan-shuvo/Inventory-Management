import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  const AppDialog({
    Key? key,
    required this.title,
    required this.content,
    this.cancelText,
    this.confirmText,
    this.onCancel,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (cancelText != null)
          TextButton(
            onPressed: onCancel,
            child: Text(cancelText!),
          ),
        if (confirmText != null)
          TextButton(
            onPressed: onConfirm,
            child: Text(confirmText!),
          ),
      ],
    );
  }
}
