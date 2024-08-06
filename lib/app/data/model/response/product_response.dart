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
    isAvailable = json['is_available'];
    alternativeProductId = json['alternative_product_id'];
    taxRate = json['tax_rate'].toDouble();
    priceWithTax = json['price_with_tax'];
  }

  int? id;
  String? name;
  String? itemId;
  String? imageUrl;
  num? price;
  bool? isAvailable;
  String? alternativeProductId;
  double? taxRate;
  double? priceWithTax;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'item_id': itemId,
      'image_url': imageUrl,
      'price': price,
      'is_available': isAvailable,
      'alternative_product_id': alternativeProductId,
    };
  }
}
