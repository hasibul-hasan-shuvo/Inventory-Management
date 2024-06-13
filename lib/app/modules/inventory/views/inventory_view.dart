import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/item_inventory_card.dart';
import 'package:dental_inventory/app/modules/inventory/widget/item_unavailable_inventory_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/inventory_controller.dart';

// ignore: must_be_immutable
class InventoryView extends BaseView<InventoryController> {
  BuildContext? _context;
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
    _context;

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

  Widget _buildInventoryCard(InventoryUiModel inventoryData) =>
      inventoryData.isAvailable
          ? ItemInventoryCard(data: inventoryData)
          : ItemUnavailableInventoryView(data: inventoryData);

  Widget _getPlaceHolder() {
    return GestureDetector(
      onTap: closeKeyboard,
      child: EmptyListPlaceHolder(
        message: appLocalization.placeHolderEmptyInventory,
      ),
    );
  }

  void _subscribeUnavailableProductControllers() {}

  void _buildDialog(InventoryUiModel data) {
    if (_context != null) {
      showDialog(
        context: _context!,
        builder: (_) => AppDialog(
          title: appLocalization.titleUnavailableProduct,
          content: Container(),
          negativeButtonIcon: Icons.close,
          negativeButtonText: appLocalization.cancel,
          positiveButtonText: appLocalization.buttonTextAddProduct,
          willPopOnNegativeButtonTap: false,
          onPositiveButtonTap: () {},
        ),
      );
    }
  }
}
