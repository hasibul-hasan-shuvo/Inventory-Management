import 'package:dental_inventory/app/core/values/app_values.dart';

class InventoryListQueryParams {
  InventoryListQueryParams({
    this.search,
    this.page,
  });

  String? search;
  int? page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search'] = search;
    map['page'] = page;
    map['page_size'] = AppValues.defaultPageSize;

    return map;
  }
}
