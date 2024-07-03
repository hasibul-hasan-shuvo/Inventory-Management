import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/modules/inventory/model/replaceable_inventory_ui_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReplaceableInventoryDialogView extends StatelessWidget
    with BaseWidgetMixin {
  final ReplaceableInventoryUiModel data;

  ReplaceableInventoryDialogView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return Container();
  }
}
