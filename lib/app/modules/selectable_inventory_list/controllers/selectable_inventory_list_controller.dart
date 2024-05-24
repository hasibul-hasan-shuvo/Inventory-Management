import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/modules/product_out/controllers/product_out_controller.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_list_page_arguments.dart';
import 'package:get/get.dart';

class SelectableInventoryListController extends BaseController {
  final RxList<SelectableInventoryItemUiModel> _inventoryItemsController =
      RxList.empty(growable: true);

  List<SelectableInventoryItemUiModel> get inventoryItems =>
      _inventoryItemsController;

  late SelectableInventoryListPageArguments pageArguments;

  final RxBool _searchModeController = RxBool(false);

  bool get isSearchable => _searchModeController.value;

  final RxString searchQuery = ''.obs;

  final InventoryRepository _inventoryRepository =
      Get.find<InventoryRepository>();

  @override
  void onInit() {
    super.onInit();
    pageArguments = Get.arguments;
    fetchInventoryList();
  }

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextSuggestedOrders();
    }
  }

  void updateProductNumber(
      SelectableInventoryItemUiModel data, String numberString) {
    if (!numberString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization.messageInvalidNumber);

      return;
    }

    int number = numberString.toInt;

    if (number > data.available &&
        pageArguments.controller is ProductOutController) {
      showErrorMessage(appLocalization.messageItemOutValidation);

      return;
    }

    if (number > AppValues.maxCountValue) {
      showErrorMessage(appLocalization.messageMaxCountThresholdValidation);

      return;
    }

    data.updateNumber(number);
    _inventoryItemsController.refresh();
    onItemAdd(data);
  }

  void onItemAdd(SelectableInventoryItemUiModel inventoryData) {
    pageArguments.controller.onProductSelect(inventoryData);
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
    pagingController.initRefresh();
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
      minAvailableQuantity: pageArguments.minAvailableProduct,
    );
    callDataService(
      _inventoryRepository.getInventoryList(
        queryParams: queryParams,
      ),
      onSuccess: _handleFetchInventoryListSuccessResponse,
    );
  }

  void _handleFetchInventoryListSuccessResponse(
      List<InventoryEntityData> response) {
    pagingController.nextPage();
    pagingController.isLastPage =
        response.isEmpty && response.length < AppValues.defaultPageSize;
    List<SelectableInventoryItemUiModel> temp = [];

    for (InventoryEntityData data in response) {
      SelectableInventoryItemUiModel model =
          SelectableInventoryItemUiModel.fromInventoryEntityData(data);

      for (ScannedProductUiModel product
          in pageArguments.controller.scannedProducts) {
        if (model.itemId == product.itemId) {
          model.number = product.number;
          break;
        }
      }

      temp.add(model);
    }

    _inventoryItemsController(temp);
  }

  void _getNextSuggestedOrders() {
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
      minAvailableQuantity: pageArguments.minAvailableProduct,
    );
    callDataService(
      _inventoryRepository.getInventoryList(
        queryParams: queryParams,
      ),
      onSuccess: _handleNextInventoryListSuccessResponse,
      onStart: () => logger.d("Fetching more inventories..."),
      onComplete: () => refreshController.loadComplete(),
    );
  }

  void _handleNextInventoryListSuccessResponse(
      List<InventoryEntityData> response) {
    pagingController.nextPage();
    pagingController.isLastPage =
        response.isEmpty && response.length < AppValues.defaultPageSize;
    List<SelectableInventoryItemUiModel> temp = [];

    for (InventoryEntityData data in response) {
      SelectableInventoryItemUiModel model =
          SelectableInventoryItemUiModel.fromInventoryEntityData(data);

      for (ScannedProductUiModel product
          in pageArguments.controller.scannedProducts) {
        if (model.itemId == product.itemId) {
          model.number = product.number;
          break;
        }
      }

      temp.add(model);
    }
    _inventoryItemsController.addAll(temp);
  }
}
