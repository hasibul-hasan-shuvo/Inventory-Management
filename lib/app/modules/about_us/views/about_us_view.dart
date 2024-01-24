import 'package:dental_inventory/app/modules/about_us/controllers/about_us_controller.dart';
import 'package:flutter/material.dart';
import '/app/core/base/base_view.dart';

class AboutUsView extends BaseView<AboutUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;
  @override
  Widget body(BuildContext context) {
    return  Center(
      child: Text(appLocalization.bottomNavAboutUs,
        style: textTheme.titleLarge,
      ),
    );
  }

}
