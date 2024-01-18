import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

// ignore: must_be_immutable
class SplashView extends BaseView<SplashController> {
  SplashView() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _subscribeNavigationController();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Container(
      color: theme.primaryColor,
      child: Center(
        child: const AssetImageView(
          fileName: AppImages.jacobsenLogo,
          fit: BoxFit.fitWidth,
        ).marginSymmetric(horizontal: AppValues.extraLargeMargin.w),
      ),
    );
  }

  void _subscribeNavigationController() {
    controller.navigationController.listen((route) {
      if (route.isNotEmpty) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
          SystemUiOverlay.top,
          SystemUiOverlay.bottom,
        ]);
        Get.offAllNamed(route);
      }
    });
  }
}
