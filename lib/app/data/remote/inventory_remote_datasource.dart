import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';

abstract class InventoryRemoteDataSource {
  Future<InventoryListResponse> getInventoryList(Map<String, dynamic> request);

  Future deleteInventory(Map<String, dynamic> request);

  Future<InventoryResponse> updateInventoryData(
      InventoryCountUpdateRequest request);

  Future<InventoryResponse> getProduct(String itemId);

  Future<ProductRetrievalResponse> retrieveProduct(
      String inventoryId, ProductsRetrievalRequestBody requestBody);
}
