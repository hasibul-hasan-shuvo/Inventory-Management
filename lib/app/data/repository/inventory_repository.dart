import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';

abstract class InventoryRepository {
  Future<InventoryListResponse> getInventoryList({required String searchQuery});

  Future deleteInventory({required String id});

  Future<InventoryResponse> updateInventoryData(
      InventoryCountUpdateRequest request);

  Future<InventoryResponse> getProduct(String itemId);

  Future<ProductRetrievalResponse> retrieveProduct(
      ProductsRetrievalRequestBody requestBody);

  Future<List<GlobalInventoryResponse>> getGlobalInventoryList({
    required String query,
  });

  Future<InventoryResponse> createInventory(
      CreateInventoryRequestBody requestBody);
}
