import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';

abstract class InventoryRepository {
  Future<InventoryListResponse> getInventoryList();

  Future<InventoryListResponse> updateInventoryData(
      InventoryCountUpdateRequest request);
}
