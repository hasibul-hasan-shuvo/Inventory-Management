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
    this.currentStock,
  });

  String? itemId;
  int? countChange;
  int? currentStock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    if (countChange != null) {
      map['count_change'] = countChange;
    }

    if (currentStock != null) {
      map['stock_count'] = currentStock;
    }

    return map;
  }
}
