import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_id_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_name_view.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemFixedSuggestionInCartView extends StatelessWidget
    with BaseWidgetMixin {
  final SuggestedOrderUiModel data;

  ItemFixedSuggestionInCartView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      height: AppValues.itemImageHeight.h,
      bgColor: appColors.bgDismissibleItem.withAlpha(80),
      child: Row(
        children: [
          _getImageView(),
          SizedBox(width: AppValues.smallMargin.w),
          _getItemDetails(),
        ],
      ),
    ).marginOnly(bottom: AppValues.margin_6.h);
  }

  Widget _getImageView() {
    return NetworkImageView(
      imageUrl: data.imageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
      fit: BoxFit.cover,
    );
  }

  Widget _getItemDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getInventoryName(),
          SizedBox(height: AppValues.margin_4.h),
          _getIdAndCountView(),
          _getMaxMinAndFixedSuggestionView(),
        ],
      ),
    );
  }

  Widget _getInventoryName() {
    return ProductNameView(name: data.name);
  }

  Widget _getIdAndCountView() {
    return Row(
      children: [
        _getIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.inventory,
          data.count.toString(),
        ),
      ],
    );
  }

  Widget _getMaxMinAndFixedSuggestionView() {
    return Row(
      children: [
        _getLabelAndCount(
          appLocalization.labelMinMax,
          "${data.min}/${data.max}",
        ),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.labelSuggestion,
          data.fixedSuggestion.toString(),
        ),
      ],
    );
  }

  Widget _getIdView() {
    return Expanded(
      child: ProductIdView(
        id: data.itemId,
      ),
    );
  }

  Widget _getLabelAndCount(String label, [String? count]) {
    return Expanded(
      child: LabelAndCountView(
        label: label,
        count: count,
      ),
    );
  }
}
