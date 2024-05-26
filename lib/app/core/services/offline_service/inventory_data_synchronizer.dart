import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/flavors/build_config.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class InventoryDataSynchronizer implements DataSynchronizer {
  static final InventoryDataSynchronizer _instance =
      InventoryDataSynchronizer._internal();

  factory InventoryDataSynchronizer() => _instance;

  InventoryDataSynchronizer._internal();

  final InventoryRepository _inventoryRepository = Get.find();
  final AuthRepository _authRepository = Get.find();
  final Logger _logger = BuildConfig.instance.config.logger;

  @override
  Future syncData() {
    if (_authRepository.getAccessToken().isNotNullOrEmpty) {
      return _inventoryRepository
          .getDeletedInventories()
          .then((deletedInventories) async {
        for (DeletedInventoryEntityData deletedInventory
            in deletedInventories) {
          try {
            await _inventoryRepository
                .deleteInventoryFromServer(deletedInventory.id);
            await _inventoryRepository
                .deleteDeletedInventory(deletedInventory.id);
          } catch (e) {
            _logger.e("DeletedInventoryFailed: $e");
          }
        }

        return _inventoryRepository.getAllInventories().then((response) {
          _logger.d("AllDataSynced:");
        }).onError((error, stackTrace) {
          _logger.e("InventoryDataSyncError: $error");

          return Future.value();
        });
      });
    }

    return Future.value();
  }
}
