class HomeCountersResponse {
  HomeCountersResponse.fromJson(dynamic json) {
    suggestedOrderItems = json['suggested_order_items'];
    activeCartItems = json['active_cart_items'];
    activeOrders = json['active_orders'];
    completedOrders = json['completed_orders'];
  }

  int? suggestedOrderItems;
  int? activeCartItems;
  int? activeOrders;
  int? completedOrders;

  Map<String, int?> toJson() {
    final map = <String, int?>{};
    map['suggested_order_items'] = suggestedOrderItems;
    map['active_cart_items'] = activeCartItems;
    map['active_orders'] = activeOrders;
    map['completed_orders'] = completedOrders;

    return map;
  }
}
