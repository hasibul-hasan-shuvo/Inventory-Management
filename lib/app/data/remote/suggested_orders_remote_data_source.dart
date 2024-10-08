import 'package:dental_inventory/app/data/model/request/list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';

abstract class SuggestedOrdersRemoteDataSource {
  Future<SuggestedOrdersResponse> getSuggestedOrders(int page);

  Future<SuggestedOrdersResponse> getFixedSuggestedOrders(
      ListQueryParams queryParams);
}
