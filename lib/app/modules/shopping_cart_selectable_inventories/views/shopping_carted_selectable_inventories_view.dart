import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/controllers/shopping_cart_selectable_inventories_controller.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/widgets/shopping_cart_item_selectable_inventory_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShoppingCartSelectableInventoriesView
    extends BaseView<ShoppingCartSelectableInventoriesController> {
  ShoppingCartSelectableInventoriesView();

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Obx(
        () => _buildAppBar(context),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () {
        return controller.isPageLoading && controller.inventoryItems.isEmpty
            ? const SizedBox.shrink()
            : controller.inventoryItems.isEmpty
                ? _getPlaceHolder()
                : _buildListOfProduct();
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SearchAbleAppBar(
      isSearchableMode: controller.isSearchable,
      title: '${controller.pageArguments.title} - ${appLocalization.inventory}',
      onChangeSearchMode: controller.changeSearchMode,
      updateSearchQuery: (value) {
        controller.updateSearchQuery(value);
      },
    );
  }

  Widget _getPlaceHolder() {
    return EmptyListPlaceHolder(
      message: appLocalization.placeHolderEmptyInventory,
    );
  }

  Widget _buildListOfProduct() {
    return PagingView(
      controller: controller.refreshController,
      enablePullDown: false,
      enablePullUp: controller.pagingController.canLoadNextPage(),
      onLoading: controller.onLoading,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: AppValues.padding.h,
          horizontal: AppValues.padding.w,
        ),
        shrinkWrap: true,
        itemCount: controller.inventoryItems.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildInventoryCard(
            controller.inventoryItems[index],
          );
        },
      ),
    );
  }

  Widget _buildInventoryCard(SelectableInventoryItemUiModel inventoryData) =>
      ShoppingCartItemSelectableInventoryCard(
        inventoryData: inventoryData,
      );
}
