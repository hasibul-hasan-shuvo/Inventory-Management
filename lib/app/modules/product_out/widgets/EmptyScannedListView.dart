import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class EmptyScannedListView extends StatelessWidget with BaseWidgetMixin {
  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _getScannerImage(),
        SizedBox(height: AppValues.smallMargin.h),
        _getTitle(),
      ],
    );
  }

  Widget _getScannerImage() {
    return Center(
      child: AssetImageView(
        fileName: AppIcons.barcodeScanner,
        height: AppValues.iconExtraLargerSize.h,
        color: theme.primaryColor,
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      appLocalization.titleEmptyScannedList,
      style: textTheme.headlineSmall,
      maxLines: 1,
      textAlign: TextAlign.center,
    );
  }
}
