import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/controllers/selectable_inventory_list_controller.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/widgets/item_selectable_inventory_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SelectableInventoryListView
    extends BaseView<SelectableInventoryListController> {
  SelectableInventoryListView();

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

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Obx(
        () => _buildAppBar(context),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SearchAbleAppBar(
      isSearchableMode: controller.isSearchable,
      title: appLocalization.homeMenuSearchItem,
      onBackButtonClick: () {
        Get.back(result: controller.scannedProducts);
      },
      onChangeSearchMode: controller.changeSearchMode,
      updateSearchQuery: (value) {
        controller.updateSearchQuery(value);
        closeKeyboard();
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
      child: Obx(() => ListView.builder(
            padding: EdgeInsets.symmetric(
              vertical: AppValues.padding.h,
              horizontal: AppValues.padding.w,
            ),
            shrinkWrap: true,
            itemCount: controller.inventoryItems.length,
            itemBuilder: (context, index) {
              return _buildInventoryCard(controller.inventoryItems[index]);
            },
          )),
    );
  }

  Widget _buildInventoryCard(SelectableInventoryItemUiModel inventoryData) =>
      GestureDetector(
          onTap: () {
            Get.back(result: inventoryData.itemId);
          },
          child: ItemSelectableInventoryCard(inventoryData: inventoryData));
}
