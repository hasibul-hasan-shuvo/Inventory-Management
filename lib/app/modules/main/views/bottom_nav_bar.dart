import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:dental_inventory/app/modules/main/model/menu_code.dart';
import 'package:dental_inventory/app/modules/main/model/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef OnBottomNavItemSelected = Function(MenuCode menuCode);

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget with BaseWidgetMixin {
  BottomNavBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final OnBottomNavItemSelected onItemSelected;
  final navController = BottomNavController();
  final Key bottomNavKey = GlobalKey();

  @override
  Widget body(BuildContext context) {
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => BottomNavigationBar(
        key: bottomNavKey,
        items: _navItemBuilder(navItems),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
        selectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor: theme.bottomNavigationBarTheme.selectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onItemSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _navItemBuilder(List<BottomNavItem> navItems) {
    return navItems
        .map(
          (BottomNavItem navItem) => _getBottomNavigationBarItem(navItem),
        )
        .toList();
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(BottomNavItem navItem) {
    return BottomNavigationBarItem(
      icon: AssetImageView(
          fileName: navItem.iconSvgName,
          height: AppValues.iconDefaultSize,
          width: AppValues.iconDefaultSize,
          color: theme.bottomNavigationBarTheme.selectedItemColor),
      label: navItem.navTitle,
      tooltip: navItem.navTitle,
    );
  }

  List<BottomNavItem> _getNavItems() {
    return MenuCode.values
        .map((e) => e.toBottomNavItem(appLocalization))
        .toList();
  }
}
