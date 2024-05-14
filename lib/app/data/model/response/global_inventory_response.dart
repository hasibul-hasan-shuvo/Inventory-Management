class GlobalInventoryResponse {
  GlobalInventoryResponse.fromJson(dynamic json) {
    name = json['name'];
    itemId = json['item_id'];
    imageUrl = json['image_url'];
    isOutdated = json['is_outdated'];
    alternativeProductId = json['alternative_product_id'];
  }

  String? name;
  String? itemId;
  String? imageUrl;
  bool? isOutdated;
  String? alternativeProductId;
}
