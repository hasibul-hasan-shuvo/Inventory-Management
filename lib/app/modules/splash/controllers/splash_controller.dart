import 'dart:async';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  final RxString navigationController = RxString("");

  @override
  void onInit() {
    super.onInit();
    _navigateToNextPage();
  }

  void _navigateToNextPage() {
    // TODO: check the authorization and navigate according to
    Timer(const Duration(seconds: 3), () {
      navigationController.trigger(Routes.MAIN);
    });
  }
}
