import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: must_be_immutable
class AppSecondaryButton extends StatelessWidget with BaseWidgetMixin {
  AppSecondaryButton(
      {super.key, required this.onPress, required this.title, this.icon});

  final VoidCallback? onPress;
  final String title;
  final Widget? icon;

  @override
  Widget body(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: AppValues.smallPadding.h,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius_6.sp),
          ),
        ),
      ),
      onPressed: () {
        onPress?.call();
        Navigator.pop(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? const SizedBox(),
          Text(title),
        ],
      ),
    );
  }
}
