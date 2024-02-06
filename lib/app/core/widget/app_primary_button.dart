import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppPrimaryButton extends StatelessWidget with BaseWidgetMixin {
  final Function() onPressed;
  final String title;
  bool? isEnabled;
  bool? isLoading;
  double? width;
  double? height;

  AppPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isEnabled,
    this.isLoading,
    this.height,
    this.width,
  });

  @override
  Widget body(BuildContext context) {
    return isLoading == true
        ? CircularProgressIndicator(
            color: theme.primaryColor,
          )
        : SizedBox(
            height: height,
            width: width ?? MediaQuery.of(context).size.width.w,
            child: ElevatedButton(
              style: _style,
              onPressed: isEnabled ?? true ? onPressed : null,
              child: Text(
                title,
                style: textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.surface),
              ),
            ),
          );
  }

  ButtonStyle get _style => ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: AppValues.smallPadding.h,
          horizontal: AppValues.padding.w,
        ),
        elevation: 0,
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius_6.r),
        ),
        disabledBackgroundColor: theme.primaryColor.withOpacity(0.5),
      );
}
