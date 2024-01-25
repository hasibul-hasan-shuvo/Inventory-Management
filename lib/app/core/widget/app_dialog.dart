import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_primary_button.dart';
import 'package:dental_inventory/app/core/widget/app_secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ignore: must_be_immutable
class AppDialog extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final String? message;
  final Widget? content;
  final List<Widget>? actions;
  final String? negativeButtonText;
  final String? positiveButtonText;
  final VoidCallback? onNegativeButtonTap;
  final VoidCallback? onPositiveButtonTap;

  AppDialog({
    Key? key,
    required this.title,
    this.message,
    this.negativeButtonText,
    this.content,
    this.actions,
    this.positiveButtonText,
    this.onNegativeButtonTap,
    this.onPositiveButtonTap,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      contentPadding: EdgeInsets.all(AppValues.smallPadding.sp),
      titlePadding: EdgeInsets.zero,
      title: _getTitle(),
      content: content ?? _getMessage(),
      actions: actions ?? _getActions(context),
      actionsPadding: EdgeInsets.symmetric(
        vertical: AppValues.smallPadding.h,
      ),
    );
  }

  Widget _getTitle() {
    return Container(
      height: AppValues.height_60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppValues.margin_6),
          topRight: Radius.circular(AppValues.margin_6),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _getMessage() {
    return Text(
      message ?? "",
      style: textTheme.bodyMedium,
    );
  }

  List<Widget> _getActions(BuildContext context) => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: negativeButtonText != null
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppSecondaryButton(
                          onPress: onNegativeButtonTap,
                          title: negativeButtonText ?? "",
                          icon: const Icon(Icons.delete)),
                    ),
                    SizedBox(
                      width: AppValues.margin_10.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: AppPrimaryButton(
                          onPressed: () {
                            onPositiveButtonTap?.call();
                            Navigator.pop(context);
                          },
                          title: positiveButtonText ?? appLocalization.ok,
                          textStyle: textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.surface,
                          )),
                    )
                  ],
                )
              : TextButton(
                  onPressed: () {
                    onPositiveButtonTap?.call();
                    Navigator.pop(context);
                  },
                  child: Text(positiveButtonText ?? appLocalization.ok)),
        ),
      ];
}
