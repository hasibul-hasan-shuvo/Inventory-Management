import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/inventory_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/inventory_controller.dart';

// ignore: must_be_immutable
class InventoryView extends BaseView<InventoryController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Obx(() => AppBar(
              iconTheme: Theme.of(context)
                  .iconTheme
                  .copyWith(color: AppColors.colorWhite),
              actions: [
                controller.isSearchMode.value
                    ? _buildClearButton()
                    : _buildSearchButton()
              ],
              title: controller.isSearchMode.value
                  ? _buildSearchTextField()
                  : _buildTitle(),
              centerTitle: true,
            )));
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: controller.filteredInventoryList.length,
            itemBuilder: (context, index) {
              return _buildInventoryCard(controller.filteredInventoryList[index]);
            },
          ),
        ));
  }

  Widget _buildSearchTextField() {
    return TextFormField(
      autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
        ),
        maxLines: 1,
        cursorColor: AppColors.colorWhite,
        onChanged: (value) {
          controller.updateSearchQuery(value);
        },
        style: const TextStyle(color: AppColors.colorWhite));
  }

  Widget _buildSearchButton() {
    return IconButton(
      onPressed: () {
        controller.changeSearchMode();
      },
      icon: const Icon(Icons.search),
    );
  }

  Widget _buildClearButton() {
    return IconButton(
        onPressed: () {
          controller.changeSearchMode();
        },
        icon: SvgPicture.asset(
          AppImages.closeInInventory,
        ));
  }

  _buildTitle() => Text(appLocalization.homeMenuInventory);

  Widget _buildInventoryCard(InventoryCardModel inventoryData) => InventoryCard(
        inventoryData: inventoryData,
      );
}
