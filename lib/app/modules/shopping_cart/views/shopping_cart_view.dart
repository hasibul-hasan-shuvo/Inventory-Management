import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/custom_floating_button.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart/widgets/item_shopping_cart_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart/widgets/item_unavailable_shopping_cart_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart/widgets/shopping_cart_total_price_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/model/shopping_cart_selectable_inventory_page_arguments.dart';
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
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ShoppingCartTotalPriceView(),
                    Expanded(
                      child: PagingView(
                        controller: controller.refreshController,
                        enablePullUp:
                            controller.pagingController.canLoadNextPage(),
                        onRefresh: controller.onRefresh,
                        onLoading: controller.onLoading,
                        child: _getSuggestedOrdersListView(),
                      ),
                    ),
                  ],
                ),
    );
  }

  @override
  Widget? floatingActionButton() {
    return CustomFloatingButton(
      onPressedScanner: _onPressedScanner,
      onPressedList: _onPressedList,
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
    return controller.shoppingCartItems[index].isAvailable
        ? ItemShoppingCartView(data: controller.shoppingCartItems[index])
        : ItemUnavailableShoppingCartView(
            data: controller.shoppingCartItems[index]);
  }

  void _onPressedScanner() {
    Get.toNamed(
      Routes.SCANNER,
    )?.then((code) {
      controller.onScanned(code);
    });
  }

  void _onPressedList() {
    ShoppingCartSelectableInventoryPageArguments pageArguments =
        ShoppingCartSelectableInventoryPageArguments(
            controller: controller,
            title: appLocalization.homeMenuShoppingCart,
            isIncludeCountInCart: true);
    Get.toNamed(
      Routes.SHOPPING_CART_SELECTABLE_INVENTORIES,
      arguments: pageArguments,
    );
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
    TextEditingController cartController = TextEditingController();

    cartController.text = data.cartCount.toString();

    showDialog(
      context: _context,
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
            price: data.price,
          ),
          positiveButtonText: appLocalization.buttonTextSaveChanges,
          onPositiveButtonTap: () {
            controller.updateCartCount(
              data,
              cartController.text,
            );
          },
        );
      },
    );
  }
}
