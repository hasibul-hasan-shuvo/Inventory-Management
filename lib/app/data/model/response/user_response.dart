class UserResponse {
  UserResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    inventoryId = json['inventory_id'];
    customerId = json['customer_id'];
  }

  int? id;
  String? name;
  int? inventoryId;
  String? customerId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'inventory_id': inventoryId,
      'customer_id': customerId,
    };
  }
}
