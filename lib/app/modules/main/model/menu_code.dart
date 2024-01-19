import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dental_inventory/app/modules/main/model/menu_item.dart';

enum MenuCode { HOME, CONTACT_US, ABOUT, LOGOUT }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          iconSvgName: AppIcons.home,
          menuCode: MenuCode.HOME,
        );
      case MenuCode.CONTACT_US:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavContactUs,
            iconSvgName: AppIcons.contact_us,
            menuCode: MenuCode.CONTACT_US);
      case MenuCode.ABOUT:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavAboutUs,
            iconSvgName: AppIcons.about_us,
            menuCode: MenuCode.ABOUT);
      case MenuCode.LOGOUT:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavLogOut,
            iconSvgName: AppIcons.logout,
            menuCode: MenuCode.LOGOUT);
    }
  }
}
