import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductNameView extends StatelessWidget with BaseWidgetMixin {
  final String name;
  final int maxLines;

  ProductNameView({
    super.key,
    required this.name,
    this.maxLines = 3,
  });

  @override
  Widget body(BuildContext context) {
    return Text(
      name,
      style: textTheme.labelMedium,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
