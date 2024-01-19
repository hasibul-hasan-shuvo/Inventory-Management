import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/modules/favorite/views/favorite_view.dart';
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
  FavoriteView? favoriteView;
  SettingsView? settingsView;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.CONTACT_US:
        favoriteView ??= FavoriteView();
        return favoriteView!;
      case MenuCode.ABOUT:
        settingsView ??= SettingsView();
        return settingsView!;
      case MenuCode.LOGOUT:
        return Dialog(
          child: Container(
            height: 100,
            child: Column(
              children: [
                const Text('Logout'),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('No'),
                ),
              ],
            ),
          ),
        );
    }
  }
}
