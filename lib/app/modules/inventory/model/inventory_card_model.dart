class InventoryCardUIModel {
  final String id;
  final String productName;
  final String productImageUrl;
  String maxTreshold;
  String minTreshold;
  String currentStock;
  String fixedOrderSuggestions;
  final String unit;
  final String price;
  final String productCode;
  final String productCategory;
  final String productDescription;
  final String productBrand;
  final String productSupplier;
  final String productLocation;

  InventoryCardUIModel({
    this.id = "",
    this.productName = "",
    this.productImageUrl = "",
    this.maxTreshold = "",
    this.minTreshold = "",
    this.currentStock = "",
    this.fixedOrderSuggestions = "",
    this.unit = "",
    this.price = "",
    this.productCode = "",
    this.productCategory = "",
    this.productDescription = "",
    this.productBrand = "",
    this.productSupplier = "",
    this.productLocation = "",
  });
}
