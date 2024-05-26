import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/create_inventory_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/request/inventory_update_request_body.dart';
import 'package:dental_inventory/app/data/model/request/products_retrieval_request_body.dart';
import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/product_retrieval_response.dart';

abstract class InventoryRepository {
  Future getAllInventories();

  Future<List<InventoryEntityData>> getInventoryList({
    required InventoryListQueryParams queryParams,
  });

  Future deleteInventoryFromServer(int id);

  Future deleteInventory({required int id});

  Future<List<DeletedInventoryEntityData>> getDeletedInventories();

  Future<int> deleteIdFromDeletedInventory(int id);

  Future<InventoryEntityData?> getInventoryById(int id);

  Future<InventoryEntityData?> getInventoryByItemId(String itemId);

  Future<InventoryEntityData?> updateInventoryData(
    int id,
    InventoryUpdateRequestBody request,
  );

  Future<InventoryResponse> getProduct(String itemId);

  Future<ProductRetrievalResponse> retrieveProduct(
      ProductsRetrievalRequestBody requestBody);

  Future<List<GlobalInventoryResponse>> getGlobalInventoryList({
    required String query,
  });

  Future<GlobalInventoryResponse> getGlobalInventory(String id);

  Future<InventoryResponse> createInventory(
      CreateInventoryRequestBody requestBody);
}
