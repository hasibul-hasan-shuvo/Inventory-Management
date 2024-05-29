class ScannedProductEntityData {
  final int? id;
  final String itemId;
  final String product;
  final int stockCountChange;
  final int stockCount;

  ScannedProductEntityData({
    required this.id,
    required this.itemId,
    required this.product,
    required this.stockCountChange,
    required this.stockCount,
  });
}
