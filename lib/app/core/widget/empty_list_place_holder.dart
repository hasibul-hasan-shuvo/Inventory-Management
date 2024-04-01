import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EmptyListPlaceHolder extends StatelessWidget with BaseWidgetMixin {
  final String message;

  EmptyListPlaceHolder({
    super.key,
    required this.message,
  });

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: textTheme.bodyMedium,
      ),
    ).marginSymmetric(
      horizontal: AppValues.margin.w,
      vertical: AppValues.margin.h,
    );
  }
}
