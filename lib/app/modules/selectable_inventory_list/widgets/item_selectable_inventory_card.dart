import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/item_count/controllers/item_count_controller.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/controllers/selectable_inventory_list_controller.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/widgets/selectable_inventory_edit_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemSelectableInventoryCard extends StatelessWidget with BaseWidgetMixin {
  final SelectableInventoryItemUiModel inventoryData;

  final SelectableInventoryListController _controller =
      Get.find<SelectableInventoryListController>();

  ItemSelectableInventoryCard({
    super.key,
    required this.inventoryData,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      height: AppValues.itemImageHeight.h,
      child: Ripple(
        onTap: _onTap,
        child: Row(
          children: [
            _buildProductImage(),
            SizedBox(width: AppValues.smallMargin.w),
            _buildItemDetails(),
            SizedBox(width: AppValues.margin_10.w),
            _buildEditButton(context)
          ],
        ),
      ),
    ).marginOnly(bottom: AppValues.margin_6.h);
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInventoryName(),
          SizedBox(height: AppValues.margin_10.h),
          _buildIdAndInventoryCountView(),
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

  Widget _buildIdAndInventoryCountView() {
    return Row(
      children: [
        _buildIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        _buildLabelAndCount(
          appLocalization.number,
          inventoryData.number.toString(),
        ),
      ],
    ).marginOnly(right: AppValues.margin.w);
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

  void _onTap() {
    _controller.updateProductNumber(
      inventoryData,
      _getNumber(1),
    );
  }

  void _onTapEdit(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    numberController.text = _getNumber();

    showDialog(
      context: context,
      builder: (_) {
        return AppDialog(
          title: appLocalization.titleEditOrderDialog,
          content: SelectableInventoryItemEditDialogView(
            inventoryData: inventoryData,
            controller: numberController,
            minAvailableQuantity: _controller.pageArguments.minAvailableProduct,
            isInventoryCountController:
                _controller.pageArguments.controller is ItemCountController,
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

  String _getNumber([int additional = 0]) {
    return _controller.pageArguments.controller is ItemCountController &&
            inventoryData.number == 0
        ? (inventoryData.available == 0
                ? inventoryData.available + 1
                : inventoryData.available)
            .toString()
        : (inventoryData.number + additional).toString();
  }
}
