import 'package:dental_inventory/app/core/values/app_values.dart';

class OrderListQueryParams {
  OrderListQueryParams({
    required this.page,
    required this.status,
  });

  int page;
  String status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['page_size'] = AppValues.defaultPageSize;
    map['status'] = status;

    return map;
  }
}
