import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';

class InventoryDataSynchronizer implements DataSynchronizer {
  static final InventoryDataSynchronizer _instance =
      InventoryDataSynchronizer._internal();

  factory InventoryDataSynchronizer() => _instance;

  InventoryDataSynchronizer._internal();

  @override
  Future syncData() {
    // TODO: implement syncData
    throw UnimplementedError();
  }
}
