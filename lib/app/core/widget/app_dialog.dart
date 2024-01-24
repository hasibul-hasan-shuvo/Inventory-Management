import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class AppDialog extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final String content;
  final String? negativeTex;
  final String? positiveTex;
  final VoidCallback? onNegativeButtonTap;
  final VoidCallback? onPositiveButtonTap;

  AppDialog({
    Key? key,
    required this.title,
    required this.content,
    this.negativeTex,
    this.positiveTex,
    this.onNegativeButtonTap,
    this.onPositiveButtonTap,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if (negativeTex != null)
          TextButton(
            onPressed: () {
              onNegativeButtonTap?.call();
              Navigator.pop(context);
            },
            child: Text(negativeTex!),
          ),
        TextButton(
          onPressed: () {
            onPositiveButtonTap?.call();
            Navigator.pop(context);
          },
          child: Text(positiveTex ?? "Ok"),
        ),
      ],
    );
  }
}
