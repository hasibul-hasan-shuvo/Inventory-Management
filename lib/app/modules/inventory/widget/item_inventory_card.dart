import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_name_view.dart';
import 'package:dental_inventory/app/modules/inventory/controllers/inventory_controller.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_icons.dart';
import '../../../core/widget/app_dialog.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../core/widget/network_image_view.dart';
import 'inventory_item_edit_dialog_view.dart';

// ignore: must_be_immutable
class ItemInventoryCard extends StatelessWidget with BaseWidgetMixin {
  final InventoryUIModel data;
  final InventoryController _controller = Get.find<InventoryController>();

  ItemInventoryCard({
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      child: Row(
        children: [
          _buildProductImage(),
          SizedBox(width: AppValues.margin_10.w),
          _buildQuantityRow(),
          SizedBox(width: AppValues.margin_10.w),
          _buildEditButton(
            onTap: () {
              _buildDialog(context);
            },
          )
        ],
      ),
    ).marginOnly(bottom: AppValues.smallMargin.h);
  }

  void _buildDialog(BuildContext context) {
    TextEditingController minController = TextEditingController();
    TextEditingController maxController = TextEditingController();
    TextEditingController fixedSuggestionController = TextEditingController();
    TextEditingController stockCountController = TextEditingController();

    minController.text = data.min.toString();
    maxController.text = data.max.toString();
    fixedSuggestionController.text = data.fixedOrderSuggestions.toString();
    stockCountController.text = data.currentStock.toString();

    showDialog(
      context: context,
      builder: (_) => AppDialog(
        title: appLocalization.editProduct,
        content: InventoryItemEditDialogView(
          inventoryData: data,
          minController: minController,
          maxController: maxController,
          fixedSuggestionController: fixedSuggestionController,
          stockCountController: stockCountController,
        ),
        negativeButtonIcon: Icons.delete_outline,
        negativeButtonText: appLocalization.deleteProduct,
        positiveButtonText: appLocalization.updateProduct,
        willPopOnNegativeButtonTap: false,
        onPositiveButtonTap: () {
          _controller.updateInventoryData(
            data: data,
            minCount: minController.text,
            maxCount: maxController.text,
            fixedSuggestion: fixedSuggestionController.text,
            stockCount: stockCountController.text,
          );
        },
        onNegativeButtonTap: () {
          Get.back();
          _onDeleteProductTap(context);
        },
      ),
    );
  }

  Widget _buildProductImage() {
    return NetworkImageView(
      imageUrl: data.imageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
      fit: BoxFit.cover,
    );
  }

  Widget _buildEditButton({required VoidCallback onTap}) {
    return IconButton(
      onPressed: onTap,
      icon: AssetImageView(
        fileName: AppIcons.edit,
        height: AppValues.iconDefaultSize.h,
        width: AppValues.iconDefaultSize.w,
        color: theme.iconTheme.color,
      ),
    );
  }

  Widget _buildQuantityRow() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductNameView(name: data.name),
          SizedBox(height: AppValues.margin_10.h),
          Row(
            children: [
              Expanded(
                child: LabelAndCountView(
                  label: appLocalization.available,
                  count: data.currentStock.toString(),
                ),
              ),
              SizedBox(width: AppValues.margin_10.w),
              Expanded(
                child: LabelAndCountView(
                  label:
                      "${appLocalization.max}: ${data.max} ${appLocalization.min}: ${data.min}",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onDeleteProductTap(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: appLocalization.titleDeleteInventory,
        message: appLocalization.messageDeleteInventory,
        isCancelable: false,
        negativeButtonText: appLocalization.no,
        positiveButtonText: appLocalization.yes,
        onPositiveButtonTap: _onConfirmDelete,
      ),
    );
  }

  void _onConfirmDelete() {
    _controller.deleteInventoryItem(data);
  }
}
