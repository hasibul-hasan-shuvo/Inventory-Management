import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../controllers/suggested_orders_controller.dart';

// ignore: must_be_immutable
class SuggestedOrdersView extends BaseView<SuggestedOrdersController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.homeMenuSuggestedOrder);

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'SuggestedOrdersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
