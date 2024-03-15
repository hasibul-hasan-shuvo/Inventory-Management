import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:dental_inventory/app/data/remote/suggested_orders_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/suggested_orders_repository.dart';
import 'package:get/get.dart';

class SuggestedOrdersRepositoryImpl implements SuggestedOrdersRepository {
  final SuggestedOrdersRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<SuggestedOrdersResponse> getSuggestedOrders(int page) {
    return _remoteDataSource.getSuggestedOrders(page);
  }
}
