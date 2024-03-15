import 'package:dental_inventory/app/data/local/preference/auth_local_data_source.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:get/get.dart';

class InventoryRepositoryImp implements InventoryRepository {
  final InventoryRemoteDataSource inventoryDataSource = Get.find();
  final AuthLocalDataSource authLocalDataSource = Get.find();

  @override
  Future<InventoryListResponse> getInventoryList() async {
    return inventoryDataSource.getInventoryList();
  }

  @override
  Future<InventoryListResponse> updateInventoryData(
      InventoryCountUpdateRequest request) {
    return inventoryDataSource.updateInventoryData(request);
  }
}
