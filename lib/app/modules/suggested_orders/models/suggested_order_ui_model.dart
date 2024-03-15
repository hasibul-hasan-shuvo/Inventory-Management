import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';

class SuggestedOrderUiModel {
  late final int id;
  late final String name;
  late final String imageUrl;
  late final int min;
  late final int max;
  late final int? fixedSuggestion;
  late int suggestion;
  late final int count;
  late final num price;

  SuggestedOrderUiModel.fromSuggestedOrderResponse(
      SuggestedOrderResponse response) {
    id = response.id ?? -1;
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    min = response.minCount ?? 0;
    max = response.maxCount ?? 0;
    count = response.stockCount ?? 0;
    price = response.product?.price ?? 0.0;
    suggestion = response.suggestedOrderCount ?? 0;
  }

  void updateSuggestion(int newSuggestion) {
    suggestion = newSuggestion;
  }
}
