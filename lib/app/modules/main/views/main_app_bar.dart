import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
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
      actions: _buildActions(context),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;

  List<Widget> _buildActions(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return [
      IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AppDialog(
                      title: appLocalization.logOut,
                      content: appLocalization.logOutMessage,
                      cancelText: appLocalization.no,
                      confirmText: appLocalization.yes,
                      onCancel: () {
                        Navigator.pop(context);
                      },
                      onConfirm: () {
                        Navigator.pop(context);
                      },
                    ));
          },
          icon: const AssetImageView(
            fileName: AppIcons.logOut,
            color: Colors.white,
          )),
    ];
  }
}
