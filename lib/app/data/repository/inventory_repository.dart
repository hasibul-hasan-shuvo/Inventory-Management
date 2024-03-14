import 'package:dental_inventory/app/data/model/inventory_response.dart';

abstract class InventoryRepository{
  Future<InventoryResponse> getInventoryList();
}