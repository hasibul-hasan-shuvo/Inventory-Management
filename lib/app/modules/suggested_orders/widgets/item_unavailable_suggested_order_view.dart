import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_name_view.dart';
import 'package:dental_inventory/app/modules/suggested_orders/controllers/suggested_orders_controller.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemUnavailableSuggestedOrderView extends StatelessWidget
    with BaseWidgetMixin {
  final SuggestedOrdersController _controller = Get.find();
  final SuggestedOrderUiModel data;

  ItemUnavailableSuggestedOrderView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return Dismissible(
      key: ValueKey(data.id),
      direction: DismissDirection.endToStart,
      background: _getDeleteItemBackground(),
      confirmDismiss: (direction) => _onDismissed(direction),
      child: ElevatedContainer(
        bgColor: Colors.amber.withOpacity(0.2),
        height: AppValues.itemImageHeight.h,
        child: Row(
          children: [
            _getImageView(),
            SizedBox(width: AppValues.smallMargin.w),
            _getItemDetails(),
          ],
        ),
      ).marginOnly(bottom: AppValues.margin_6.h),
    );
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
          _getWarningMessage(),
          SizedBox(height: AppValues.margin_4.h),
          _getInventoryName(),
          SizedBox(height: AppValues.margin_4.h),
          _getCountAndMinMaxView(),
        ],
      ),
    );
  }

  Widget _getWarningMessage() {
    return Text(
      appLocalization.messageUnavailableShoppingCartProductWarning,
      style: textTheme.bodySmall?.copyWith(
        fontSize: FontSize.small.sp,
        color: appColors.errorColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getInventoryName() {
    return ProductNameView(name: data.name);
  }

  Widget _getCountAndMinMaxView() {
    return Row(
      children: [
        Expanded(
          child: LabelAndCountView(
            label: appLocalization.available,
            count: data.count.toString(),
          ),
        ),
        SizedBox(width: AppValues.margin_10.w),
        Expanded(
          child: LabelAndCountView(
            label: appLocalization.inventoryMaxMin(data.min, data.max),
          ),
        ),
      ],
    );
  }

  Widget _getDeleteItemBackground() {
    return ElevatedContainer(
      bgColor: appColors.colorRed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete_outline,
            size: AppValues.iconDefaultSize.r,
            color: appColors.colorWhite,
          ).paddingSymmetric(
            vertical: AppValues.padding.h,
            horizontal: AppValues.padding.w,
          ),
        ],
      ),
    ).marginOnly(bottom: AppValues.margin_6.h);
  }

  Future<bool> _onDismissed(DismissDirection direction) async {
    if (direction == DismissDirection.endToStart) {
      return await _handleDeleteItem();
    }

    return false;
  }

  Future<bool> _handleDeleteItem() async {
    return _controller.removeItemTemporarily(data);
  }
}
