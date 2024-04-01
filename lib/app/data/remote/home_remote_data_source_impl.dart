import 'package:dental_inventory/app/core/base/base_remote_source.dart';
import 'package:dental_inventory/app/core/values/end_points.dart';
import 'package:dental_inventory/app/data/model/response/home_counters_response.dart';
import 'package:dental_inventory/app/data/remote/home_remote_data_source.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSourceImpl extends BaseRemoteSource
    implements HomeRemoteDataSource {
  @override
  Future<HomeCountersResponse> getHomeMenuCounters() {
    try {
      String endpoint = EndPoints.homeCounters;
      var dioCall = dioClient.get(endpoint);

      return callApiWithErrorParser(dioCall)
          .then((response) => _parseHomeCountersResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  HomeCountersResponse _parseHomeCountersResponse(Response<dynamic> response) {
    return HomeCountersResponse.fromJson(response.data);
  }
}
