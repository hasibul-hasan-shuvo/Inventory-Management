class SuggestedOrderUiModel {
  late final int id;
  late final String name;
  late final String imageUrl;
  late final int min;
  late final int max;
  int? suggestion;
  late final int count;
  late final num price;

  SuggestedOrderUiModel.dummy() {
    id = 12345;
    name = "Filmholder fosforplate #0 bw";
    imageUrl =
        "https://cdn11.bigcommerce.com/s-cff2npbnfd/images/stencil/500x250/products/9703/15565/gc-eqfc-all__23149.1685386632.png?c=1";
    min = 10;
    max = 100;
    count = 5;
    price = 100;
  }

  void updateFixedSuggestedOrder(int newFixedSuggestedOrder) {
    suggestion = newFixedSuggestedOrder;
  }
}
