import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/controllers/shopping_cart_selectable_inventories_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShoppingCartItemSelectableInventoryCard extends StatelessWidget
    with BaseWidgetMixin {
  final SelectableInventoryItemUiModel inventoryData;

  final ShoppingCartSelectableInventoriesController _controller =
      Get.find<ShoppingCartSelectableInventoriesController>();

  ShoppingCartItemSelectableInventoryCard({
    super.key,
    required this.inventoryData,
  });

  @override
  Widget body(BuildContext context) {
    return Ripple(
      onTap: () => _onTapEdit(context),
      //     () {
      //   _controller.addCartItem(inventoryData.itemId);
      //
      // },
      child: ElevatedContainer(
        child: Row(
          children: [
            _buildProductImage(),
            SizedBox(width: AppValues.smallMargin.w),
            _buildItemDetails(),
            SizedBox(width: AppValues.margin_10.w),
            // _buildEditButton(context)
          ],
        ),
      ).marginOnly(bottom: AppValues.smallMargin.h),
    );
  }

  Widget _buildProductImage() {
    return NetworkImageView(
      imageUrl: inventoryData.imageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
      fit: BoxFit.cover,
    );
  }

  Widget _buildItemDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInventoryName(),
          _buildIdAndInventoryCountView(),
        ],
      ),
    );
  }

  Widget _buildInventoryName() {
    return Text(
      inventoryData.name,
      style: textTheme.titleMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildIdAndInventoryCountView() {
    return Row(
      children: [
        _buildIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        // _buildLabelAndCount(
        //   appLocalization.number,
        //   inventoryData.number.toString(),
        // ),
      ],
    ).marginOnly(right: AppValues.margin.w);
  }

  Widget _buildIdView() {
    return Expanded(
      child: Text(
        "#${inventoryData.itemId}",
        style: textTheme.bodySmall,
      ),
    );
  }

  Widget _buildLabelAndCount(String label, [String? count]) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label:",
              style: textTheme.bodySmall,
            ),
          ),
          if (count.isNotNullOrEmpty)
            Text(
              "$count",
              style: textTheme.bodySmall,
              textAlign: TextAlign.right,
            ),
        ],
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return Ripple(
      onTap: () => _onTapEdit(context),
      child: AssetImageView(
        fileName: AppIcons.edit,
        height: AppValues.iconDefaultSize.h,
        width: AppValues.iconDefaultSize.w,
        color: theme.iconTheme.color,
      ).paddingSymmetric(
        horizontal: AppValues.padding.w,
        vertical: AppValues.padding.h,
      ),
    );
  }

  void _onTapEdit(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    numberController.text = inventoryData.number.toString();

    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     return AppDialog(
    //       title: appLocalization.titleEditOrderDialog,
    //       content: SelectableInventoryItemEditDialogView(
    //         inventoryData: inventoryData,
    //         controller: numberController,
    //       ),
    //       positiveButtonText: appLocalization.buttonTextSaveChanges,
    //       onPositiveButtonTap: () {
    //         _controller.updateProductNumber(
    //           inventoryData,
    //           numberController.text,
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
