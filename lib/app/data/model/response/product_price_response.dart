class ProductPriceResponse {
  String? message;
  ProductPriceDataResponse? data;

  ProductPriceResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null
        ? ProductPriceDataResponse.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class ProductPriceDataResponse {
  int? customerId;
  double? price;
  String? productItemId;

  ProductPriceDataResponse.fromJson(dynamic json) {
    customerId = json['customer_id'];
    price = json['price'];
    productItemId = json['product_item_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'price': price,
      'product_item_id': productItemId,
    };
  }
}
