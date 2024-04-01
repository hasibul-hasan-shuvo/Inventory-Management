import 'package:dental_inventory/app/data/model/response/home_counters_response.dart';
import 'package:dental_inventory/app/data/remote/home_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<HomeCountersResponse> getHomeMenuCounters() {
    return _remoteDataSource.getHomeMenuCounters();
  }
}
