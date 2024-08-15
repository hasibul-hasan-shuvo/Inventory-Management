class ShoppingCartTotalPriceResponse {
  ShoppingCartTotalPriceResponse.fromJson(dynamic json) {
    id = json['id'];
    totalPrice = json['total_price'];
    taxRate = json['tax_rate'];
  }

  int? id;
  num? totalPrice;
  num? taxRate;
}
