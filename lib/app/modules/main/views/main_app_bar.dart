import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(right: AppValues.smallMargin),
        child: AssetImageView(
          fileName: AppImages.jacobsenLogo,
          height: AppValues.mainAppBarLogoHeight,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title:  Text(appLocalization.bottomNavLogOut),
                  content:  Text(appLocalization.logOutMessage),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child:  Text(appLocalization.no)),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child:  Text(appLocalization.yes)),
                  ],
                ));
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
