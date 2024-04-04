import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/barcode_scanner_floating_button.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart/widgets/item_shopping_cart_view.dart';
import 'package:dental_inventory/app/modules/suggested_orders/widgets/inventory_order_edit_dialog_content_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/shopping_cart_controller.dart';

// ignore: must_be_immutable
class ShoppingCartView extends BaseView<ShoppingCartController> {
  late BuildContext _context;

  ShoppingCartView() {
    ZebraScanner().addScannerDelegate(controller.onScanned);
    _subscribeNewCartItemArrivedController();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuShoppingCart,
        actions: _getActions(context),
      );

  @override
  Widget body(BuildContext context) {
    _context = context;

    return Obx(
      () => controller.isPageLoading && controller.shoppingCartItems.isEmpty
          ? const SizedBox.shrink()
          : controller.shoppingCartItems.isEmpty
              ? _getPlaceHolder()
              : PagingView(
                  controller: controller.refreshController,
                  enablePullDown: false,
                  enablePullUp: controller.pagingController.canLoadNextPage(),
                  onLoading: controller.onLoading,
                  child: _getSuggestedOrdersListView(),
                ),
    );
  }

  @override
  Widget? floatingActionButton() {
    return BarcodeScannerFloatingButton(
      onPressed: _onPressedScanner,
    );
  }

  Widget _getPlaceHolder() {
    return EmptyListPlaceHolder(
      message: appLocalization.placeHolderEmptyShoppingCart,
    );
  }

  Widget _getSuggestedOrdersListView() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: AppValues.padding.h,
        bottom: AppValues.extraLargeSpacing.h,
        left: AppValues.padding.w,
        right: AppValues.padding.w,
      ),
      itemCount: controller.shoppingCartItems.length,
      itemBuilder: _getItemBuilder,
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ItemShoppingCartView(data: controller.shoppingCartItems[index]);
  }

  void _onPressedScanner() {
    Get.toNamed(
      Routes.SCANNER,
    )?.then((code) {
      controller.onScanned(code);
    });
  }

  List<Widget> _getActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => _onConfirmOrder(context),
        icon: const Icon(
          Icons.done,
        ),
      )
    ];
  }

  void _onConfirmOrder(BuildContext context) {
    if (controller.shoppingCartItems.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AppDialog(
          title: appLocalization.titleConfirmOrder,
          message: appLocalization.messageConfirmOrder,
          isCancelable: false,
          negativeButtonText: appLocalization.no,
          positiveButtonText: appLocalization.yes,
          onPositiveButtonTap: _onConfirmOrderTap,
        ),
      );
    } else {
      controller.showErrorMessage(appLocalization.placeHolderEmptyShoppingCart);
    }
  }

  void _onConfirmOrderTap() {
    controller.confirmOrder();
  }

  void _subscribeNewCartItemArrivedController() {
    controller.newCartItemArrivedController.listen((cartItem) {
      if (cartItem != null) {
        _showNewCartItemEditDialog(cartItem);
        controller.clearNewCartArrivedController();
      }
    });
  }

  void _showNewCartItemEditDialog(ShoppingCartUiModel data) {
    int cartCount = data.cartCount;

    showDialog(
      context: _context,
      builder: (_) {
        return AppDialog(
          title: appLocalization.titleEditOrderDialog,
          content: InventoryOrderEditDialogContentView(
            id: data.itemId,
            name: data.name,
            imageUrl: data.imageUrl,
            count: data.count,
            suggestion: data.cartCount,
            price: data.price,
            onSuggestionValueChange: (int value) {
              cartCount = value;
            },
          ),
          positiveButtonText: appLocalization.buttonTextSaveChanges,
          onPositiveButtonTap: () {
            controller.updateCartCount(data, cartCount);
          },
        );
      },
    );
  }
}
