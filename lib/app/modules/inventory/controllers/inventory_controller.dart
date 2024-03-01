import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/model/inventory_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_page_state.dart';
import 'package:get/get.dart';

class InventoryController extends BaseController {
  final RxBool isSearchMode = false.obs;
  final RxList<InventoryCardUIModel> filteredInventoryList =
      <InventoryCardUIModel>[].obs;
  final RxString searchQuery = ''.obs;
  final Rx<InventoryPageState> inventoryPageState =
      InventoryPageState.initial().obs;

  final _inventoryRepository = Get.find<InventoryRepository>();

  @override
  void onInit() {
    super.onInit();
    fetchInventoryList();
  }

  void onLoading() {
    _getNextSuggestedOrders();
  }

  void _getNextSuggestedOrders() {}

  changeSearchMode() {
    isSearchMode.value = !isSearchMode.value;
    searchQuery('');
    updateSearchQuery(searchQuery.value);
  }

  updateSearchQuery(String query) {
    searchQuery(query);
    if (query.isEmpty) {
      filteredInventoryList.clear();
      filteredInventoryList.addAll(inventoryPageState.value.inventoryList);
    } else {
      filteredInventoryList.clear();
      filteredInventoryList.addAll(inventoryPageState.value.inventoryList
          .where((element) =>
              element.productName.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  Future<void> fetchInventoryList() async {
    callDataService(_inventoryRepository.getInventoryList(),
        onSuccess: _handleFetchInventoryListSuccessResponse, onError: (error) {
      inventoryPageState.value = InventoryPageState.error();
    });
    filteredInventoryList.addAll(inventoryPageState.value.inventoryList);
  }

  _handleFetchInventoryListSuccessResponse(InventoryResponse data) {
    inventoryPageState.value = InventoryPageState.success(data
            .data?.inventoryList
            ?.map((e) => e.toInventoryCardUIModel())
            .toList() ??
        []);
  }
}
