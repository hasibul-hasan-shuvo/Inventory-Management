import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ignore: must_be_immutable
class AppDialog extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final String message;
  final String? negativeButtonText;
  final String? positiveButtonText;
  final VoidCallback? onNegativeButtonTap;
  final VoidCallback? onPositiveButtonTap;

  AppDialog({
    Key? key,
    required this.title,
    required this.message,
    this.negativeButtonText,
    this.positiveButtonText,
    this.onNegativeButtonTap,
    this.onPositiveButtonTap,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return AlertDialog(
      title: _getTitle(),
      content: _getMessage(),
      actions: _getActions(context),
      actionsPadding: EdgeInsets.symmetric(
        vertical: AppValues.smallPadding.h,
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      title,
      style: textTheme.titleMedium,
    );
  }

  Widget _getMessage() {
    return Text(
      message,
      style: textTheme.bodyMedium,
    );
  }

  List<Widget> _getActions(BuildContext context) => [
        TextButton(
          onPressed: () {
            onNegativeButtonTap?.call();
            Navigator.pop(context);
          },
          child: Text(negativeButtonText ?? appLocalization.ok),
        ),
        if (positiveButtonText != null)
          TextButton(
            onPressed: () {
              onPositiveButtonTap?.call();
              Navigator.pop(context);
            },
            child: Text(positiveButtonText!),
          ),
      ];
}
