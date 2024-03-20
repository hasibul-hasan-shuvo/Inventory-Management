class ProductResponse {
  ProductResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    itemId = json['item_id'];
    imageUrl = json['image_url'];
    price = json['price'];
  }

  int? id;
  String? name;
  String? itemId;
  String? imageUrl;
  double? price;
}
