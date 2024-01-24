import 'package:flutter/material.dart';

import '../controllers/contact_us_controller.dart';
import '/app/core/base/base_view.dart';

// ignore: must_be_immutable
class ContactUsView extends BaseView<ContactUsController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;


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
