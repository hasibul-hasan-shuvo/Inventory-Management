import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_assets.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../controllers/account_setup_controller.dart';

// ignore: must_be_immutable
class AccountSetupView extends BaseView<AccountSetupController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Color pageBackgroundColor() {
    return AppColors.primary;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: AppValues.margin.h),
        _getLoaderView(),
        SizedBox(height: AppValues.margin.h),
        _getMessageView(),
        SizedBox(height: AppValues.margin.h),
      ],
    );
  }

  Widget _getLoaderView() {
    return Lottie.asset(
      AppAssets.accountSetupAnimation,
      repeat: true,
    );
  }

  Widget _getMessageView() {
    return Text(
      appLocalization.messageAccountSetup,
      style: textTheme.headlineSmall?.copyWith(color: AppColors.colorWhite),
      textAlign: TextAlign.center,
    );
  }
}
