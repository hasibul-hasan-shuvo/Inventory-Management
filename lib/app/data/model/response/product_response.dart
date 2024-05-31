class ProductResponse {
  ProductResponse({
    this.id,
    this.name,
    this.itemId,
    this.imageUrl,
    this.price,
  });
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
  num? price;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'item_id': itemId,
      'image_url': imageUrl,
      'price': price,
    };
  }
}
