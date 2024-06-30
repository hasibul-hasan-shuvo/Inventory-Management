import 'package:dental_inventory/app/data/model/response/shopping_cart_total_price_response.dart';

class ShoppingCartTotalPriceUiModel {
  late final int id;
  late final num totalPrice;
  late final num taxRate;

  ShoppingCartTotalPriceUiModel.fromShoppingCartTotalPriceResponse(
      ShoppingCartTotalPriceResponse response) {
    id = response.id ?? -1;
    totalPrice = response.totalPrice ?? 0;
    taxRate = response.taxRate ?? 0;
  }

  ShoppingCartTotalPriceUiModel.empty()
      : id = -1,
        totalPrice = 0,
        taxRate = 0;

  bool get isZero => totalPrice == 0;
}
