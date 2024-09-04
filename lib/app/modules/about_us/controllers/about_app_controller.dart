import 'package:dental_inventory/app/data/model/response/user_response.dart';
import 'package:dental_inventory/app/modules/about_us/models/user_ui_model.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/app/core/base/base_controller.dart';

class AboutAppController extends BaseController {
  final RxString _versionController = RxString('');

  String get version => _versionController.value;

  final Rx<UserUiModel> _userController = Rx(UserUiModel.empty());

  UserUiModel get user => _userController.value;

  @override
  void onInit() {
    super.onInit();
    _getAppVersion();
    _getUserData();
  }

  @override
  void onClose() {
    _versionController.close();
    super.onClose();
  }

  void _getAppVersion() {
    PackageInfo.fromPlatform().then((info) {
      _versionController(
          "${appLocalization.version}: ${info.version}.${info.buildNumber}");
    });
  }

  void _getUserData() {
    UserResponse response = authRepository.getUserData();

    _userController(
      UserUiModel.fromUserResponse(response),
    );
  }
}
