import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/shopping_cart/widgets/item_shopping_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/shopping_cart_controller.dart';

// ignore: must_be_immutable
class ShoppingCartView extends BaseView<ShoppingCartController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuShoppingCart,
        actions: _getActions,
      );

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => PagingView(
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
    return FloatingActionButton(
      onPressed: _onPressedScanner,
      child: AssetImageView(
        fileName: AppIcons.barcodeScanner,
        height: AppValues.iconDefaultSize.h,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }

  Widget _getSuggestedOrdersListView() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: AppValues.padding.h,
        horizontal: AppValues.margin.w,
      ),
      itemCount: controller.shoppingCartItems.length,
      itemBuilder: _getItemBuilder,
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ItemShoppingCartView(data: controller.shoppingCartItems[index]);
  }

  void _onPressedScanner() {}

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
