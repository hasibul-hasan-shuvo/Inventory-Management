class CreateInventoryRequestBody {
  CreateInventoryRequestBody({
    this.itemId,
  });

  String? itemId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_item_id'] = itemId;

    return map;
  }
}
