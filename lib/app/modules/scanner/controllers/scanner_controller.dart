import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/repository/app_settings_repository.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerController extends BaseController {
  final AppSettingsRepository _repository = Get.find();

  MobileScannerController scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  @override
  void onInit() {
    super.onInit();
    _getCameraFacingStateAndSetToController();
  }

  void _getCameraFacingStateAndSetToController() {
    CameraFacing cameraFacing = _repository.getScannerCameraFacingState();
    scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: cameraFacing,
    );
  }

  void onPressedCameraSwitch() {
    scannerController.switchCamera().then((_) {
      _repository.saveScannerCameraFacingState(
          scannerController.value.cameraDirection);
    });
  }
}
