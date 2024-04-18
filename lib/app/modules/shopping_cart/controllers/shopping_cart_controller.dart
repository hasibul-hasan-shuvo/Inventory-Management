import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:get/get.dart';

class ShoppingCartController extends BaseController {
  final ShoppingCartRepository _repository = Get.find();

  final RxList<ShoppingCartUiModel> _shoppingCartItemsController =
      RxList.empty(growable: true);

  List<ShoppingCartUiModel> get shoppingCartItems =>
      _shoppingCartItemsController;

  Rx<ShoppingCartUiModel?> newCartItemArrivedController = Rx(null);

  @override
  void onInit() {
    super.onInit();
    pagingController.initRefresh();
    _getCartItems(false);
  }

  void onRefresh() {
    pagingController.initRefresh();
    _getCartItems(true);
  }

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextCartItems();
    }
  }

  void _getCartItems(bool isRefreshing) {
    callDataService(
      _repository.getActiveShoppingCart(
        pagingController.pageNumber,
      ),
      onSuccess: _handleShoppingCartSuccessResponse,
      onStart: isRefreshing ? () => logger.d("Fetching cart items") : null,
      onComplete:
          isRefreshing ? () => refreshController.refreshCompleted() : null,
    );
  }

  void _handleShoppingCartSuccessResponse(ShoppingCartListResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<ShoppingCartUiModel> list = response.results
            ?.map((e) => ShoppingCartUiModel.fromShoppingCartResponse(e))
            .toList() ??
        [];

    _shoppingCartItemsController(list);
  }

  void _getNextCartItems() {
    callDataService(
      _repository.getActiveShoppingCart(
        pagingController.pageNumber,
      ),
      onSuccess: _handleNextShoppingCartSuccessResponse,
      onStart: () => logger.d("Fetching more suggested orders"),
      onComplete: () => refreshController.loadComplete(),
    );
  }

  void _handleNextShoppingCartSuccessResponse(
      ShoppingCartListResponse response) {
    pagingController.nextPage();
    pagingController.isLastPage = response.next == null;
    List<ShoppingCartUiModel> list = shoppingCartItems;
    list.addAll(response.results
            ?.map((e) => ShoppingCartUiModel.fromShoppingCartResponse(e))
            .toList() ??
        []);
  }

  void confirmOrder() {
    callDataService(
      _repository.placeOrder(),
      onSuccess: _handleConfirmOrderSuccessResponse,
    );
  }

  void _handleConfirmOrderSuccessResponse(bool isSuccess) {
    if (isSuccess) {
      _shoppingCartItemsController.clear();
    }
  }

  void updateCartCount(ShoppingCartUiModel data, String count) {
    if (!count.isPositiveIntegerNumber) {
      showErrorMessage(appLocalization
          .messageInvalidItemNumber(appLocalization.homeMenuShoppingCart));

      return;
    }
    int cartCount = count.toInt;
    if (cartCount <= 0) {
      _deleteCartItem(data);
    } else {
      _updateCartItem(data, cartCount);
    }
  }

  void _updateCartItem(ShoppingCartUiModel data, int cartCount) {
    AddShoppingCartItemRequestBody requestBody = AddShoppingCartItemRequestBody(
      itemId: data.itemId,
      quantity: cartCount,
    );

    callDataService(
      _repository.updateItemInShoppingCart(
        data.id.toString(),
        requestBody,
      ),
      onSuccess: (response) => _handleUpdateCartSuccessResponse(data, response),
    );
  }

  void _handleUpdateCartSuccessResponse(
      ShoppingCartUiModel data, ShoppingCartResponse response) {
    data.updateCartCount(response.quantity ?? 0);
    _shoppingCartItemsController.refresh();
  }

  void _deleteCartItem(ShoppingCartUiModel data) {
    callDataService(
      _repository.deleteItemFromShoppingCart(
        data.id.toString(),
      ),
      onSuccess: (_) => _handleDeleteCartItemSuccessResponse(data),
    );
  }

  void _handleDeleteCartItemSuccessResponse(ShoppingCartUiModel data) {
    _shoppingCartItemsController
        .removeWhere((element) => element.id == data.id);
  }

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ShoppingCartUiModel product in shoppingCartItems) {
        if (product.itemId == code) {
          isListItem = true;
          _updateCartItem(product, product.cartCount + 1);
          break;
        }
      }
      if (!isListItem) {
        _addCartItem(code!);
      }

      _shoppingCartItemsController.refresh();
    }
  }

  void _addCartItem(String itemId) {
    AddShoppingCartItemRequestBody requestBody =
        AddShoppingCartItemRequestBody(itemId: itemId);
    callDataService(
      _repository.addItemInShoppingCart(requestBody),
      onSuccess: _handleAddCartItemSuccessResponse,
    );
  }

  void _handleAddCartItemSuccessResponse(ShoppingCartResponse response) {
    onRefresh();
    ShoppingCartUiModel cartItem =
        ShoppingCartUiModel.fromShoppingCartResponse(response);
    newCartItemArrivedController.trigger(cartItem);
  }

  void clearNewCartArrivedController() {
    newCartItemArrivedController.trigger(null);
  }
}
