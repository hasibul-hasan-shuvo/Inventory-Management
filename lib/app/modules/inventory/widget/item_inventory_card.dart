import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/modules/inventory/controllers/inventory_controller.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_icons.dart';
import '../../../core/widget/app_dialog.dart';
import '../../../core/widget/asset_image_view.dart';
import '../../../core/widget/network_image_view.dart';
import 'dialog_content.dart';

// ignore: must_be_immutable
class ItemInventoryCard extends StatelessWidget with BaseWidgetMixin {
  final InventoryCardUIModel inventoryData;
  final InventoryController _controller = Get.find<InventoryController>();

  ItemInventoryCard({required this.inventoryData});

  @override
  Widget body(BuildContext context) {
    return Card(
      elevation: AppValues.extraSmallElevation,
      child: Padding(
        padding: EdgeInsets.all(AppValues.halfPadding.sp),
        child: Row(
          children: [
            _buildProductImage(),
            SizedBox(width: AppValues.margin_10.w),
            _buildQuantityRow(),
            SizedBox(width: AppValues.margin_10.w),
            _buildEditButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => _buildDialog(context),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    return AppDialog(
      title: appLocalization.editProduct,
      content: DialogContent(inventoryData: inventoryData),
      negativeButtonIcon: Icons.delete_outline,
      negativeButtonText: appLocalization.deleteProduct,
      positiveButtonText: appLocalization.updateProduct,
      onPositiveButtonTap: () {
        _controller.updateInventoryData();
      },
    );
  }

  Widget _buildProductImage() {
    return NetworkImageView(
      imageUrl: inventoryData.productImageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
    );
  }

  Widget _buildEditButton({required VoidCallback onTap}) {
    return IconButton(
      onPressed: onTap,
      icon: AssetImageView(
        fileName: AppIcons.edit,
        height: AppValues.iconDefaultSize.h,
        width: AppValues.iconDefaultSize.w,
      ),
    );
  }

  Widget _buildQuantityRow() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            inventoryData.productName,
            style: textTheme.titleMedium,
          ),
          SizedBox(height: AppValues.margin_10.h),
          Row(
            children: [
              Expanded(
                child: Text(
                    "${appLocalization.available}: ${inventoryData.currentStock}"),
              ),
              SizedBox(width: AppValues.margin_10.w),
              Expanded(
                child: Text(
                  "${appLocalization.max}: ${inventoryData.maxTreshold} ${appLocalization.min}: ${inventoryData.minTreshold}",
                  style: textTheme.bodySmall,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
