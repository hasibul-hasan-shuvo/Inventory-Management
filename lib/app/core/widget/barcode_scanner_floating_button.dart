import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BarcodeScannerFloatingButton extends StatelessWidget
    with BaseWidgetMixin {
  final GestureTapCallback onPressed;

  BarcodeScannerFloatingButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget body(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: AssetImageView(
        fileName: AppIcons.barcodeScanner,
        height: AppValues.iconDefaultSize.h,
        color: theme.colorScheme.onPrimary,
      ),
    );
  }
}
