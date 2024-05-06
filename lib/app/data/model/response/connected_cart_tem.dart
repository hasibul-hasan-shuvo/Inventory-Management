class ConnectedCartItem {
  ConnectedCartItem.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
  }

  ConnectedCartItem.fromResponseModel(
    int this.id,
    int this.quantity,
  );

  int? id;
  int? quantity;
}
