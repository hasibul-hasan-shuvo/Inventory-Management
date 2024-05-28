import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';

import '../../login/models/auth_page_state.dart';

class InventoryPageState {
  final PageStatus pageStatus;
  final List<InventoryUIModel> inventoryList;

  InventoryPageState({
    required this.pageStatus,
    required this.inventoryList,
  });

  factory InventoryPageState.initial() {
    return InventoryPageState(
      pageStatus: PageStatus.initial,
      inventoryList: [],
    );
  }

  factory InventoryPageState.loading() {
    return InventoryPageState(
      pageStatus: PageStatus.loading,
      inventoryList: [],
    );
  }

  factory InventoryPageState.success(List<InventoryUIModel> inventoryList) {
    return InventoryPageState(
      pageStatus: PageStatus.success,
      inventoryList: inventoryList,
    );
  }

  factory InventoryPageState.error() {
    return InventoryPageState(
      pageStatus: PageStatus.error,
      inventoryList: [],
    );
  }
}
