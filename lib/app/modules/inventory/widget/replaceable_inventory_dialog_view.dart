import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/product/product_top_view.dart';
import 'package:dental_inventory/app/modules/inventory/model/replaceable_inventory_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _getNotAvailableMessage(),
        SizedBox(height: AppValues.largeMargin.h),
        _getRecommendationMessage(),
        _getProductView(),
      ],
    );
  }

  Widget _getNotAvailableMessage() {
    return Text(
      appLocalization.messageUnavailableProduct(data.unavailableInventory.name),
      style: textTheme.bodyMedium,
    );
  }

  Widget _getRecommendationMessage() {
    return Text(
      appLocalization.messageUnavailableProductRecommendation,
      style: textTheme.titleMedium,
    );
  }

  Widget _getProductView() {
    return ProductTopView(
      id: data.availableInventory.itemId,
      name: data.availableInventory.name,
      imageUrl: data.availableInventory.imageUrl,
    );
  }
}
