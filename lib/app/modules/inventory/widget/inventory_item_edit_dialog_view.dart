import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product_top_view.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/app_values.dart';

// ignore: must_be_immutable
class InventoryItemEditDialogView extends StatelessWidget with BaseWidgetMixin {
  InventoryCardUIModel inventoryData;
  final TextEditingController minController;
  final TextEditingController maxController;
  final TextEditingController fixedSuggestionController;
  final TextEditingController stockCountController;

  InventoryItemEditDialogView({
    required this.inventoryData,
    required this.minController,
    required this.maxController,
    required this.fixedSuggestionController,
    required this.stockCountController,
  });

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProductTopView(),
          SizedBox(height: AppValues.margin_10.h),
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
    return ElevatedContainer(
      height: AppValues.space_110.h,
      bgColor: theme.colorScheme.background,
      borderRadius: AppValues.radius_6.r,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMaxMinEditor(),
          _buildCurrentAndSuggestionEditor(),
        ],
      ),
    );
  }

  Widget _buildCurrentAndSuggestionEditor() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(AppValues.halfPadding.sp),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFieldWithTitle(
                controller: fixedSuggestionController,
                title: appLocalization.fixedProposal,
              ),
            ),
            SizedBox(height: AppValues.margin_10.h),
            Expanded(
              child: TextFieldWithTitle(
                controller: stockCountController,
                title: appLocalization.inventory,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaxMinEditor() {
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
                Expanded(
                  child: TextFieldWithTitle(
                    controller: minController,
                    title: appLocalization.min,
                  ),
                ),
                SizedBox(height: AppValues.margin_10.h),
                Expanded(
                  child: TextFieldWithTitle(
                    controller: maxController,
                    title: appLocalization.max,
                  ),
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
