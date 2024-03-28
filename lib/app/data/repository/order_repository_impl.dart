import 'package:dental_inventory/app/data/remote/order_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/order_repository.dart';
import 'package:get/get.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<bool> placeOrder() {
    return _remoteDataSource.placeOrder();
  }
}
