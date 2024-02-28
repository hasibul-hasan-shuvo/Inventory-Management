import 'dart:async';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  final RxString navigationController = RxString("");
  final AuthLocalDataSource _preferenceManager = Get.find<AuthLocalDataSource>();

  @override
  void onInit() {
    super.onInit();
    _navigateToNextPage();
  }

  Future<void> _navigateToNextPage() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      String token = _preferenceManager.getToken();
      if (token.isNotEmpty) {
        navigationController.trigger(Routes.MAIN);
      } else {
        navigationController.trigger(Routes.LOGIN);
      }
    });
  }
}
