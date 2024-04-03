import 'package:dental_inventory/app/core/utils/url_launcher.dart';
import 'package:dental_inventory/app/core/values/app_strings.dart';
import 'package:dental_inventory/app/modules/about_us/views/about_app_view.dart';
import 'package:dental_inventory/app/modules/main/views/main_app_bar.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contact_us/views/contact_us_view.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => MainAppBar();

  @override
  Widget body(BuildContext context) {
    return HomeView();
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(onItemSelected: _onMenuSelected);
  }

  final HomeView homeView = HomeView();
  ContactUsView? favoriteView;
  AboutAppView? aboutUsView;

  void _onMenuSelected(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        UrlLauncher.launchUrl(AppStrings.website);
        break;
      case MenuCode.CONTACT_US:
        Get.toNamed(Routes.CONTACT_US);
        break;
      case MenuCode.ABOUT_US:
        Get.toNamed(Routes.ABOUT_APP);
        break;
    }
  }
}
