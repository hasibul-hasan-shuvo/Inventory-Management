import 'package:mobile_scanner/mobile_scanner.dart';

abstract class AppSettingsRepository {
  CameraFacing getScannerCameraFacingState();

  void saveScannerCameraFacingState(CameraFacing cameraFacingState);
}
