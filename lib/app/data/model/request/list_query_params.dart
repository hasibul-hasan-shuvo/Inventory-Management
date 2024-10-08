import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';

class ListQueryParams {
  ListQueryParams({
    required this.page,
    this.status,
    this.search,
  });

  int page;
  String? status;
  String? search;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['page_size'] = AppValues.defaultPageSize;
    if (status != null) {
      map['status'] = status;
    }

    if (search.isNotNullOrEmpty) {
      map['search'] = search;
    }

    return map;
  }
}
