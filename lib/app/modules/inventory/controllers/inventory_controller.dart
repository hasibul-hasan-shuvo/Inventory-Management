import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/login_repository.dart';
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

  final RxString productID = RxString('');
  final RxString maxCount = RxString('');
  final RxString minCount = RxString('');
  final RxString stockCount = RxString('');
  final RxString productCount = RxString('');

  final InventoryRepository _inventoryRepository =
      Get.find<InventoryRepository>();
  final AuthRepository _authRepository = Get.find<AuthRepository>();

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
      filteredInventoryList.addAll(
        inventoryPageState.value.inventoryList
            .where((element) =>
                element.productName.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  Future<void> updateInventoryData() async {
    final InventoryCountUpdateRequest request = InventoryCountUpdateRequest(
      id: productID.value,
      maxCount: maxCount.value,
      minCount: minCount.value,
      stockCount: stockCount.value,
      inventoryID: _authRepository.getInventoryID(),
      product: productCount.value,
    );
    callDataService(_inventoryRepository.updateInventoryData(request),
        onSuccess: _handleUpdateInventoryDataSuccessResponse,
        onError: _handleUpdateInventoryDataError);
  }

  _handleUpdateInventoryDataError(Exception error) {
    inventoryPageState.value = InventoryPageState.error();
  }

  Future<void> fetchInventoryList() async {
    callDataService(_inventoryRepository.getInventoryList(),
        onSuccess: _handleFetchInventoryListSuccessResponse,
        onError: _handleUpdateInventoryDataError);
    filteredInventoryList.addAll(inventoryPageState.value.inventoryList);
  }

  void _handleFetchInventoryListSuccessResponse(
      InventoryResponse inventoryResponse) {
    inventoryPageState.value = InventoryPageState.success(inventoryResponse
            .data?.inventoryList
            ?.map((e) => e.toInventoryCardUIModel())
            .toList() ??
        []);
  }

  void _handleUpdateInventoryDataSuccessResponse(InventoryResponse data) {
    inventoryPageState.value.inventoryList
        .firstWhere((element) => element.productCode == productID.value)
        .maxTreshold = maxCount.value;
    inventoryPageState.value.inventoryList
        .firstWhere((element) => element.productCode == productID.value)
        .minTreshold = minCount.value;
    inventoryPageState.value.inventoryList
        .firstWhere((element) => element.productCode == productID.value)
        .fixedOrderSuggestions = productCount.value;
    inventoryPageState.value.inventoryList
        .firstWhere((element) => element.productCode == productID.value)
        .currentStock = stockCount.value;
  }
}
