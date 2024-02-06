import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/dialog_content.dart';
import 'package:dental_inventory/app/modules/inventory/widget/item_inventory_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/inventory_controller.dart';

// ignore: must_be_immutable
class InventoryView extends BaseView<InventoryController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Obx(() => _buildAppBar(context)));
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: controller.filteredInventoryList.isNotEmpty
            ? _buildListOfProduct()
            : _buildNoDataFoundWidget()));
  }

  Widget _buildAppBar(BuildContext context) {
    return SearchAbleAppBar(
        isSearchableMode: controller.isSearchMode.value,
        title: appLocalization.homeMenuInventory,
        onChangeSearchMode: controller.changeSearchMode,
        updateSearchQuery: controller.updateSearchQuery);
  }

  Widget _buildListOfProduct() {
    return ListView.builder(
      itemCount: controller.filteredInventoryList.length,
      itemBuilder: (context, index) {
        return _buildInventoryCard(
            controller.filteredInventoryList[index], context);
      },
    );
  }

  Widget _buildNoDataFoundWidget() {
    return Center(
      child: Text(appLocalization.noDataFound),
    );
  }

  Widget _buildInventoryCard(
          InventoryCardUIModel inventoryData, BuildContext context) =>
      ItemInventoryCard(
        inventoryData: inventoryData,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => _buildDialog(inventoryData, context));
        },
      );

  Widget _buildDialog(
      InventoryCardUIModel inventoryData, BuildContext context) {
    return AppDialog(
      title: appLocalization.editProduct,
      content: DialogContent(inventoryData: inventoryData),
      negativeButtonIcon: Icons.delete_outline,
      negativeButtonText: appLocalization.deleteProduct,
      positiveButtonText: appLocalization.updateProduct,
    );
  }
}
