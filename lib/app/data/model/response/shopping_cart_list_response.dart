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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class ShoppingCartResponse {
  ShoppingCartResponse.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null
        ? ProductResponse.fromJson(json['product'])
        : null;
    quantity = json['quantity'];
    cart = json['cart'] != null ? CartResponse.fromJson(json['cart']) : null;
  }

  int? id;
  ProductResponse? product;
  int? quantity;
  CartResponse? cart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['quantity'] = quantity;
    if (cart != null) {
      map['cart'] = cart?.toJson();
    }

    return map;
  }
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['invoice'] = invoice;

    return map;
  }
}
