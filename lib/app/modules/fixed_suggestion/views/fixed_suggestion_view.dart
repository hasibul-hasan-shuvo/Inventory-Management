import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../controllers/fixed_suggestion_controller.dart';

class FixedSuggestionView extends BaseView<FixedSuggestionController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuSuggestedOrder,
        actions: _getActions,
      );

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text(
        'FixedSuggestionView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  List<Widget> get _getActions {
    return [
      // IconButton(
      //   onPressed: controller.addToCartAll,
      //   icon: const Icon(
      //     Icons.done,
      //   ),
      // )
    ];
  }
}
