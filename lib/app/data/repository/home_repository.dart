import 'package:dental_inventory/app/data/model/response/home_counters_response.dart';

abstract class HomeRepository {
  Future<HomeCountersResponse> getHomeMenuCounters();
}
