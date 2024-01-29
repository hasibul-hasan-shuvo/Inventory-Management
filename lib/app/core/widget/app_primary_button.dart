import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_values.dart';

// ignore: must_be_immutable
class AppPrimaryButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return isLoading == true
        ? CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
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
              color: Theme.of(context).colorScheme.primary,
              onPressed: isEnabled ?? true ? onPressed : null,
              child: textStyle == null
                  ? FittedBox(
                      child: Text(
                        title,
                        style: textStyle ??
                            TextStyle(
                              color: Theme.of(context).colorScheme.surface,
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
