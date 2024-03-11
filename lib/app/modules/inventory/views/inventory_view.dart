import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/item_inventory_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../login/models/auth_page_state.dart';
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
      final pageStatus = controller.inventoryPageState.value.pageStatus;

      return Padding(
          padding: EdgeInsets.all(AppValues.halfPadding.r),
          child: pageStatus == PageStatus.loading
              ? _buildLoadingWidget()
              : pageStatus == PageStatus.success
                  ? _buildListOfProduct()
                  : pageStatus == PageStatus.error
                      ? _buildErrorView()
                      : Container());
    });
  }

  Widget _buildAppBar(BuildContext context) {
    return SearchAbleAppBar(
        isSearchableMode: controller.isSearchMode.value,
        title: appLocalization.homeMenuInventory,
        onChangeSearchMode: controller.changeSearchMode,
        updateSearchQuery: controller.updateSearchQuery);
  }

  Widget _buildListOfProduct() {
    return controller.inventoryPageState.value.inventoryList.isEmpty
        ? _buildNoDataFoundWidget()
        : PagingView(
            controller: controller.refreshController,
            enablePullDown: false,
            enablePullUp: controller.pagingController.canLoadNextPage(),
            onLoading: controller.onLoading,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  controller.inventoryPageState.value.inventoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildInventoryCard(
                      controller.inventoryPageState.value.inventoryList[index]),
                );
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

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: TextButton(
        onPressed: () {
          controller.fetchInventoryList();
        },
        child: Text(
          appLocalization.retry,
          style: textTheme.labelLarge,
        ),
      ),
    );
  }
}
