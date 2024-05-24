import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/local/db/app_database.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/connected_cart_item.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart_selectable_inventories/model/shopping_cart_selectable_inventory_page_arguments.dart';
import 'package:get/get.dart';

class ShoppingCartSelectableInventoriesController extends BaseController {
  final RxList<SelectableInventoryItemUiModel> _inventoryItemsController =
      RxList.empty(growable: true);

  List<SelectableInventoryItemUiModel> get inventoryItems =>
      _inventoryItemsController;

  final RxBool _searchModeController = RxBool(false);

  bool get isSearchable => _searchModeController.value;

  final RxString searchQuery = ''.obs;

  final InventoryRepository _inventoryRepository =
      Get.find<InventoryRepository>();

  late ShoppingCartSelectableInventoryPageArguments pageArguments;

  final ShoppingCartRepository _shoppingCartRepository = Get.find();

  @override
  void onInit() {
    super.onInit();
    pageArguments = Get.arguments;
    fetchInventoryList();
  }

  Future<void> _addCartItem(
    SelectableInventoryItemUiModel data,
    int quantity,
  ) async {
    AddShoppingCartItemRequestBody requestBody = AddShoppingCartItemRequestBody(
      itemId: data.itemId,
      quantity: quantity,
    );

    callDataService(
      _shoppingCartRepository.addItemInShoppingCart(requestBody),
      onSuccess: (response) => _handleAddCartItemSuccessResponse(
        response,
        data,
      ),
    );
  }

  void _handleAddCartItemSuccessResponse(
    ShoppingCartResponse response,
    SelectableInventoryItemUiModel data,
  ) {
    pageArguments.controller.onItemAdded(response);
    data.addCartItem(
      ConnectedCartItemUiModel.fromShoppingCartResponse(response),
    );
    _inventoryItemsController.refresh();
  }

  void _updateCartItem(
    SelectableInventoryItemUiModel data,
    int quantity,
  ) {
    AddShoppingCartItemRequestBody requestBody = AddShoppingCartItemRequestBody(
      itemId: data.itemId,
      quantity: quantity,
    );

    callDataService(
      _shoppingCartRepository.updateItemInShoppingCart(
        data.connectedCartItem.id.toString(),
        requestBody,
      ),
      onSuccess: (response) => _handleUpdateCartSuccessResponse(
        response,
        data,
      ),
    );
  }

  void _handleUpdateCartSuccessResponse(
    ShoppingCartResponse response,
    SelectableInventoryItemUiModel data,
  ) {
    pageArguments.controller.handleUpdateCartSuccessResponse(response);
    data.updateCartItem(response.quantity!);
    _inventoryItemsController.refresh();
  }

  void _deleteCartItem(SelectableInventoryItemUiModel data) {
    if (data.connectedCartItem.isCartedItem()) {
      callDataService(
        _shoppingCartRepository.deleteItemFromShoppingCart(
          data.connectedCartItem.id.toString(),
        ),
        onSuccess: (_) => _handleDeleteCartSuccessResponse(data),
      );
    }
  }

  void _handleDeleteCartSuccessResponse(SelectableInventoryItemUiModel data) {
    pageArguments.controller.handleDeleteCartItemSuccessResponse(
      data.connectedCartItem.id,
    );
    data.deleteCartItem();
    _inventoryItemsController.refresh();
  }

  void updateProductNumber(
    SelectableInventoryItemUiModel data,
    String numberString,
  ) async {
    if (!numberString.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization.messageInvalidNumber);

      return;
    }

    int number = numberString.toInt;

    if (number == 0) {
      _deleteCartItem(data);
    } else {
      if (!data.connectedCartItem.isCartedItem()) {
        _addCartItem(data, number);
      } else {
        _updateCartItem(data, number);
      }
    }
  }

  void onLoading() {
    _getNextSuggestedOrders();
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

  void fetchInventoryList() {
    pagingController.initRefresh();
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
      isIncludeCountInCart: pageArguments.isIncludeCountInCart,
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
    List<SelectableInventoryItemUiModel> list = [];

    for (InventoryEntityData data in response) {
      SelectableInventoryItemUiModel model =
          SelectableInventoryItemUiModel.fromInventoryEntityData(data);
      list.add(model);
    }

    _inventoryItemsController(list);
  }

  void _getNextSuggestedOrders() {
    InventoryListQueryParams queryParams = InventoryListQueryParams(
      search: searchQuery.value,
      page: pagingController.pageNumber,
      isIncludeCountInCart: pageArguments.isIncludeCountInCart,
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
    List<SelectableInventoryItemUiModel> list = [];

    for (InventoryEntityData data in response) {
      SelectableInventoryItemUiModel model =
          SelectableInventoryItemUiModel.fromInventoryEntityData(data);
      list.add(model);
    }

    _inventoryItemsController.addAll(list);
  }
}
