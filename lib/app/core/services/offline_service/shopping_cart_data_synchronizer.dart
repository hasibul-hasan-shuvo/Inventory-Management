import 'package:dental_inventory/app/core/services/offline_service/data_synchronizer.dart';

class ShoppingCartDataSynchronizer implements DataSynchronizer {
  static final ShoppingCartDataSynchronizer _instance =
      ShoppingCartDataSynchronizer._internal();

  factory ShoppingCartDataSynchronizer() => _instance;

  ShoppingCartDataSynchronizer._internal();

  @override
  Future syncData() {
    // TODO: implement syncData
    return Future.value();
  }
}
