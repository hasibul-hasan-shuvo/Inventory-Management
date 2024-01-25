import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/inventory_card.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return AppBar(
      iconTheme:
          Theme.of(context).iconTheme.copyWith(color: AppColors.colorWhite),
      actions: [
        controller.isSearchMode.value
            ? _buildClearButton()
            : _buildSearchButton()
      ],
      title: controller.isSearchMode.value
          ? _buildSearchTextField()
          : _buildTitle(),
      centerTitle: true,
    );
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
    return const Center(
      child: Text('No data found'),
    );
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

  Widget _buildInventoryCard(
          InventoryCardModel inventoryData, BuildContext context) =>
      InventoryCard(
        inventoryData: inventoryData,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => _buildDialog(inventoryData, context));
        },
      );

  Widget _buildDialog(InventoryCardModel inventoryData, BuildContext context) {
    return AppDialog(
      title: "Edit Product",
      content: _buildContent(inventoryData, context),
      negativeButtonText: "Delete Product",
      positiveButtonText: "Update Product",
    );
  }

  Widget _buildContent(InventoryCardModel inventoryData, BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      _buildProductImageWithTitle(inventoryData),
      const SizedBox(
        height: 10,
      ),
      _buildQuantityStatus(inventoryData),
    ]);
  }

  Widget _buildQuantityStatus(InventoryCardModel inventoryData) {
    return Container(
      height: AppValues.height_90.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F8F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMaxMinEditor(),
          Container(
            height: AppValues.height_90.h,
            width: 0.5,
            color: theme.dividerColor,
          ),
          _buildCurrentAndSuggestionEditor(),
        ],
      ),
    );
  }

  Padding _buildCurrentAndSuggestionEditor() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWithTitle(
                  title: 'Fast Forslag',
                  initialValue: "30",
                  onChanged: (value) {}),
              const SizedBox(
                height: 10,
              ),
              TextFieldWithTitle(
                  title: 'Beholdning  ',
                  initialValue: "30",
                  onChanged: (value) {}),
            ],
          ),
        );
  }

  Padding _buildMaxMinEditor() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldWithTitle(
                title: 'Min',
                initialValue: "30",
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWithTitle(
                title: 'Max',
                initialValue: "30",
                onChanged: (value) {},
              ),
            ],
          ),
        );
  }

  Row _buildProductImageWithTitle(InventoryCardModel inventoryData) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1, child: Image.network(inventoryData.productImageUrl ?? "")),
        const SizedBox(
          width: 10,
        ),
        Expanded(flex: 3, child: Text(inventoryData.productName ?? "",style: textTheme.titleMedium,)),
      ],
    );
  }
}

