import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/modules/main/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool isLogOutVisible;

  MainAppBar({
    Key? key,
    this.isLogOutVisible = true,
  }) : super(key: key);

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
      actions: isLogOutVisible ? _buildActions(context) : null,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;

  List<Widget> _buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => _onTapLogout(context),
        icon: const AssetImageView(
          fileName: AppIcons.logOut,
          color: Colors.white,
        ),
      ),
    ];
  }

  void _onTapLogout(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: appLocalization.logOut,
        message: appLocalization.logOutMessage,
        isCancelable: false,
        negativeButtonText: appLocalization.no,
        positiveButtonText: appLocalization.yes,
        onPositiveButtonTap: () {
          MainController controller = Get.find();
          controller.logout();
        },
      ),
    );
  }
}
