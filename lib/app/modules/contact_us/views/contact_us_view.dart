import 'package:dental_inventory/app/modules/main/views/main_app_bar.dart';
import 'package:flutter/material.dart';

import '../controllers/contact_us_controller.dart';
import '/app/core/base/base_view.dart';

// ignore: must_be_immutable
class ContactUsView extends BaseView<ContactUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const MainAppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text(
        appLocalization.bottomNavContactUs,
        style: textTheme.titleLarge,
      ),
    );
  }
}
