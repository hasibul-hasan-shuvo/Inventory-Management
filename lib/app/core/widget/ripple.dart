import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Ripple extends StatelessWidget with BaseWidgetMixin {
  final Function()? onTap;
  final Widget? child;
  final Color? rippleColor;
  final double rippleRadius;

  Ripple({
    Key? key,
    this.child,
    required this.onTap,
    this.rippleColor,
    this.rippleRadius = AppValues.smallRadius,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(rippleRadius),
        highlightColor: rippleColor ?? appColors.defaultRippleColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
