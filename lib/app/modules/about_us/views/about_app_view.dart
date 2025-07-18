import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/modules/about_us/controllers/about_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';

//ignore: must_be_immutable
class AboutAppView extends BaseView<AboutAppController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.bottomNavAboutApp);

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.padding.sp),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getLoggedInUserView(),
            SizedBox(height: AppValues.padding.h),
            _buildTitle(context),
            SizedBox(height: AppValues.padding.h),
            _buildDescriptionOne(),
            SizedBox(height: AppValues.halfPadding.h),
            _buildGuideImage(),
            SizedBox(height: AppValues.padding.h),
            _buildDescriptionTwo(),
            SizedBox(height: AppValues.largeMargin.h),
            _getAppVersion(),
          ],
        ),
      ),
    );
  }

  Widget _getLoggedInUserView() {
    return Obx(
      () => Text(
        appLocalization.loggedInCustomerId(
          controller.user.customerId,
          controller.user.name,
        ),
        style: textTheme.bodySmall,
        textAlign: TextAlign.center,
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

  Widget _getAppVersion() {
    return Obx(
      () => Text(
        controller.version,
        style: textTheme.labelSmall?.copyWith(color: theme.hintColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
