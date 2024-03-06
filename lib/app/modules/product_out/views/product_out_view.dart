import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/ZebraScanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/modules/product_out/widgets/EmptyScannedListView.dart';
import 'package:dental_inventory/app/modules/product_out/widgets/item_product_out_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/product_out_controller.dart';

// ignore: must_be_immutable
class ProductOutView extends BaseView<ProductOutController> {
  ProductOutView() {
    ZebraScanner().addScannerDelegate(controller.onScanned);
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.titleItemRetrieval);

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.scannedProducts.isEmpty
          ? EmptyScannedListView()
          : _getProductListView(),
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
    return ItemProductOutView(data: controller.scannedProducts[index]);
  }
}
