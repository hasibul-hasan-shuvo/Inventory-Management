import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/barcode_scanner_floating_button.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/global_inventories/widgets/item_global_inventory_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/global_inventories_controller.dart';

// ignore: must_be_immutable
class GlobalInventoriesView extends BaseView<GlobalInventoriesController> {
  GlobalInventoriesView() {
    ZebraScanner().addScannerDelegate(controller.onScanned);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Obx(
        () => SearchAbleAppBar(
          isSearchableMode: controller.isSearchable,
          title: appLocalization.homeMenuSearchItem,
          onChangeSearchMode: controller.changeSearchMode,
          updateSearchQuery: (value) {
            controller.updateSearchQuery(value);
            closeKeyboard();
          },
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.isPageLoading && controller.inventories.isEmpty
          ? const SizedBox.shrink()
          : controller.inventories.isEmpty
              ? _getPlaceHolder()
              : _getInventoryList(),
    );
  }

  @override
  Widget? floatingActionButton() {
    return BarcodeScannerFloatingButton(
      onPressed: _onPressedScanner,
    );
  }

  Widget _getPlaceHolder() {
    return GestureDetector(
      onTap: closeKeyboard,
      child: EmptyListPlaceHolder(
        message: appLocalization.placeHolderEmptyInventory,
      ),
    );
  }

  Widget _getInventoryList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: AppValues.padding.h,
        bottom: AppValues.extraLargeSpacing.h,
        left: AppValues.padding.w,
        right: AppValues.padding.w,
      ),
      itemCount: controller.inventories.length,
      itemBuilder: _getItemBuilder,
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ItemGlobalInventoryView(data: controller.inventories[index]);
  }

  void _onPressedScanner() {
    closeKeyboard();
    Get.toNamed(
      Routes.SCANNER,
    )?.then((code) {
      controller.onScanned(code);
    });
  }
}
