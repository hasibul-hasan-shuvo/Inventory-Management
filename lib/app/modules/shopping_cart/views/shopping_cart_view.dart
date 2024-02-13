import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../controllers/shopping_cart_controller.dart';

// ignore: must_be_immutable
class ShoppingCartView extends BaseView<ShoppingCartController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.homeMenuShoppingCart);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'ShoppingCartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
