import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
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

  @override
  void onInit() {
    super.onInit();
    pagingController.initRefresh();
    _getSuggestedOrders();
  }

  void onLoading() {
    if (pagingController.canLoadNextPage()) {
      _getNextSuggestedOrders();
    }
  }

  void _getSuggestedOrders() {
    callDataService(
      _repository.getActiveShoppingCart(
        pagingController.pageNumber,
      ),
      onSuccess: _handleShoppingCartSuccessResponse,
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

  void _getNextSuggestedOrders() {
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

  void orderAll() {
    logger.d("Ordering all items");
  }

  void updateCartCount() {
    _shoppingCartItemsController.refresh();
  }

  void onScanned(String? code) {
    if (code.isNotNullOrEmpty) {
      bool isListItem = false;
      for (ShoppingCartUiModel product in shoppingCartItems) {
        if (product.id == code) {
          isListItem = true;
          product.updateCartCount(product.cartCount + 1);
          break;
        }
      }
      if (!isListItem) {
        // TODO: fetch cart item and add data
        // _shoppingCartItemsController.add(ShoppingCartUiModel.dummy(code!));
      }

      _shoppingCartItemsController.refresh();
    }
  }
}
