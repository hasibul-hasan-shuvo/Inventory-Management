import 'package:dental_inventory/app/data/model/response/product_response.dart';

class ShoppingCartListResponse {
  ShoppingCartListResponse.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(ShoppingCartResponse.fromJson(v));
      });
    }
  }

  int? count;
  String? next;
  String? previous;
  List<ShoppingCartResponse>? results;
}

class ShoppingCartResponse {
  ShoppingCartResponse.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null
        ? ProductResponse.fromJson(json['product'])
        : null;
    quantity = json['quantity'];
    stockCount = json['stock_count'];
    price = json['price'];
    cart = json['cart'] != null ? CartResponse.fromJson(json['cart']) : null;
  }

  int? id;
  ProductResponse? product;
  int? quantity;
  int? stockCount;
  double? price;
  CartResponse? cart;
}

class CartResponse {
  CartResponse.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    invoice = json['invoice'];
  }

  int? id;
  String? status;
  String? invoice;
}
