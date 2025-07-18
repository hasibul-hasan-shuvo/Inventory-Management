import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AppSecondaryButton extends StatelessWidget with BaseWidgetMixin {
  AppSecondaryButton({
    super.key,
    required this.title,
    this.icon,
    this.onPress,
  });

  final VoidCallback? onPress;
  final String title;
  final Widget? icon;

  @override
  Widget body(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: icon != null
                ? AppValues.halfPadding.h
                : AppValues.smallPadding.h,
            horizontal: AppValues.padding_4.w,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius_6.sp),
          ),
        ),
      ),
      onPressed: onPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? const SizedBox(),
          Flexible(
            child: Text(
              title,
              style: theme.outlinedButtonTheme.style?.textStyle?.resolve(
                  onPress != null
                      ? {MaterialState.focused}
                      : {MaterialState.disabled}),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ).paddingSymmetric(vertical: AppValues.padding_2.h),
    );
  }
}
