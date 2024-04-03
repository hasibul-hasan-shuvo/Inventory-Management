import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/modules/about_us/controllers/about_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/app/core/base/base_view.dart';

//ignore: must_be_immutable
class AboutAppView extends BaseView<AboutAppController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding.sp),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(height: AppValues.padding.h),
            _buildDescriptionOne(),
            SizedBox(height: AppValues.halfPadding.h),
            _buildGuideImage(),
            SizedBox(height: AppValues.padding.h),
            _buildDescriptionTwo(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => Text(
        appLocalization.dentalTitleForAboutUsTitle,
        style: Theme.of(context).textTheme.titleLarge,
      );

  Widget _buildDescriptionOne() => Text(
        appLocalization.dentalTitleForAboutUsDescriptionOne,
      );

  Widget _buildDescriptionTwo() => Text(
        appLocalization.dentalTitleForAboutUsDescriptionTwo,
      );

  Widget _buildGuideImage() => Padding(
        padding: EdgeInsets.only(right: AppValues.margin_20.w),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AssetImageView(fileName: AppIcons.icDentalGuide),
          ],
        ),
      );
}
