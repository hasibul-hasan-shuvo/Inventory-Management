import 'package:flutter/material.dart';

import '../controllers/contact_us_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/core/widget/custom_app_bar.dart';

// ignore: must_be_immutable
class ContactUsView extends BaseView<ContactUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Contact Us',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text(
        'Contact Us View is working',
        style: textTheme.titleLarge,
      ),
    );
  }
}
