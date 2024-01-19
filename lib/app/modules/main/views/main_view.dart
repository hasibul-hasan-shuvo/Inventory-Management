import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contact_us/views/contact_us_view.dart';
import '/app/core/base/base_view.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';
import '/app/modules/settings/views/settings_view.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

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
  SettingsView? settingsView;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.CONTACT_US:
        favoriteView ??= ContactUsView();
        return favoriteView!;
      case MenuCode.ABOUT_US:
        settingsView ??= SettingsView();
        return settingsView!;
      case MenuCode.LOG_OUT:
        return AlertDialog(
          title: const Text('Logout'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appLocalization.logOutMessage),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: theme.canvasColor),
                    child: const Text('Yes'),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    style: ElevatedButton.styleFrom(backgroundColor: theme.canvasColor),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('No'),
                  ),
                ],
              ),
            ],
          ),
        );
    }
  }
}
