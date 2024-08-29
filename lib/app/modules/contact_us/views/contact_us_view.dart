import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../controllers/contact_us_controller.dart';
import '/app/core/base/base_view.dart';

// ignore: must_be_immutable
class ContactUsView extends BaseView<ContactUsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.bottomNavContactUs);

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding.h),
      child: SingleChildScrollView(
        child: HtmlWidget(
          BuildConfig.instance.config.contactInfo
              .getContactPageHtmlBody(context),
        ),
      ),
    );
  }
}
