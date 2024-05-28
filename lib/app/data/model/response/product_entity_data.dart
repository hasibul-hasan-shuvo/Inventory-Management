class ScannedProductEntityData {
  final String itemId;
  final String product;
  final int stockCountChange;
  final int stockCount;

  ScannedProductEntityData({
    required this.itemId,
    required this.product,
    required this.stockCountChange,
    required this.stockCount,
  });
}
