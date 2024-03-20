class UserResponse {
  UserResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    inventoryId = json['inventory_id'];
  }

  int? id;
  String? name;
  int? inventoryId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'inventory_id': inventoryId,
    };
  }
}
