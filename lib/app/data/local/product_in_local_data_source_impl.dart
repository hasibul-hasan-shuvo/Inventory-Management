import 'package:dental_inventory/app/data/local/db/dao/product_in_dao.dart';
import 'package:dental_inventory/app/data/local/product_in_local_data_source.dart';
import 'package:get/get.dart';

class ProductInLocalDataSourceImpl implements ProductInLocalDataSource {
  final ProductInDao _dao = ProductInDao(Get.find());
}
