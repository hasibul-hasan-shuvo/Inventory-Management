import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/EmptyScannedListView.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/custom_floating_button.dart';
import 'package:dental_inventory/app/modules/product_in/widgets/item_product_in_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/product_in_controller.dart';

// ignore: must_be_immutable
class ProductInView extends BaseView<ProductInController> {
  ProductInView() {
    ZebraScanner().addScannerDelegate(controller.onScanned);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.titleItemRevertRetrieval,
        actions: _getActions,
      );

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.scannedProducts.isEmpty
          ? EmptyScannedListView()
          : _getProductListView(),
    );
  }

  @override
  Widget? floatingActionButton() {
    return CustomFloatingButton(
      onPressedScanner: _onPressedScanner,
      onPressedList: _onPressedList,
    );
  }

  Widget _getProductListView() {
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
    return ItemProductInView(data: controller.scannedProducts[index]);
  }

  void _onPressedScanner() {
    Get.toNamed(
      Routes.SCANNER,
    )?.then((code) {
      controller.onScanned(code);
    });
  }

  /// for showing list of items
  void _onPressedList() {
    Get.toNamed(
      Routes.SELECTABLE_INVENTORY_LIST,
      arguments: controller.scannedProducts,
    )?.then((value) => controller.onUpdateProduct(value));
  }

  List<Widget> get _getActions {
    return [
      IconButton(
        onPressed: controller.revertAllItems,
        icon: const Icon(
          Icons.done,
        ),
      )
    ];
  }
}
