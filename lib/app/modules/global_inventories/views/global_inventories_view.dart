import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:flutter/material.dart';
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
          title: appLocalization.homeMenuInventory,
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
    return Scaffold(
      body: const Center(
        child: Text(
          'GlobalInventoriesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
