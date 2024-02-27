import 'dart:async';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/repository/login_repository.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  final RxString navigationController = RxString("");
  final AuthRepository _authRepository = Get.find<AuthRepository>();

  @override
  void onInit() {
    super.onInit();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    final token =await _authRepository.getAccessToken();
await Future.delayed(const Duration(seconds: 2));
    if (token != '') {
      navigationController.trigger(Routes.MAIN);
    } else {
      navigationController.trigger(Routes.LOGIN);
    }
  }
}
