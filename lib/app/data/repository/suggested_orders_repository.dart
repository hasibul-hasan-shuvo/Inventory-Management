import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';

abstract class SuggestedOrdersRepository {
  Future<SuggestedOrdersResponse> getSuggestedOrders(int page);
}
