import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
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
      return _updateInventoryChanges()
          .then((_) => _updateDeletedInventories().then(
                (_) => _updateLocalInventories(),
              ));
    }

    return Future.value();
  }

  Future _updateInventoryChanges() {
    return _inventoryRepository
        .getAllInventoryChanges()
        .then((inventoryChangesList) async {
      for (InventoryChangesEntityData inventoryChanges
          in inventoryChangesList) {
        try {
          if (inventoryChanges.id == null &&
              inventoryChanges.replaceWith.isNullOrEmpty) {
            await _createInventoryToServer(inventoryChanges);
          } else {
            await _updateInventoryToServer(inventoryChanges);
          }
          await _inventoryRepository
              .deleteInventoryChangesByItemId(inventoryChanges.itemId);
        } catch (e) {
          _logger.e("InventoryChangesFailed: $e");
        }
      }

      return inventoryChangesList;
    });
  }

  Future _createInventoryToServer(InventoryChangesEntityData inventoryChanges) {
    CreateInventoryRequestBody requestBody = CreateInventoryRequestBody(
      itemId: inventoryChanges.itemId,
      minCount: inventoryChanges.minCount?.toString(),
      maxCount: inventoryChanges.maxCount?.toString(),
      stockCount: inventoryChanges.stockCountChange.toString(),
      fixedSuggestion: inventoryChanges.fixedSuggestion?.toString(),
    );

    return _inventoryRepository.createInventoryInServer(requestBody);
  }

  Future _updateInventoryToServer(InventoryChangesEntityData inventoryChanges) {
    InventoryUpdateRequestBody requestBody = InventoryUpdateRequestBody(
      id: inventoryChanges.id,
      itemId: inventoryChanges.itemId,
      minCount: inventoryChanges.minCount,
      maxCount: inventoryChanges.maxCount,
      stockCountChange: inventoryChanges.stockCountChange,
      fixedSuggestion: inventoryChanges.fixedSuggestion,
      replaceWith: inventoryChanges.replaceWith,
    );

    return _inventoryRepository.updateInventoryDataInServer(requestBody);
  }

  Future _updateDeletedInventories() {
    return _inventoryRepository
        .getDeletedInventories()
        .then((deletedInventories) async {
      for (DeletedInventoryEntityData deletedInventory in deletedInventories) {
        try {
          await _inventoryRepository
              .deleteInventoryFromServer(deletedInventory.id);
          await _inventoryRepository
              .deleteIdFromDeletedInventory(deletedInventory.id);
        } catch (e) {
          _logger.e("DeletedInventoryFailed: $e");
        }
      }

      return deletedInventories;
    });
  }

  Future _updateLocalInventories() {
    return _inventoryRepository.getAllInventories().then((response) {
      _logger.d("AllDataSynced:");

      return response;
    }).onError((error, stackTrace) {
      _logger.e("InventoryDataSyncError: $error");

      return Future.value();
    });
  }
}
