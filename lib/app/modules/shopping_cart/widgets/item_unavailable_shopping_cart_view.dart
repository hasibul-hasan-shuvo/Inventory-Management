import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_id_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_name_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/shopping_cart/controllers/shopping_cart_controller.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemUnavailableShoppingCartView extends StatelessWidget
    with BaseWidgetMixin {
  final ShoppingCartController _controller = Get.find();
  final ShoppingCartUiModel data;

  ItemUnavailableShoppingCartView({
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
        height: AppValues.itemImageHeight.h,
        child: Container(
          color: Colors.amber.withOpacity(0.2),
          child: Row(
            children: [
              _getImageView(),
              SizedBox(width: AppValues.smallMargin.w),
              _getItemDetails(),
              _getUnavailableTag(),
              SizedBox(width: AppValues.margin_10.w),
            ],
          ),
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
          _getIdAndCountView(),
          _getPriceAndCartCountView(),
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
    return ProductNameView(
      name: data.name,
      maxLines: 2,
    );
  }

  Widget _getIdAndCountView() {
    return Row(
      children: [
        _getIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.inventory,
          data.count.toString(),
        ),
      ],
    );
  }

  Widget _getPriceAndCartCountView() {
    return Row(
      children: [
        _getPriceView(),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.homeMenuShoppingCart,
          data.cartCount.toString(),
        ),
      ],
    );
  }

  Widget _getIdView() {
    return Expanded(
      child: ProductIdView(
        id: data.itemId,
      ),
    );
  }

  Widget _getPriceView() {
    return Expanded(
      child: LabelAndCountView(
        label: _getPrice(),
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

  Widget _getUnavailableTag() {
    return Ripple(
      onTap: () => _controller.deleteCartItem(data),
      child: ElevatedContainer(
        borderRadius: AppValues.radius_6.r,
        bgColor: theme.primaryColor,
        width: AppValues.iconSize_40.w,
        child: Text(
          appLocalization.removeItem,
          style: textTheme.bodySmall?.copyWith(
            fontSize: FontSize.extraSmall.sp,
            color: appColors.colorWhite,
          ),
          textAlign: TextAlign.center,
        ).paddingAll(AppValues.extraSmallPadding.r),
      ),
    );
  }

  String _getPrice() {
    return "${appLocalization.currency}. "
        "${(data.cartCount * data.priceWithTax).toStringAsFixed(2)}";
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

  Future<bool> _onDismissed(DismissDirection direction) {
    if (direction == DismissDirection.endToStart) {
      return _handleDeleteItem();
    }

    return Future.value(false);
  }

  Future<bool> _handleDeleteItem() {
    return _controller.deleteCartItem(data);
  }
}
