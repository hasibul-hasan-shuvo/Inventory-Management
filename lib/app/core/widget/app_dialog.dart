import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final String content;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onNegativeButtonTap;
  final VoidCallback? onPositiveButtonTap;

  AppDialog({
    Key? key,
    required this.title,
    required this.content,
    this.cancelText,
    this.confirmText,
    this.onNegativeButtonTap,
    this.onPositiveButtonTap,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (cancelText != null)
          TextButton(
            onPressed: onNegativeButtonTap,
            child: Text(cancelText!),
          ),
        if (confirmText != null)
          TextButton(
            onPressed: onPositiveButtonTap,
            child: Text(confirmText!),
          ),
      ],
    );
  }

}
