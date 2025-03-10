import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_id_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_name_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/shopping_cart/controllers/shopping_cart_controller.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:dental_inventory/app/modules/suggested_orders/widgets/inventory_order_edit_dialog_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemShoppingCartView extends StatelessWidget with BaseWidgetMixin {
  final ShoppingCartController _controller = Get.find();
  final ShoppingCartUiModel data;
  final Function(ShoppingCartUiModel) onTapShowPrice;

  ItemShoppingCartView({
    super.key,
    required this.data,
    required this.onTapShowPrice,

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
        child: Row(
          children: [
            _getImageView(),
            SizedBox(width: AppValues.smallMargin.w),
            _getItemDetails(),
            _getEditButton(context),
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
          _getInventoryName(),
          SizedBox(height: AppValues.margin_4.h),
          _getIdAndCountView(),
          _getPriceAndCartCountView(),
        ],
      ),
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
        Expanded(flex: 1,child: _getPriceView()),
        Expanded(
          flex: 1,
          child: _getLabelAndCount(
            appLocalization.homeMenuShoppingCart,
            data.cartCount.toString(),
          ),
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
    return Row(
      children: [
        Text(
          "${appLocalization.currency}. ",
          style: textTheme.bodySmall,
        ),
        Obx(
              () => data.isPriceAvailable
              ? Text(
            data.price.toString(),
            style: textTheme.bodySmall,
          )
              : _getUnavailablePriceView(),
        ),
      ],
    );
  }

  Widget _getUnavailablePriceView() {
    return Obx(
          () => data.isPriceFetching
          ? _getPriceFetchingLoaderView()
          : _getFetchPriceButtonView(),
    );
  }

  Widget _getPriceFetchingLoaderView() {
    return Row(
      children: [
        SizedBox(
          height: AppValues.iconSize_14,
          width: AppValues.iconSize_14,
          child: CircularProgressIndicator(
            strokeWidth: AppValues.priceFetchingLoaderStrokeSize.r,
          ),
        ),
      ],
    );
  }

  Widget _getFetchPriceButtonView() {
    return Ripple(
      onTap: () {
        data.changePriceStateToLoad();
        onTapShowPrice(data);
      },
      child: Text(
        appLocalization.getPrice,
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


  void _onTapEdit(BuildContext context) {
    TextEditingController cartController = TextEditingController();
    cartController.text = data.cartCount.toString();

    showDialog(
      context: context,
      builder: (_) {
        return AppDialog(
          title: appLocalization.titleEditOrderDialog,
          content: InventoryOrderEditDialogContentView(
            numberController: cartController,
            id: data.itemId,
            name: data.name,
            imageUrl: data.imageUrl,
            count: data.count,
            suggestionLabel: appLocalization.homeMenuShoppingCart,
            suggestion: data.cartCount,
            price: data.priceWithTax,
          ),
          positiveButtonText: appLocalization.buttonTextSaveChanges,
          onPositiveButtonTap: () {
            _controller.updateCartCount(
              data,
              cartController.text,
            );
          },
        );
      },
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
