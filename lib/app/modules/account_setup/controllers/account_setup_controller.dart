import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/services/offline_service/data_sync_manager.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AccountSetupController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    DataSyncManager().syncAllDataWithServer();
    DataSyncManager().isDataSynced.listen((isSynced) {
      if (isSynced) {
        authRepository.setIsUserAccountSet();
        Get.offAllNamed(Routes.MAIN);
      }
    });
  }
}
