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
}
