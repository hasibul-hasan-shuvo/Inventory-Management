import 'package:dental_inventory/app/data/model/response/shopping_cart_list_response.dart';
import 'package:dental_inventory/app/data/remote/shopping_cart_remote_data_source.dart';
import 'package:dental_inventory/app/data/repository/shopping_cart_repository.dart';
import 'package:get/get.dart';

class ShoppingCartRepositoryImpl implements ShoppingCartRepository {
  final ShoppingCartRemoteDataSource _remoteDataSource = Get.find();

  @override
  Future<ShoppingCartListResponse> getActiveShoppingCart(int page) {
    return _remoteDataSource.getActiveShoppingCart(page);
  }
}
