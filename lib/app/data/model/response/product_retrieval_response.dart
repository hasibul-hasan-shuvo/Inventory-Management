class ProductRetrievalResponse {
  ProductRetrievalResponse.fromJson(dynamic json) {
    message = json['message'];
    if (json['updated_list'] != null) {
      updatedList = [];
      json['updated_list'].forEach((v) {
        updatedList?.add(ProductRetrievalUpdatedList.fromJson(v));
      });
    }
  }

  String? message;
  List<ProductRetrievalUpdatedList>? updatedList;
}

class ProductRetrievalUpdatedList {
  ProductRetrievalUpdatedList.fromJson(dynamic json) {
    itemId = json['item_id'];
    countChange = json['count_change'];
  }

  String? itemId;
  int? countChange;
}
