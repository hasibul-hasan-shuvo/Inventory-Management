import 'package:dental_inventory/app/data/local/app_settings_local_data_source.dart';
import 'package:dental_inventory/app/data/repository/app_settings_repository.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final AppSettingsLocalDataSource _localDataSource = Get.find();

  @override
  CameraFacing getScannerCameraFacingState() {
    String cameraFacingStateString =
    _localDataSource.getScannerCameraFacingState();

    return CameraFacing.values.firstWhereOrNull((CameraFacing cameraFacing) =>
    cameraFacing.name == cameraFacingStateString) ??
        CameraFacing.back;
  }

  @override
  void saveScannerCameraFacingState(CameraFacing cameraFacingState) {
    return _localDataSource
        .saveScannerCameraFacingState(cameraFacingState.name);
  }
}
