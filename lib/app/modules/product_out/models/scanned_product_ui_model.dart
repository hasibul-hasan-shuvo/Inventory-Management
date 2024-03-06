class ScannedProductUiModel {
  late final String id;
  late final String name;
  late final String imageUrl;
  late int number;
  late final int available;

  ScannedProductUiModel.dummy(this.id) {
    name = "FILMHOLDER FOSFORPLATE #0 BW";
    imageUrl =
        "https://cdn11.bigcommerce.com/s-cff2npbnfd/images/stencil/500x250/products/9703/15565/gc-eqfc-all__23149.1685386632.png?c=1";
    number = 1;
    available = 10;
  }

  void updateNumber(int newNumber) {
    number = newNumber;
  }
}
