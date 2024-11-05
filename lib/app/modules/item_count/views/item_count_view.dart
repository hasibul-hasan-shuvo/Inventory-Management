import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/scanner/scanner_service.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/EmptyScannedListView.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/custom_floating_button.dart';
import 'package:dental_inventory/app/modules/item_count/widgets/item_inventory_count_view.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_list_page_arguments.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/item_count_controller.dart';

// ignore: must_be_immutable
class ItemCountView extends BaseView<ItemCountController> {
  ItemCountView() {
    ScannerService().addScannerDelegate(controller.onScanned);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuInventoryCount,
        actions: _getActions,
      );

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.scannedProducts.isEmpty
          ? EmptyScannedListView()
          : _getInventoriesListView(),
    );
  }

  @override
  Widget? floatingActionButton() {
    return CustomFloatingButton(
      onPressedScanner: _onPressedScanner,
      onPressedList: _onPressedList,
    );
  }

  Widget _getInventoriesListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.padding.w,
        vertical: AppValues.padding.h,
      ),
      shrinkWrap: true,
      itemCount: controller.scannedProducts.length,
      itemBuilder: _getItemBuilder,
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ItemInventoryCountView(data: controller.scannedProducts[index]);
  }

  List<Widget> get _getActions {
    return [
      IconButton(
        onPressed: controller.updateAll,
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

  void _onPressedList() {
    SelectableInventoryListPageArguments pageArguments =
        SelectableInventoryListPageArguments(
      controller: controller,
      title: appLocalization.homeMenuInventoryCount,
    );

    Get.toNamed(
      Routes.SELECTABLE_INVENTORY_LIST,
      arguments: pageArguments,
    );
  }
}
