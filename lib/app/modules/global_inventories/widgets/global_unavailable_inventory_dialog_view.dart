import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/product/product_top_view.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_unavailable_product_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class GlobalUnavailableInventoryDialogView extends StatelessWidget
    with BaseWidgetMixin {
  final GlobalUnavailableProductUiModel data;

  GlobalUnavailableInventoryDialogView({
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
      appLocalization.messageUnavailableProduct(data.unavailableProductName),
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
      id: data.availableProduct.itemId,
      name: data.availableProduct.name,
      imageUrl: data.availableProduct.imageUrl,
    );
  }
}
