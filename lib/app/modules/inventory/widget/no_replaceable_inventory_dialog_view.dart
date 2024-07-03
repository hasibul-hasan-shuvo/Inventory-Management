import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class NoReplaceableInventoryDialogView extends StatelessWidget
    with BaseWidgetMixin {
  final InventoryUiModel data;

  NoReplaceableInventoryDialogView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getNotAvailableMessage(),
        SizedBox(height: AppValues.largeMargin.h),
        _getMessage(),
      ],
    );
  }

  Widget _getNotAvailableMessage() {
    return Text(
      appLocalization.messageUnavailableProduct(data.name),
      style: textTheme.bodyMedium,
    );
  }

  Widget _getMessage() {
    return Text(
      appLocalization.messageUnavailableInventory,
      style: textTheme.titleMedium,
    );
  }
}
