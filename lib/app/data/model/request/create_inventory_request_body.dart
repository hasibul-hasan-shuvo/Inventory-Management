class CreateInventoryRequestBody {
  CreateInventoryRequestBody({
    this.itemId,
  });

  String? itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_item_id'] = itemId;
    map['max_count'] = 1;
    map['min_count'] = 1;

    return map;
  }
}
