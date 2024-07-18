import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_primary_button.dart';
import 'package:dental_inventory/app/core/widget/app_secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class AppDialog extends StatelessWidget with BaseWidgetMixin {
  final String title;
  final String? message;
  final Widget? content;
  final String? negativeButtonText;
  final String? positiveButtonText;
  final VoidCallback? onNegativeButtonTap;
  final VoidCallback? onPositiveButtonTap;
  final IconData? negativeButtonIcon;
  final bool isCancelable;
  final bool willPopOnPositiveButtonTap;
  final bool willPopOnNegativeButtonTap;
  final Color? headerColor;

  AppDialog({
    Key? key,
    required this.title,
    this.message,
    this.negativeButtonText,
    this.content,
    this.positiveButtonText,
    this.onNegativeButtonTap,
    this.onPositiveButtonTap,
    this.negativeButtonIcon,
    this.isCancelable = true,
    this.willPopOnPositiveButtonTap = true,
    this.willPopOnNegativeButtonTap = true,
    this.headerColor,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      contentPadding: EdgeInsets.all(AppValues.padding.sp),
      titlePadding: EdgeInsets.zero,
      title: _getTitle(),
      content: content ?? _getMessage(),
      actions: _getActions(context),
      actionsPadding: EdgeInsets.symmetric(
        vertical: AppValues.smallPadding.h,
      ),
    );
  }

  Widget _getTitle() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: headerColor ?? theme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppValues.margin_6),
          topRight: Radius.circular(AppValues.margin_6),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isCancelable ? AppValues.padding_zero.h : AppValues.padding.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: textTheme.bodyLarge?.copyWith(color: appColors.colorWhite),
            ),
          ),
          _getCancelButton(),
        ],
      ).paddingOnly(
        left: AppValues.padding.w,
      ),
    );
  }

  Widget _getCancelButton() {
    return isCancelable
        ? IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.clear,
              color: appColors.colorWhite,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _getMessage() {
    return Text(
      message ?? "",
      style: textTheme.bodyMedium,
    );
  }

  List<Widget> _getActions(BuildContext context) => [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.padding.w,
            vertical: AppValues.smallPadding.h,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: negativeButtonText != null
                    ? AppSecondaryButton(
                        onPress: () {
                          onNegativeButtonTap?.call();
                          if (willPopOnNegativeButtonTap) {
                            Navigator.pop(context);
                          }
                        },
                        title: negativeButtonText ?? "",
                        icon: negativeButtonIcon != null
                            ? Icon(negativeButtonIcon)
                            : const SizedBox.shrink(),
                      )
                    : const SizedBox.shrink(),
              ),
              SizedBox(width: AppValues.margin_10.w),
              Expanded(
                flex: 1,
                child: AppPrimaryButton(
                  onPressed: () {
                    onPositiveButtonTap?.call();
                    if (willPopOnPositiveButtonTap) {
                      Navigator.pop(context);
                    }
                  },
                  title: positiveButtonText ?? appLocalization.ok,
                ),
              )
            ],
          ),
        ),
      ];
}
