import 'dart:async';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/app_keys.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  final RxString navigationController = RxString("");
  final PreferenceManager _preferenceManager = Get.find<PreferenceManager>();

  @override
  void onInit() {
    super.onInit();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    final token = _preferenceManager.getString(AppKeys.TOKEN);
await Future.delayed(const Duration(seconds: 2));
    if (token != '') {
      navigationController.trigger(Routes.MAIN);
    } else {
      navigationController.trigger(Routes.LOGIN);
    }
  }
}
