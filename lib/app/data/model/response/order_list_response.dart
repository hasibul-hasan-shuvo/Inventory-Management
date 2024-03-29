class OrderListResponse {
  OrderListResponse.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      orders = [];
      json['results'].forEach((v) {
        orders?.add(OrderResponse.fromJson(v));
      });
    }
  }

  int? count;
  String? next;
  String? previous;
  List<OrderResponse>? orders;
}

class OrderResponse {
  OrderResponse.fromJson(dynamic json) {
    id = json['id'];
    invoice = json['invoice'];
    orderDate = json['order_date'];
  }

  int? id;
  String? invoice;
  String? orderDate;
}
