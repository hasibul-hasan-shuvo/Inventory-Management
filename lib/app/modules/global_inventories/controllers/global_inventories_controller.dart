import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:get/get.dart';

class GlobalInventoriesController extends BaseController {
  final RxBool _searchModeController = RxBool(true);

  bool get isSearchable => _searchModeController.value;

  final RxString searchQuery = RxString('');

  void changeSearchMode() {
    _searchModeController(!isSearchable);
    searchQuery('');
    if (!_searchModeController.value) {
      // fetchInventoryList();
    }
  }

  void updateSearchQuery(String query) {
    searchQuery(query);
    // fetchInventoryList();
  }

  void onScanned(String? code) {}
}
