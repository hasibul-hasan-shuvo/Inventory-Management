import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/widget/product_top_view.dart';
import 'package:dental_inventory/app/modules/inventory/controllers/inventory_controller.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_values.dart';

// ignore: must_be_immutable
class InventoryItemEditDialogView extends StatelessWidget with BaseWidgetMixin {
  InventoryCardUIModel inventoryData;

  final InventoryController _controller = Get.find<InventoryController>();

  InventoryItemEditDialogView({required this.inventoryData}) {
    _controller.id = inventoryData.id.toString();
    _controller.productID = inventoryData.itemId;
    _controller.maxCount = inventoryData.max.toString();
    _controller.minCount = inventoryData.min.toString();
    _controller.stockCount = inventoryData.currentStock.toString();
    _controller.fixedSuggestion =
        inventoryData.fixedOrderSuggestions.toString();
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProductTopView(),
          SizedBox(
            height: AppValues.margin_10.h,
          ),
          _buildQuantityStatus(),
        ],
      ),
    );
  }

  Widget _buildProductTopView() {
    return ProductTopView(
      id: inventoryData.itemId,
      name: inventoryData.name,
      imageUrl: inventoryData.imageUrl,
    );
  }

  Widget _buildQuantityStatus() {
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
          _buildMaxMinEditor(
            inventoryData.max.toString(),
            inventoryData.min.toString(),
          ),
          _buildCurrentAndSuggestionEditor(
            inventoryData.fixedOrderSuggestions.toString(),
            inventoryData.currentStock.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentAndSuggestionEditor(
      String fixedProposal, String inventory) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(AppValues.halfPadding.sp),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithTitle(
              title: appLocalization.fixedProposal,
              initialValue: fixedProposal,
              onChanged: (value) {
                _controller.fixedSuggestion = value;
              },
            ),
            SizedBox(height: AppValues.margin_10.h),
            TextFieldWithTitle(
              title: appLocalization.inventory,
              initialValue: inventory,
              onChanged: (value) {
                _controller.stockCount = value;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaxMinEditor(String max, String min) {
    return Expanded(
      flex: 3,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(AppValues.halfPadding.sp),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldWithTitle(
                  title: appLocalization.min,
                  initialValue: min,
                  onChanged: (value) {
                    _controller.minCount = value;
                  },
                ),
                SizedBox(height: AppValues.margin_10.h),
                TextFieldWithTitle(
                  title: appLocalization.max,
                  initialValue: max,
                  onChanged: (value) {
                    _controller.maxCount = value;
                  },
                ),
              ],
            ),
          ),
          Container(
            height: AppValues.space_110,
            width: AppValues.dividerWidth.w,
            color: theme.dividerColor,
          ),
        ],
      ),
    );
  }
}
