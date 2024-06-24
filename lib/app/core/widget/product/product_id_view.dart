import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProductIdView extends StatelessWidget with BaseWidgetMixin {
  final String id;

  ProductIdView({
    super.key,
    required this.id,
  });

  @override
  Widget body(BuildContext context) {
    return Text(
      "#$id",
      style: textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
      maxLines: 1,
    );
  }
}
