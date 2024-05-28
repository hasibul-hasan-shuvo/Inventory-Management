import 'package:dental_inventory/app/core/services/offline_service/inventory_data_synchronizer.dart';
import 'package:dental_inventory/app/core/services/offline_service/models/data_synchronizer_key.dart';
import 'package:dental_inventory/app/core/services/offline_service/shopping_cart_data_synchronizer.dart';

abstract class DataSynchronizer {
  factory DataSynchronizer.create(DataSynchronizerKey key) {
    switch (key) {
      case DataSynchronizerKey.INVENTORY:
        return InventoryDataSynchronizer();
      case DataSynchronizerKey.CART:
        return ShoppingCartDataSynchronizer();
    }
  }

  Future syncData();
}
