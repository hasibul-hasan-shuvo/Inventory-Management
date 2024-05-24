class OrderDetailsQueryParams {
  OrderDetailsQueryParams({
    required this.status,
  });

  String status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;

    return map;
  }
}
