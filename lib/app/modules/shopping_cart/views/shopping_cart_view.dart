import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/barcode_scanner_floating_button.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart/widgets/item_shopping_cart_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/shopping_cart_controller.dart';

// ignore: must_be_immutable
class ShoppingCartView extends BaseView<ShoppingCartController> {
  ShoppingCartView() {
    ZebraScanner().addScannerDelegate(controller.onScanned);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuShoppingCart,
        actions: _getActions,
      );

  @override
  Widget body(BuildContext context) {
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

  List<Widget> get _getActions {
    return [
      IconButton(
        onPressed: controller.orderAll,
        icon: const Icon(
          Icons.done,
        ),
      )
    ];
  }
}
