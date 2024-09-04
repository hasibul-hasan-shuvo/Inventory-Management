import 'package:dental_inventory/app/data/model/response/user_response.dart';

class UserUiModel {
  late final int id;
  late final String name;
  late final int inventoryId;
  late final String customerId;

  UserUiModel.empty() {
    id = -1;
    name = '';
    inventoryId = -1;
    customerId = '';
  }

  UserUiModel.fromUserResponse(UserResponse response) {
    id = response.id ?? -1;
    name = response.name ?? '';
    inventoryId = response.inventoryId ?? -1;
    customerId = response.customerId ?? '';
  }
}
