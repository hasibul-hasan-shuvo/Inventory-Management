import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/model/request/inventory_count_update_request.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/repository/auth_repository.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:get/get.dart';

class InventoryController extends BaseController {
  final RxList<InventoryCardUIModel> _inventoryItemsController =
      RxList.empty(growable: true);

  List<InventoryCardUIModel> get inventoryItems => _inventoryItemsController;

  final RxBool isSearchMode = false.obs;

  final RxString searchQuery = ''.obs;

  String productID = '';
  String id = '';
  String maxCount = '';
  String minCount = '';
  String stockCount = '';
  String fixedSuggestion = '';

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

  void changeSearchMode() {
    isSearchMode.value = !isSearchMode.value;
    searchQuery('');
    if (!isSearchMode.value) {
      fetchInventoryList();
    }
  }

  void updateSearchQuery(String query) {
    searchQuery(query);
    fetchInventoryList();
  }

  void deleteInventoryItem() {
    callDataService(_inventoryRepository.deleteInventory(id: id),
        onSuccess: _deleteSuccessHandler);
  }

  void _deleteSuccessHandler(e) {
    showSuccessMessage(appLocalization.deleteSuccessMessage);
    _inventoryItemsController.removeWhere((element) => element.id == id);
    _inventoryItemsController.refresh();
  }

  Future<void> updateInventoryData() async {
    final InventoryCountUpdateRequest request = InventoryCountUpdateRequest(
      id: productID,
      maxCount: maxCount,
      minCount: minCount,
      stockCount: stockCount,
      inventoryID: _authRepository.getInventoryID(),
      fixedSuggestion: fixedSuggestion,
    );
    callDataService(
      _inventoryRepository.updateInventoryData(request),
      onSuccess: _handleUpdateInventoryDataSuccessResponse,
    );
  }

  Future<void> fetchInventoryList() async {
    callDataService(
      _inventoryRepository.getInventoryList(
        searchQuery: searchQuery.value,
      ),
      onSuccess: _handleFetchInventoryListSuccessResponse,
    );
  }

  void _handleFetchInventoryListSuccessResponse(
      InventoryListResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<InventoryCardUIModel> list = response.inventoryList
            ?.map((e) => InventoryCardUIModel.fromInventoryResponse(e))
            .toList() ??
        [];
    _inventoryItemsController(list);
  }

  void _handleUpdateInventoryDataSuccessResponse(InventoryResponse data) {
    for (var element in inventoryItems) {
      if (element.productCode == data.product?.itemId.toString()) {
        element.maxTreshold = data.maxCount.toString();
        element.minTreshold = data.minCount.toString();
        element.currentStock = data.stockCount.toString();
        element.fixedOrderSuggestions = data.fixedSuggestion.toString();
      }
    }
  }
}
