import 'package:flutter/material.dart';
import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dental_inventory/app/core/values/app_values.dart';

// ignore: must_be_immutable
class ElevatedContainer extends StatelessWidget with BaseWidgetMixin {
  final Widget child;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double borderWidth;
  final bool isBorderEnabled;
  final double? height;
  final double? width;

  ElevatedContainer({
    super.key,
    required this.child,
    this.bgColor,
    this.padding,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.isBorderEnabled = false,
    this.height,
    this.width,
  });

  @override
  Widget body(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? AppValues.radius.r),
      child: Container(
        key: key,
        padding: padding,
        decoration: _decoration,
        height: height,
        width: width,
        child: child,
      ),
    );
  }

  BoxDecoration get _decoration => BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? AppValues.radius.r),
        color: bgColor ?? theme.cardColor,
        border: isBorderEnabled
            ? Border.all(
                color: theme.primaryColor,
                width: borderWidth,
              )
            : null,
      );
}
