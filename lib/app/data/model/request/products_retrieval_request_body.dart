class ProductsRetrievalRequestBody {
  ProductsRetrievalRequestBody({
    this.data,
  });

  List<ScannedProductsRequestBody>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }

    return map;
  }
}

class ScannedProductsRequestBody {
  ScannedProductsRequestBody({
    this.itemId,
    this.countChange,
  });

  ScannedProductsRequestBody.fromJson(dynamic json) {
    itemId = json['item_id'];
    countChange = json['count_change'];
  }

  String? itemId;
  int? countChange;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    map['count_change'] = countChange;

    return map;
  }
}
