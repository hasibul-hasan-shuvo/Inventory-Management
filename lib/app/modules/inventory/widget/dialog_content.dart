import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/app_values.dart';

// ignore: must_be_immutable
class DialogContent extends StatelessWidget with BaseWidgetMixin {
  InventoryCardUIModel inventoryData;

  DialogContent({required this.inventoryData});

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _buildProductImageWithTitle(inventoryData),
        const SizedBox(
          height: AppValues.margin_10,
        ),
        _buildQuantityStatus(inventoryData),
      ]),
    );
  }

  Row _buildProductImageWithTitle(InventoryCardUIModel inventoryData) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: NetworkImageView(imageUrl: inventoryData.productImageUrl)),
        const SizedBox(
          width: AppValues.margin_10,
        ),
        Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  inventoryData.productName,
                  style: textTheme.titleMedium,
                ),
                Text(
                  "#${inventoryData.productCode}",
                  style: textTheme.bodyMedium,
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildQuantityStatus(InventoryCardUIModel inventoryData) {
    return Container(
      height: AppValues.space_110,
      decoration: BoxDecoration(
        color: theme.colorScheme.background.withOpacity(AppValues.smallOpacity),
        borderRadius: BorderRadius.circular(AppValues.halfPadding.sp),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                _buildMaxMinEditor(
                    inventoryData.maxTreshold, inventoryData.minTreshold),
                Container(
                  height: AppValues.space_110,
                  width: AppValues.dividerWidth.w,
                  color: theme.dividerColor,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: _buildCurrentAndSuggestionEditor(
                inventoryData.fixedOrderSuggestions,
                inventoryData.currentStock),
          ),
        ],
      ),
    );
  }

  Padding _buildCurrentAndSuggestionEditor(
      String fixedProposal, String inventory) {
    return Padding(
      padding: EdgeInsets.all(AppValues.halfPadding.sp),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWithTitle(
              title: appLocalization.fixedProposal,
              initialValue: fixedProposal,
              onChanged: (value) {}),
          const SizedBox(
            height: AppValues.margin_10,
          ),
          TextFieldWithTitle(
              title: appLocalization.inventory,
              initialValue: inventory,
              onChanged: (value) {}),
        ],
      ),
    );
  }

  Padding _buildMaxMinEditor(String max, String min) {
    return Padding(
      padding: EdgeInsets.all(AppValues.halfPadding.sp),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldWithTitle(
            title: appLocalization.min,
            initialValue: max,
            onChanged: (value) {},
          ),
          const SizedBox(
            height: AppValues.margin_10,
          ),
          TextFieldWithTitle(
            title: appLocalization.max,
            initialValue: min,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
