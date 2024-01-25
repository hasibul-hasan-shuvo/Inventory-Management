import 'package:dental_inventory/app/core/base/base_controller.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:get/get.dart';

class InventoryController extends BaseController {
  final RxBool isSearchMode = false.obs;
  final RxList<InventoryCardModel> inventoryList = <InventoryCardModel>[].obs;
  final RxList<InventoryCardModel> filteredInventoryList =
      <InventoryCardModel>[].obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getInventoryList();
    filteredInventoryList.addAll(inventoryList);
  }

  changeSearchMode() {
    isSearchMode.value = !isSearchMode.value;
    searchQuery('');
    updateSearchQuery(searchQuery.value);
  }



  updateSearchQuery(String query) {
    searchQuery(query);
    if (query.isEmpty) {
      filteredInventoryList.clear();
      filteredInventoryList.addAll(inventoryList);
    } else {
      filteredInventoryList.clear();
      filteredInventoryList.addAll(inventoryList
          .where((element) =>
              element.productName?.toLowerCase().contains(query.toLowerCase())??false)
          .toList());
    }
  }

  void getInventoryList() {
    for (int i = 0; i < AppValues.height_60; i++) {
      inventoryList.add(
        InventoryCardModel(
          productName: 'Protective head bio 4$i pcs',
          productImageUrl: 'https://www.kasandbox.org/programming-images/avatars/spunky-sam.png',
          maxTreshold: '100',
          minTreshold: '10',
          currentStock: '50',
          fixedOrderSuggestions: '20',
          unit: 'pcs',
          price: '10.00',
          productCode: 'P00$i',
          productCategory: 'Category $i',
          productDescription: 'This is product $i',
          productBrand: 'Brand $i',
          productSupplier: 'Supplier $i',
          productLocation: 'Location $i',
        ),
      );
    }
  }
}
