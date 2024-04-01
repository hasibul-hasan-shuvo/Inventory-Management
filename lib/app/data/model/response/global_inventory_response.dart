class GlobalInventoryResponse {
  GlobalInventoryResponse.fromJson(dynamic json) {
    name = json['name'];
    itemId = json['item_id'];
    imageUrl = json['image_url'];
  }

  String? name;
  String? itemId;
  String? imageUrl;
}
