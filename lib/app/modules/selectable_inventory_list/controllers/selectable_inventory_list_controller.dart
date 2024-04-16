import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:get/get.dart';

class SelectableInventoryListController extends BaseController {
  final RxList<SelectableInventoryItemUiModel> _inventoryItemsController =
      RxList.empty(growable: true);

  List<SelectableInventoryItemUiModel> get inventoryItems =>
      _inventoryItemsController;

  final RxList<ScannedProductUiModel> _scannedProductsController =
      RxList.empty(growable: true);

  List<ScannedProductUiModel> get scannedProducts => _scannedProductsController;

  final RxBool _searchModeController = RxBool(false);

  bool get isSearchable => _searchModeController.value;

  final RxString searchQuery = ''.obs;

  final InventoryRepository _inventoryRepository =
      Get.find<InventoryRepository>();

  @override
  void onInit() {
    super.onInit();
    _scannedProductsController.value = Get.arguments;
    fetchInventoryList();
  }

  void onLoading() {
    _getNextSuggestedOrders();
  }

  void _getNextSuggestedOrders() {}

  // void deleteInventoryItem() {
  //   callDataService(_inventoryRepository.deleteInventory(id: id),
  //       onSuccess: _deleteSuccessHandler);
  // }

  // void _deleteSuccessHandler(e) {
  //   showSuccessMessage(appLocalization.deleteSuccessMessage);
  //   _inventoryItemsController
  //       .removeWhere((element) => element.itemId == productID);
  //   _inventoryItemsController.refresh();
  // }

  // Future<void> updateInventoryData() async {
  //   final InventoryCountUpdateRequest request = InventoryCountUpdateRequest(
  //     id: productID,
  //     maxCount: maxCount,
  //     minCount: minCount,
  //     stockCount: stockCount,
  //     inventoryID: _authRepository.getInventoryID(),
  //     fixedSuggestion: fixedSuggestion,
  //   );
  //   callDataService(
  //     _inventoryRepository.updateInventoryData(request),
  //     onSuccess: _handleUpdateInventoryDataSuccessResponse,
  //   );
  // }

  void updateProductNumber(String id, int number) {
    bool isItemExist = false;
    if (number == 0) {
      scannedProducts.removeWhere((element) => element.itemId == id);
    } else {
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == id) {
          isItemExist = true;
          product.updateNumber(number);
          break;
        }
      }
    }
    _scannedProductsController.refresh();
    for (SelectableInventoryItemUiModel productUiModel in inventoryItems) {
      if (productUiModel.itemId == id) {
        productUiModel.updateNumber(number);
        if (number != 0 && !isItemExist) onItemAdd(productUiModel);
        break;
      }
    }
    _inventoryItemsController.refresh();
  }

  void onItemAdd(SelectableInventoryItemUiModel inventoryData) {
    bool itemExistOnScanned = false;
    if (inventoryData.number + 1 < inventoryData.available) {
      for (var product in _scannedProductsController) {
        if (inventoryData.itemId == product.itemId) {
          itemExistOnScanned = true;
          inventoryData.updateNumber(inventoryData.number + 1);
          product.updateNumber(product.number + 1);
          break;
        }
      }
      _inventoryItemsController.refresh();
      if (!itemExistOnScanned) {
        ScannedProductUiModel model = ScannedProductUiModel(
          id: inventoryData.id,
          itemId: inventoryData.itemId,
          name: inventoryData.name,
          imageUrl: inventoryData.imageUrl,
          number: inventoryData.number + 1,
          available: inventoryData.available,
        );
        _scannedProductsController.add(model);
      } else {
        _scannedProductsController.refresh();
      }
    }
  }

  void changeSearchMode() {
    _searchModeController(!isSearchable);
    searchQuery('');
    if (!_searchModeController.value) {
      fetchInventoryList();
    }
  }

  void updateSearchQuery(String query) {
    searchQuery(query);
    fetchInventoryList();
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
    List<SelectableInventoryItemUiModel> temp = [];
    for (InventoryResponse res in response.inventoryList!) {
      SelectableInventoryItemUiModel model =
          SelectableInventoryItemUiModel.fromProductResponseModel(res);

      for (ScannedProductUiModel product in scannedProducts) {
        if (model.itemId == product.itemId) {
          model.number = product.number;
          break;
        }
      }

      temp.add(model);
    }
    // List<ScannedProductUiModel> list = response.inventoryList
    //         ?.map((e) => ScannedProductUiModel.fromProductResponseModel(e))
    //         .toList() ??
    //     [];

    _inventoryItemsController(temp);
  }

// void _handleUpdateInventoryDataSuccessResponse(InventoryResponse response) {}
}
