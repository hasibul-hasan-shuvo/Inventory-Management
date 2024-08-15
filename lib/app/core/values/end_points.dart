abstract class EndPoints {
  static const String login = '/accounts/token/obtain/';
  static const String refreshToken = '/accounts/token/refresh/';
  static const String userData = '/accounts/me/';
  static const String inventory = '/inventory';
  static const String inventoryItems = '/inventory/items';
  static const String suggestedOrders = '/inventory/suggested-order-list/';
  static const String activeShoppingCart = '/shopping/active-cart/items/';
  static const String addShoppingCartItems = '/shopping/active-cart/add-item/';
  static const String placeOrder = '/shopping/active-cart/place-order/';
  static const String orders = '/shopping/orders';
  static const String globalInventory = '/inventory/search-products/';
  static const String homeCounters = '/inventory/miscellaneous-counts/';
  static const String shoppingCartTotalPrice =
      '/shopping/active-cart/total-price/';
}
