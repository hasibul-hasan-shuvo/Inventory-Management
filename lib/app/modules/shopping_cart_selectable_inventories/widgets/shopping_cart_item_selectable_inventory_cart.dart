import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/controllers/shopping_cart_selectable_inventories_controller.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/widgets/shopping_cart_selectable_inventory_edit_dialog_view.dart';
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
    return ElevatedContainer(
      height: AppValues.itemImageHeight.h,
      child: Ripple(
        onTap: () => _onTapEdit(context),
        child: Row(
          children: [
            _buildProductImage(),
            SizedBox(width: AppValues.smallMargin.w),
            _buildItemDetails(),
            SizedBox(width: AppValues.margin_10.w),
          ],
        ),
      ),
    ).marginOnly(bottom: AppValues.smallMargin.h);
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildInventoryName(),
          SizedBox(height: AppValues.margin_10.h),
          _buildIdAndCountView(),
        ],
      ),
    );
  }

  Widget _buildInventoryName() {
    return Text(
      inventoryData.name,
      style: textTheme.labelMedium,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildIdAndCountView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        Expanded(
          child: Column(
            children: [
              _buildLabelAndCount(
                appLocalization.inventory,
                inventoryData.available.toString(),
              ),
              _buildLabelAndCount(
                appLocalization.homeMenuShoppingCart,
                (inventoryData.connectedCartItem.isCartedItem()
                        ? inventoryData.connectedCartItem.quantity
                        : 0)
                    .toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIdView() {
    return Expanded(
      child: Text(
        "#${inventoryData.itemId}",
        style: textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
      ),
    );
  }

  Widget _buildLabelAndCount(String label, [String? count]) {
    return Row(
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
    );
  }

  void _onTapEdit(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    numberController.text = (inventoryData.connectedCartItem.isCartedItem()
            ? inventoryData.connectedCartItem.quantity
            : 0)
        .toString();

    showDialog(
      context: context,
      builder: (_) {
        return AppDialog(
          title: appLocalization.titleEditOrderDialog,
          content: ShoppingCartSelectableInventoryEditDialogView(
            data: inventoryData,
            numberController: numberController,
            suggestionLabel: appLocalization.homeMenuShoppingCart,
          ),
          positiveButtonText: appLocalization.buttonTextSaveChanges,
          onPositiveButtonTap: () {
            _controller.updateProductNumber(
              inventoryData,
              numberController.text,
            );
          },
        );
      },
    );
  }
}
