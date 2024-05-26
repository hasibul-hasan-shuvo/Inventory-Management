import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';

abstract class InventoryRemoteDataSource {
  Future<InventoryListResponse> getInventoryList({
    required InventoryListQueryParams queryParams,
  });

  Future deleteInventory({required String id});

  Future<InventoryResponse> updateInventoryData(
      InventoryUpdateRequestBody request);

  Future<InventoryResponse> getProduct(String itemId);

  Future<ProductRetrievalResponse> retrieveProduct(
      String inventoryId, ProductsRetrievalRequestBody requestBody);

  Future<List<GlobalInventoryResponse>> getGlobalInventoryList(String query);

  Future<GlobalInventoryResponse> getGlobalInventory(String id);

  Future<InventoryResponse> createInventory(
      CreateInventoryRequestBody requestBody);
}
