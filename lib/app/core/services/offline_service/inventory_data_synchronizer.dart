import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:get/get.dart';

class InventoryDataSynchronizer implements DataSynchronizer {
  static final InventoryDataSynchronizer _instance =
      InventoryDataSynchronizer._internal();

  factory InventoryDataSynchronizer() => _instance;

  InventoryDataSynchronizer._internal();

  final InventoryRepository _inventoryRepository = Get.find();
  final AuthRepository _authRepository = Get.find();

  @override
  Future syncData() {
    if (_authRepository.getAccessToken().isNotNullOrEmpty) {
      return _inventoryRepository.getAllInventories().then((response) {
        BuildConfig.instance.config.logger.d("AllDataSynced:");
      }).onError((error, stackTrace) {
        BuildConfig.instance.config.logger.e("InventoryDataSyncError: $error");

        return Future.value();
      });
    }

    return Future.value();
  }
}
