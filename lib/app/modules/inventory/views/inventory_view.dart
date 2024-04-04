import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/item_inventory_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/inventory_controller.dart';

// ignore: must_be_immutable
class InventoryView extends BaseView<InventoryController> {
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
    return Obx(() {
      return controller.isPageLoading && controller.inventoryItems.isEmpty
          ? const SizedBox.shrink()
          : controller.inventoryItems.isEmpty
              ? _getPlaceHolder()
              : _buildListOfProduct();
    });
  }

  Widget _buildAppBar(BuildContext context) {
    return SearchAbleAppBar(
      isSearchableMode: controller.isSearchable,
      title: appLocalization.homeMenuInventory,
      onChangeSearchMode: controller.changeSearchMode,
      updateSearchQuery: (value) {
        controller.updateSearchQuery(value);
        closeKeyboard();
      },
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
        itemBuilder: (context, index) {
          return _buildInventoryCard(controller.inventoryItems[index]);
        },
      ),
    );
  }

  Widget _buildInventoryCard(InventoryCardUIModel inventoryData) =>
      ItemInventoryCard(inventoryData: inventoryData);

  Widget _getPlaceHolder() {
    return GestureDetector(
      onTap: closeKeyboard,
      child: EmptyListPlaceHolder(
        message: appLocalization.placeHolderEmptyInventory,
      ),
    );
  }
}
