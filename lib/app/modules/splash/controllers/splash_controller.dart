import 'dart:async';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String token = _authRepository.getAccessToken();
      bool isUserAccountSet = _authRepository.getIsUserAccountSet();

      if (token.isEmpty) {
        navigationController.trigger(Routes.LOGIN);
      } else if (token.isNotEmpty && !isUserAccountSet) {
        navigationController.trigger(Routes.ACCOUNT_SETUP);
      } else {
        navigationController.trigger(Routes.MAIN);
      }
    });
  }
}
