import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../controllers/product_out_controller.dart';

// ignore: must_be_immutable
class ProductOutView extends BaseView<ProductOutController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(appBarTitleText: appLocalization.homeMenuItemRetrieval);
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'ProductOutView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
