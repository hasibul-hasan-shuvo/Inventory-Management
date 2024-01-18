import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dental_inventory/app/modules/main/model/menu_item.dart';

enum MenuCode { HOME, FAVORITE, SETTINGS }

extension MenuCodeExtensions on MenuCode {
  BottomNavItem toBottomNavItem(AppLocalizations appLocalization) {
    switch (this) {
      case MenuCode.HOME:
        return BottomNavItem(
          navTitle: appLocalization.bottomNavHome,
          iconSvgName: AppIcons.home,
          menuCode: MenuCode.HOME,
        );
      case MenuCode.FAVORITE:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavFavorite,
            iconSvgName: AppIcons.favourite,
            menuCode: MenuCode.FAVORITE);
      case MenuCode.SETTINGS:
        return BottomNavItem(
            navTitle: appLocalization.bottomNavSettings,
            iconSvgName: AppIcons.settings,
            menuCode: MenuCode.SETTINGS);
    }
  }
}
