import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../controllers/item_count_controller.dart';

// ignore: must_be_immutable
class ItemCountView extends BaseView<ItemCountController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.homeMenuInventoryCount);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'ItemCountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
