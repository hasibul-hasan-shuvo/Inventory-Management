import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/app/core/base/base_controller.dart';

class AboutAppController extends BaseController {
  final RxString _versionController = RxString('');

  String get version => _versionController.value;

  @override
  void onInit() {
    super.onInit();
    _getAppVersion();
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
}
