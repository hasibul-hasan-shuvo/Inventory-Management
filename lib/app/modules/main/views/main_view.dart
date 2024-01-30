import 'package:dental_inventory/app/modules/about_us/views/about_us_view.dart';
import 'package:dental_inventory/app/modules/main/views/main_app_bar.dart';
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
  PreferredSizeWidget? appBar(BuildContext context) =>  MainAppBar();

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(
        () => getPageOnSelectedMenu(controller.selectedMenuCode),
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(onItemSelected: controller.onMenuSelected);
  }

  final HomeView homeView = HomeView();
  ContactUsView? favoriteView;
  AboutUsView? aboutUsView;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.CONTACT_US:
        favoriteView ??= ContactUsView();
        return favoriteView!;
      case MenuCode.ABOUT_US:
        aboutUsView ??= AboutUsView();
        return aboutUsView!;
    }
  }
}
