import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// ignore: must_be_immutable
class CustomFloatingButton extends StatelessWidget with BaseWidgetMixin {
  CustomFloatingButton({
    super.key,
    required this.onPressedScanner,
    required this.onPressedList,
  });

  final GestureTapCallback onPressedScanner;
  final GestureTapCallback onPressedList;

  @override
  Widget body(BuildContext context) {
    return SpeedDial(
      activeChild: const Icon(Icons.close),
      overlayOpacity: 0,
      childPadding: EdgeInsets.zero,
      spaceBetweenChildren: AppValues.smallMargin.h,
      curve: Curves.bounceOut,
      children: [
        _speedDialChild(
          AppIcons.barcodeScanner,
          onPressedScanner,
        ),
        _speedDialChild(
          AppIcons.listBulleted,
          onPressedList,
        ),
      ],
      child: const Icon(Icons.add),
    );
  }

  SpeedDialChild _speedDialChild(String icon, GestureTapCallback onPressed) {
    return SpeedDialChild(
      backgroundColor: theme.primaryColor,
      child: AssetImageView(
        fileName: icon,
        height: AppValues.emoticonDefaultSize.h,
        color: theme.colorScheme.onPrimary,
      ),
      onTap: onPressed,
    );
  }
}
