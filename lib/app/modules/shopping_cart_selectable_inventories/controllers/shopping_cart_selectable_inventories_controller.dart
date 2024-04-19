import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/request/inventory_list_query_params.dart';
import 'package:dental_inventory/app/data/model/response/inventory_response.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/repository/inventory_repository.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart/controllers/shopping_cart_controller.dart';
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

  final ShoppingCartRepository _shoppingCartRepository = Get.find();

  final ShoppingCartController _shoppingCartController =
      Get.find<ShoppingCartController>();

  @override
  void onInit() {
    super.onInit();
    fetchInventoryList();
  }

  void _addCartItem(String itemId, int quantity) {
    AddShoppingCartItemRequestBody requestBody = AddShoppingCartItemRequestBody(
      itemId: itemId,
      quantity: quantity,
    );
    callDataService(
      _shoppingCartRepository.addItemInShoppingCart(requestBody),
      onSuccess: _shoppingCartRefresh,
    );
  }

  void _shoppingCartRefresh(ShoppingCartResponse response) {
    _shoppingCartController.onRefresh();
    // ShoppingCartUiModel cartItem =
    // ShoppingCartUiModel.fromShoppingCartResponse(response);
    // newCartItemArrivedController.trigger(cartItem);
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
    if (number == 0) {
    } else {
      _addCartItem(data.itemId, number);
    }
    // for (SelectableInventoryItemUiModel productUiModel in inventoryItems) {
    //   if (productUiModel.itemId == data.itemId) {
    //     if (number != 0 && !isItemExist) onItemAdd(productUiModel);
    //     productUiModel.updateNumber(number);
    //     break;
    //   }
    // }
    _inventoryItemsController.refresh();
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
    List<SelectableInventoryItemUiModel> list = response.inventoryList
            ?.map((e) =>
                SelectableInventoryItemUiModel.fromProductResponseModel(e))
            .toList() ??
        [];

    _inventoryItemsController(list);
  }
}
