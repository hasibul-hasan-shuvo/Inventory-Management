import 'package:dental_inventory/app/data/model/response/product_response.dart';

class OrderItemsResponse {
  OrderItemsResponse.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(OrderItemResponse.fromJson(v));
      });
    }
    count = json['count'];
  }

  List<OrderItemResponse>? items;
  int? count;
}

class OrderItemResponse {
  OrderItemResponse.fromJson(dynamic json) {
    quantity = json['quantity'];
    product = json['product'] != null
        ? ProductResponse.fromJson(json['product'])
        : null;
  }

  int? quantity;
  ProductResponse? product;
}
