import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/suggested_orders_response.dart';
import 'package:get/get.dart';

class SuggestedOrderUiModel {
  late final int id;
  late final String name;
  late final String imageUrl;
  late final String itemId;
  late final int min;
  late final int max;
  late final int? fixedSuggestion;
  late int suggestion;
  late final int count;
  late final RxNum _priceController = RxNum(0.0);
  late bool isAvailableInCart;

  num get price => _priceController.value;

  SuggestedOrderUiModel.fromSuggestedOrderResponse(
      SuggestedOrderResponse response) {
    id = response.id ?? -1;
    name = response.product?.name ?? '';
    imageUrl = response.product?.imageUrl ?? '';
    itemId = response.product?.itemId ?? '';
    min = response.minCount ?? 0;
    max = response.maxCount ?? 0;
    count = response.stockCount ?? 0;
    _priceController(response.product?.price ?? 0.0);
    suggestion = response.suggestedOrderCount ?? 0;
    isAvailableInCart = (response.quantityInCart ?? 0) > 0;
  }

  void updateSuggestion(int newSuggestion) {
    suggestion = newSuggestion;
  }

  void updatePrice(num? newPrice) {
    _priceController(newPrice ?? 0.0);
  }

  void updateAvailabilityInCart(bool isAvailable) {
    isAvailableInCart = isAvailable;
  }

  AddShoppingCartItemRequestBody toAddShoppingCartItemRequestBody() {
    return AddShoppingCartItemRequestBody(
      itemId: itemId,
      quantity: suggestion,
    );
  }

  void close() {
    _priceController.close();
  }
}
