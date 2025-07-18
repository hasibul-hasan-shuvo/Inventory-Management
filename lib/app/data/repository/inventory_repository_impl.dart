import 'package:dental_inventory/app/core/services/offline_service/data_sync_manager.dart';
import 'package:dental_inventory/app/core/services/offline_service/models/data_synchronizer_key.dart';
import 'package:dental_inventory/app/core/utils/date_parser.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/local/inventory_local_data_source.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:drift/drift.dart' as drift;
import 'package:get/get.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource _remoteDataSource = Get.find();
  final InventoryLocalDataSource _localDataSource = Get.find();

  @override
  Future getAllInventories() {
    String lastSyncTimeStamp = _localDataSource.getLastSyncTimeStamp();

    return _remoteDataSource
        .getInventoryList(
      queryParams: InventoryListQueryParams(
        lastModifiedDate: lastSyncTimeStamp,
      ),
    )
        .then((response) {
      String lastSyncTimeStamp = DateParser.getDateStringFromDateTime(
        dateTime: DateParser.getCurrentUtcDateTime,
        outputDateFormat: DateParser.offsetDateFormat,
      );

      _localDataSource.setLastSyncTimeStamp(lastSyncTimeStamp);

      if (response.inventoryList != null &&
          response.inventoryList?.isNotEmpty == true) {
        List<InventoryEntityCompanion> inventories = response.inventoryList!
            .map((e) => e.toInventoryEntityCompanion())
            .toList();

        return _localDataSource.insertAllInventories(inventories);
      }
    });
  }

  @override
  Future<List<InventoryEntityData>> getInventoryList({
    required InventoryListQueryParams queryParams,
  }) {
    return _localDataSource.getInventories(queryParams);
  }

  @override
  Future<InventoryEntityData?> getInventoryByItemId(String itemId) {
    return _localDataSource.getInventoryByItemId(itemId);
  }

  @override
  Future<InventoryEntityData?> updateInventoryData(
      InventoryUpdateRequestBody request) {
    InventoryEntityCompanion inventory = request.toInventoryEntityCompanion();
    InventoryChangesEntityCompanion inventoryChanges =
        request.toInventoryChangesEntityCompanion();

    return _localDataSource
        .updateInventory(request.itemId, inventory)
        .then((_) {
      return _insertInventoryChanges(inventoryChanges).then((_) {
        return getInventoryByItemId(request.itemId);
      });
    });
  }

  @override
  Future<InventoryResponse> updateInventoryDataInServer(
      InventoryUpdateRequestBody request) {
    return _remoteDataSource.updateInventoryData(request);
  }

  @override
  Future<int> deleteInventoryChangesByItemId(String itemId) {
    return _localDataSource.deleteInventoryChangesByItemId(itemId);
  }

  @override
  Future deleteInventoryFromServer(int id) {
    return _remoteDataSource.deleteInventory(id: id);
  }

  @override
  Future deleteInventory({
    required int? id,
    required String itemId,
    bool deleteFromServer = true,
  }) {
    return _localDataSource.deleteInventory(itemId).then((_) {
      if (id != null && deleteFromServer) {
        return _localDataSource
            .addInventoryIdToDeletedInventoryEntity(
          DeletedInventoryEntityCompanion.insert(
            id: drift.Value(id),
          ),
        )
            .then((_) {
          _syncInventories();
        });
      }
    });
  }

  @override
  Future<void> deleteAllInventories() {
    return _localDataSource.deleteAllInventories();
  }

  @override
  Future<void> deleteAllInventoryChanges() {
    return _localDataSource.deleteAllInventoryChanges();
  }

  @override
  Future<List<InventoryChangesEntityData>> getAllInventoryChanges() {
    return _localDataSource.getAllInventoryChanges();
  }

  @override
  Future<List<DeletedInventoryEntityData>> getDeletedInventories() {
    return _localDataSource.getDeletedInventories();
  }

  @override
  Future<int> deleteIdFromDeletedInventory(int id) {
    return _localDataSource.deleteIdFromDeletedInventory(id);
  }

  @override
  Future<List<GlobalInventoryResponse>> getGlobalInventoryList(
      {required String query}) {
    return _remoteDataSource.getGlobalInventoryList(query);
  }

  @override
  Future<GlobalInventoryResponse> getGlobalInventory(String id) {
    return _remoteDataSource.getGlobalInventory(id);
  }

  @override
  Future<InventoryEntityData?> createInventory(
      CreateInventoryRequestBody requestBody) {
    return _localDataSource
        .insertInventory(requestBody.toInventoryEntityCompanion())
        .then(
          (_) => _insertInventoryChanges(
                  requestBody.toInventoryChangesEntityCompanion())
              .then(
            (_) {
              _syncInventories();

              return getInventoryByItemId(requestBody.itemId);
            },
          ),
        );
  }

  @override
  Future<InventoryResponse> createInventoryInServer(
      CreateInventoryRequestBody requestBody) {
    return _remoteDataSource.createInventory(requestBody).then((value) {
      _localDataSource.updateInventory(
          requestBody.itemId, value.toInventoryEntityCompanion());

      return value;
    });
  }

  @override
  Future<InventoryListResponse> getInventoryListFromRemote(
      {required InventoryListQueryParams queryParams}) {
    return _remoteDataSource.getInventoryList(queryParams: queryParams);
  }

  @override
  Future<InventoryEntityData?> replaceInventory({
    required int? oldInventoryId,
    required String oldInventoryItemId,
    required CreateInventoryRequestBody newInventory,
  }) {
    return createInventory(newInventory).then(
      (replacedInventory) => deleteInventory(
        id: oldInventoryId,
        itemId: oldInventoryItemId,
        deleteFromServer: false,
      ).then((value) => replacedInventory),
    );
  }

  Future<int> _insertInventoryChanges(
      InventoryChangesEntityCompanion inventoryChanges) {
    return _localDataSource.insertInventoryChanges(inventoryChanges);
  }

  void _syncInventories() {
    DataSyncManager().syncDataWithServer([DataSynchronizerKey.INVENTORY]);
  }
}
