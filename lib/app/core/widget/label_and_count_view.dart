import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LabelAndCountView extends StatelessWidget with BaseWidgetMixin {
  final String label;
  final String? count;

  LabelAndCountView({
    super.key,
    required this.label,
    this.count,
  });

  @override
  Widget body(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "$label:",
            style:
                textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
          ),
        ),
        if (count.isNotNullOrEmpty)
          Text(
            "$count",
            style:
                textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
            textAlign: TextAlign.right,
          ),
      ],
    );
  }
}
