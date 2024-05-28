import 'package:dental_inventory/app/core/values/app_values.dart';

class InventoryListQueryParams {
  InventoryListQueryParams({
    this.search,
    this.page = AppValues.defaultPageNumber,
    this.pageSize = AppValues.defaultPageSize,
    this.minAvailableQuantity,
    this.isIncludeCountInCart = false,
    this.lastModifiedDate,
  });

  String? search;
  int page;
  int pageSize;
  int? minAvailableQuantity;
  bool isIncludeCountInCart;
  String? lastModifiedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search'] = search;
    map['page'] = page;
    map['page_size'] = pageSize;
    if (minAvailableQuantity != null) {
      map['min_stock_count'] = minAvailableQuantity;
    }
    if (isIncludeCountInCart) {
      map['include_count_in_cart'] = isIncludeCountInCart;
    }
    if (lastModifiedDate != null) {
      map['modified_after'] = lastModifiedDate;
    }
    map['no_page'] = true;

    return map;
  }
}
