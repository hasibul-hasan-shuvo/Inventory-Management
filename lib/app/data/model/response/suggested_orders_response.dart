import 'package:dental_inventory/app/data/model/response/product_response.dart';

class SuggestedOrdersResponse {
  SuggestedOrdersResponse.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(SuggestedOrderResponse.fromJson(v));
      });
    }
  }

  int? count;
  String? next;
  String? previous;
  List<SuggestedOrderResponse>? results;

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

class SuggestedOrderResponse {
  SuggestedOrderResponse.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null
        ? ProductResponse.fromJson(json['product'])
        : null;
    maxCount = json['max_count'];
    minCount = json['min_count'];
    stockCount = json['stock_count'];
    suggestedOrderCount = json['suggested_order_count'];
    fixedSuggestion = json['fixed_suggestion'];
  }

  int? id;
  ProductResponse? product;
  int? maxCount;
  int? minCount;
  int? stockCount;
  int? suggestedOrderCount;
  int? fixedSuggestion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['max_count'] = maxCount;
    map['min_count'] = minCount;
    map['stock_count'] = stockCount;
    map['suggested_order_count'] = suggestedOrderCount;
    map['fixed_suggestion'] = fixedSuggestion;

    return map;
  }
}
