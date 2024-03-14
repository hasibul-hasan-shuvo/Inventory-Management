import 'dart:async';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/repository/login_repository.dart';
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
      String token =await _authRepository.getAccessToken();
      if (token.isNotEmpty) {
        navigationController.trigger(Routes.MAIN);
      } else {
        navigationController.trigger(Routes.LOGIN);
      }
    });
  }
}
