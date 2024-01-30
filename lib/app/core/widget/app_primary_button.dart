import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_values.dart';

// ignore: must_be_immutable
class AppPrimaryButton extends StatelessWidget with BaseWidgetMixin {
  final Function() onPressed;
  final String title;
  bool? isEnabled;
  bool? isLoading;
  double? width;
  double? height;
  TextStyle? textStyle;

  AppPrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isEnabled,
    this.isLoading,
    this.height,
    this.width,
    this.textStyle,
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
      child: CupertinoButton(
        padding: textStyle != null
            ? EdgeInsets.symmetric(
            horizontal: AppValues.margin_10.w,
            vertical: AppValues.halfPadding.h)
            : null,
        color: theme.colorScheme.primary,
        onPressed: isEnabled ?? true ? onPressed : null,
        child: textStyle == null
            ? FittedBox(
          child: Text(
            title,
            style: textStyle ??
                TextStyle(
                  color: theme.colorScheme.surface,
                  fontWeight: FontWeight.w600,
                ),
          ),
        )
            : Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
