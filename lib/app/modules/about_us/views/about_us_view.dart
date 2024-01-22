import 'package:dental_inventory/app/modules/about_us/controllers/about_us_controller.dart';
import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';

class AboutUsView extends BaseView<AboutUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: appLocalization.bottomNavAboutUs,
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text("About Us"),
    );
  }

}
