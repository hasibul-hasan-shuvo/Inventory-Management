import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/item_count/controllers/item_count_controller.dart';
import 'package:dental_inventory/app/modules/item_count/widgets/item_count_edit_dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemInventoryCountView extends StatelessWidget with BaseWidgetMixin {
  final ItemCountController _controller = Get.find();
  final InventoryCardUIModel data;

  ItemInventoryCountView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      height: AppValues.itemImageHeight.h,
      child: Ripple(
        onTap: _onTap,
        child: Row(
          children: [
            _getImageView(),
            SizedBox(width: AppValues.smallMargin.w),
            _getItemDetails(),
            _getEditButton(context),
          ],
        ),
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
          _getIdAndInventoryCountView(),
        ],
      ),
    );
  }

  Widget _getInventoryName() {
    return Text(
      data.name,
      style: textTheme.titleMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getIdAndInventoryCountView() {
    return Row(
      children: [
        _getIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.inventory,
          data.currentStock.toString(),
        ),
      ],
    );
  }

  Widget _getIdView() {
    return Expanded(
      child: Text(
        "#${data.itemId}",
        style: textTheme.bodySmall,
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

  Widget _getEditButton(BuildContext context) {
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
    _controller.incrementProductNumber(data);
  }

  void _onTapEdit(BuildContext context) {
    String currentStock = data.currentStock.toString();

    showDialog(
      context: context,
      builder: (_) {
        return AppDialog(
          title: appLocalization.titleEditOrderDialog,
          content: ItemCountEditDialogView(
            data: data,
            onCurrentStockChanged: (String newStock) {
              currentStock = newStock;
            },
          ),
          positiveButtonText: appLocalization.buttonTextSaveChanges,
          onPositiveButtonTap: () {
            _controller.onUpdateCurrentStock(data, currentStock);
          },
        );
      },
    );
  }
}
