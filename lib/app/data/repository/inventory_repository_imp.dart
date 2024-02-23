import 'package:dental_inventory/app/data/model/inventory_response.dart';
import 'package:dental_inventory/app/data/remote/inventory_remote_datasource.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:get/get.dart';

class InventoryRepositoryImp implements InventoryRepository {
  final InventoryRemoteDataSource inventoryDataSource = Get.find();

  @override
  Future<InventoryResponse> getInventoryList() {
    return inventoryDataSource.getInventoryList();
  }
}
