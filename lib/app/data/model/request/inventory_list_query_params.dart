import 'package:dental_inventory/app/core/values/app_values.dart';

class InventoryListQueryParams {
  InventoryListQueryParams({
    this.search,
    this.page,
    this.minAvailableQuantity,
    this.isIncludeCountInCart = false,
  });

  String? search;
  int? page;
  int? minAvailableQuantity;
  bool isIncludeCountInCart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search'] = search;
    map['page'] = page;
    map['page_size'] = AppValues.defaultPageSize;
    if (minAvailableQuantity != null) {
      map['min_stock_count'] = minAvailableQuantity;
    }
    if (isIncludeCountInCart) {
      map['include_count_in_cart'] = isIncludeCountInCart;
    }

    return map;
  }
}
