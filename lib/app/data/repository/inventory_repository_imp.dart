import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:get/get.dart';

class InventoryRepositoryImp implements InventoryRepository {
  final InventoryRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<InventoryListResponse> getInventoryList() async {
    return _remoteDataSource.getInventoryList();
  }

  @override
  Future<InventoryResponse> updateInventoryData(
      InventoryCountUpdateRequest request) {
    return _remoteDataSource.updateInventoryData(request);
  }

  @override
  Future<InventoryResponse> getProduct(String itemId) {
    return _remoteDataSource.getProduct(itemId);
  }
}
