import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LabelAndCountView extends StatelessWidget with BaseWidgetMixin {
  final String label;
  final String? count;
  final bool spaceBetween;

  LabelAndCountView({
    super.key,
    required this.label,
    this.count,
    this.spaceBetween = false,
  });

  @override
  Widget body(BuildContext context) {
    return Row(
      children: [
        _getLabel(),
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

  Widget _getLabel() {
    return spaceBetween
        ? Expanded(child: _getLabelWithColon())
        : Flexible(child: _getLabelWithColon());
  }

  Widget _getLabelWithColon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            label,
            style:
                textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          count.isNotNullOrEmpty ? ": " : '',
          style:
              textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
        ),
      ],
    );
  }
}
