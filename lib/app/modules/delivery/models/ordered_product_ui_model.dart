class OrderedProductUiModel {
  final int id;
  final String itemId;
  final String name;
  final int quantity;
  final int deliveredQuantity;
  final int notDeliveredQuantity;
  final double price;
  final String imageUrl;

  OrderedProductUiModel({
    required this.id,
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.deliveredQuantity,
    required this.notDeliveredQuantity,
    required this.price,
    required this.imageUrl,
  });
}
