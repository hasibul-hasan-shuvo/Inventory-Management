import 'package:dental_inventory/app/data/local/app_settings_local_data_source.dart';
import 'package:dental_inventory/app/data/local/preference/preference_manager.dart';
import 'package:get/get.dart';

class AppSettingsLocalDataSourceImpl implements AppSettingsLocalDataSource {
  final PreferenceManager _preferenceManager = Get.find();

  @override
  String getScannerCameraFacingState() {
    return _preferenceManager.getString(
      PreferenceManager.SCANNER_CAMERA_STATE,
    );
  }

  @override
  void saveScannerCameraFacingState(String cameraFacingState) {
    _preferenceManager.setString(
      PreferenceManager.SCANNER_CAMERA_STATE,
      cameraFacingState,
    );
  }
}
