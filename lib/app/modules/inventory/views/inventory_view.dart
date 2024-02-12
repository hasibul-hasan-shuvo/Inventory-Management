import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
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
    return Obx(
      () => Padding(
        padding: EdgeInsets.all(AppValues.halfPadding.r),
        child: controller.filteredInventoryList.isNotEmpty
            ? _buildListOfProduct()
            : _buildNoDataFoundWidget(),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SearchAbleAppBar(
        isSearchableMode: controller.isSearchMode.value,
        title: appLocalization.homeMenuInventory,
        onChangeSearchMode: controller.changeSearchMode,
        updateSearchQuery: controller.updateSearchQuery);
  }

  Widget _buildListOfProduct() {

    return PagingView(
      controller: controller.refreshController,
      enablePullDown: false,
      enablePullUp: controller.pagingController.canLoadNextPage(),
      onLoading: controller.onLoading,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.filteredInventoryList.length,
        itemBuilder: (context, index) {
          return _buildInventoryCard(
              controller.filteredInventoryList[index]);
        },
      ),
    );
  }

  Widget _buildNoDataFoundWidget() {
    return Center(
      child: Text(
        appLocalization.noDataFound,
        style: textTheme.labelLarge,
      ),
    );
  }

  Widget _buildInventoryCard(InventoryCardUIModel inventoryData) =>
      ItemInventoryCard(inventoryData: inventoryData);
}
