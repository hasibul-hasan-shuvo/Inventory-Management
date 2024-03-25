import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/EmptyScannedListView.dart';
import 'package:dental_inventory/app/core/widget/barcode_scanner_floating_button.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/modules/item_count/widgets/item_inventory_count_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/item_count_controller.dart';

// ignore: must_be_immutable
class ItemCountView extends BaseView<ItemCountController> {
  ItemCountView() {
    ZebraScanner().addScannerDelegate(controller.onScanned);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuInventoryCount,
        actions: _getActions,
      );

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.inventories.isEmpty
          ? EmptyScannedListView()
          : _getInventoriesListView(),
    );
  }

  @override
  Widget? floatingActionButton() {
    return BarcodeScannerFloatingButton(
      onPressed: _onPressedScanner,
    );
  }

  Widget _getInventoriesListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.padding.w,
        vertical: AppValues.padding.h,
      ),
      shrinkWrap: true,
      itemCount: controller.inventories.length,
      itemBuilder: _getItemBuilder,
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ItemInventoryCountView(data: controller.inventories[index]);
  }

  List<Widget> get _getActions {
    return [
      IconButton(
        onPressed: _onDone,
        icon: const Icon(
          Icons.done,
        ),
      )
    ];
  }

  void _onPressedScanner() {
    Get.toNamed(
      Routes.SCANNER,
    )?.then((code) {
      controller.onScanned(code);
    });
  }

  void _onDone() {
    Get.back();
  }
}
