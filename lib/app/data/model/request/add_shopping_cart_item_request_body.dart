class AddShoppingCartItemRequestBody {
  final String itemId;
  final int quantity;

  AddShoppingCartItemRequestBody({
    required this.itemId,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product_item_id": itemId,
      };
}
