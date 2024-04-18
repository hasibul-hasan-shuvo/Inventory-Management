import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
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

  void updateProductNumber(
      SelectableInventoryItemUiModel data, String numberString) {
    if (!numberString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization.messageInvalidNumber);

      return;
    }

    int number = numberString.toInt;

    if (number > data.available) {
      showErrorMessage(appLocalization.messageItemOutValidation);

      return;
    }

    bool isItemExist = false;
    if (number == 0) {
      scannedProducts.removeWhere((element) => element.itemId == data.itemId);
    } else {
      for (ScannedProductUiModel product in scannedProducts) {
        if (product.itemId == data.itemId) {
          isItemExist = true;
          product.updateNumber(number);
          break;
        }
      }
    }
    _scannedProductsController.refresh();
    for (SelectableInventoryItemUiModel productUiModel in inventoryItems) {
      if (productUiModel.itemId == data.itemId) {
        if (number != 0 && !isItemExist) onItemAdd(productUiModel);
        productUiModel.updateNumber(number);
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
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
    );
    callDataService(
      _inventoryRepository.getInventoryList(
        queryParams: queryParams,
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
      if (res.stockCount != 0) {
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
    }
    // List<ScannedProductUiModel> list = response.inventoryList
    //         ?.map((e) => ScannedProductUiModel.fromProductResponseModel(e))
    //         .toList() ??
    //     [];

    _inventoryItemsController(temp);
  }

// void _handleUpdateInventoryDataSuccessResponse(InventoryResponse response) {}
}
