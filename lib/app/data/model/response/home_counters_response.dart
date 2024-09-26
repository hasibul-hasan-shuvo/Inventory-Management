class HomeCountersResponse {
  HomeCountersResponse.fromJson(dynamic json) {
    fixedSuggestions = json['fixed_suggestions'];
    suggestedOrderItems = json['suggested_order_items'];
    activeCartItems = json['active_cart_items'];
    activeOrders = json['active_orders'];
    completedOrders = json['completed_orders'];
  }

  int? fixedSuggestions;
  int? suggestedOrderItems;
  int? activeCartItems;
  int? activeOrders;
  int? completedOrders;

  Map<String, int?> toJson() {
    final map = <String, int?>{};
    map['fixed_suggestions'] = fixedSuggestions;
    map['suggested_order_items'] = suggestedOrderItems;
    map['active_cart_items'] = activeCartItems;
    map['active_orders'] = activeOrders;
    map['completed_orders'] = completedOrders;

    return map;
  }
}
