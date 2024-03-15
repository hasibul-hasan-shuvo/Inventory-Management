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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['item_id'] = itemId;
    map['image_url'] = imageUrl;
    map['price'] = price;

    return map;
  }
}
