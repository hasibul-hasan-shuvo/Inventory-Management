import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:get/get.dart';

class InventoryRepositoryImp implements InventoryRepository {
  final InventoryRemoteDataSource _remoteDataSource = Get.find();
  final AuthRepository _authRepository = Get.find();

  @override
  Future<InventoryListResponse> getInventoryList(
      Map<String, dynamic> request) async {
    return _remoteDataSource.getInventoryList(request);
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

  @override
  Future<ProductRetrievalResponse> retrieveProduct(
      ProductsRetrievalRequestBody requestBody) {
    String inventoryId = _authRepository.getInventoryID();

    return _remoteDataSource.retrieveProduct(
      inventoryId,
      requestBody,
    );
  }

  @override
  Future deleteInventory(Map<String, dynamic> request) {
    return _remoteDataSource.deleteInventory(request);
  }
}
