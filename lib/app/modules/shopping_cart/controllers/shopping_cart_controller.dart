import 'dart:io';

import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/controllers/shopping_cart_scanned_products_controller_mixin.dart';
import 'package:dental_inventory/app/core/services/scanner/scanner_service.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/data/model/request/add_shopping_cart_item_request_body.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/model/response/shopping_cart_total_price_response.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_total_price_ui_model.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:dental_inventory/app/network/exceptions/api_exception.dart';
import 'package:get/get.dart';

class ShoppingCartController extends BaseController
    with ShoppingCartScannedProductsControllerMixin {
  final ShoppingCartRepository _repository = Get.find();

  final Rx<ShoppingCartTotalPriceUiModel> _totalPriceController =
      Rx(ShoppingCartTotalPriceUiModel.empty());

  ShoppingCartTotalPriceUiModel get totalPrice => _totalPriceController.value;

  final RxBool unavailableProductOrderErrorController = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    pagingController.initRefresh();
    _getCartItems(false);
    _getTotalPrice();
  }

  @override
  void onClose() {
    closeShoppingCartScannedProductsController();
    _totalPriceController.close();
    unavailableProductOrderErrorController.close();
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    ScannerService.close();

    return super.onDelete;
  }

  @override
  void onItemAdded(ShoppingCartResponse response) {
    onRefresh();
  }

  void clearUnavailableProductOrderErrorController() {
    unavailableProductOrderErrorController(false);
  }

  void onRefresh() {
    pagingController.initRefresh();
    _getCartItems(true);
    _getTotalPrice();
  }

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextCartItems();
    }
  }

  void _getTotalPrice() {
    callDataService(
      _repository.getTotalPrice(),
      onStart: () => logger.d("Fetching total price"),
      onComplete: () => logger.d("Fetched total price"),
      onSuccess: _handleTotalPriceSuccessResponse,
      enableErrorMessage: false,
    );
  }

  void _handleTotalPriceSuccessResponse(
      ShoppingCartTotalPriceResponse response) {
    _totalPriceController(
      ShoppingCartTotalPriceUiModel.fromShoppingCartTotalPriceResponse(
        response,
      ),
    );
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

    addAllProduct(list);
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

  void confirmOrder({bool removeUnavailableProducts = false}) {
    callDataService(
      _repository.placeOrder(
        removeUnavailableProducts: removeUnavailableProducts,
      ),
      enableErrorMessage: false,
      onSuccess: handleConfirmOrderSuccessResponse,
      onError: _handleConfirmOrderError,
    );
  }

  void _handleConfirmOrderError(Exception e) {
    if (e is ApiException && e.httpCode == HttpStatus.conflict) {
      unavailableProductOrderErrorController.trigger(true);
    }
  }

  void updateCartCount(ShoppingCartUiModel data, String count) {
    if (!count.isPositiveIntegerNumber) {
      showErrorMessage(
        appLocalization
            .messageInvalidItemNumber(appLocalization.homeMenuShoppingCart),
      );

      return;
    }
    int cartCount = count.toInt;
    if (cartCount <= 0) {
      deleteCartItem(data);
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
      onSuccess: (response) {
        _getTotalPrice();
        handleUpdateCartSuccessResponse(response);
      },
    );
  }

  Future<bool> deleteCartItem(ShoppingCartUiModel data) {
    return callDataService(
      _repository.deleteItemFromShoppingCart(
        data.id.toString(),
      ),
      onSuccess: (_) {
        _getTotalPrice();
        handleDeleteCartItemSuccessResponse(data.id);
      },
    );
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

      onRefreshProduct();
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

  void getProductPrice(ShoppingCartUiModel data) {
    callDataService(
      _repository.getProductPrice(data.itemId),
      onSuccess: (response) => data.updatePrice((response.data?.price ?? 0).toDouble()),
      onError: (error) => data.updatePrice(0.0),
      onStart: () => logger.d("Fetching product price"),
      onComplete: () => logger.d("Product price fetched"),
    );
  }
}
