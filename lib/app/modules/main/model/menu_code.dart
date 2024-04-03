import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/modules/main/model/menu_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum MenuCode { HOME, CONTACT_US, ABOUT_US }

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
          iconSvgName: AppIcons.contactUs,
          menuCode: MenuCode.CONTACT_US,
        );
      case MenuCode.ABOUT_US:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavAboutApp,
          iconSvgName: AppIcons.aboutUs,
          menuCode: MenuCode.ABOUT_US,
        );
    }
  }
}
