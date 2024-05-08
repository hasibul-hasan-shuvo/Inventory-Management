import 'package:dental_inventory/app/data/model/response/global_inventory_response.dart';

class GlobalInventoryUiModel {
  late final String itemId;
  late final String name;
  late final String imageUrl;
  late final bool isOutdated;
  late final String alternativeProductId;

  GlobalInventoryUiModel.fromGlobalInventoryResponse(
      GlobalInventoryResponse response) {
    itemId = response.itemId ?? '';
    name = response.name ?? '';
    imageUrl = response.imageUrl ?? '';
    isOutdated = response.isOutdated ?? false;
    alternativeProductId = response.alternativeProductId ?? '';
  }
}
