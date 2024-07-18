import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/zebra_scanner.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/barcode_scanner_floating_button.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_inventory_ui_model.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_unavailable_product_ui_model.dart';
import 'package:dental_inventory/app/modules/global_inventories/widgets/global_inventory_add_dialog_view.dart';
import 'package:dental_inventory/app/modules/global_inventories/widgets/global_unavailable_inventory_dialog_view.dart';
import 'package:dental_inventory/app/modules/global_inventories/widgets/item_global_inventory_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:dental_inventory/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/global_inventories_controller.dart';

// ignore: must_be_immutable
class GlobalInventoriesView extends BaseView<GlobalInventoriesController> {
  BuildContext? _context;

  GlobalInventoriesView() {
    logger.i("GlobalInventory");
    ZebraScanner().addScannerDelegate((String? code) {
      logger.i("GlobalScanned: $code");
      closeKeyboard();
      controller.onScanned(code);
    });
    _subscribeAddInventoryController();
    _subscribeUnavailableInventoryController();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Obx(
        () => SearchAbleAppBar(
          isSearchableMode: controller.isSearchable,
          title: appLocalization.homeMenuSearchItem,
          onChangeSearchMode: controller.changeSearchMode,
          updateSearchQuery: (value) {
            controller.updateSearchQuery(value);
          },
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context) {
    _context = context;

    return Obx(
      () => controller.isPageLoading && controller.inventories.isEmpty
          ? const SizedBox.shrink()
          : controller.inventories.isEmpty
              ? _getPlaceHolder()
              : _getInventoryList(),
    );
  }

  @override
  Widget? floatingActionButton() {
    return BarcodeScannerFloatingButton(
      onPressed: _onPressedScanner,
    );
  }

  Widget _getPlaceHolder() {
    return Container();
  }

  Widget _getInventoryList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: AppValues.padding.h,
        bottom: AppValues.extraLargeSpacing.h,
        left: AppValues.padding.w,
        right: AppValues.padding.w,
      ),
      itemCount: controller.inventories.length,
      itemBuilder: _getItemBuilder,
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ItemGlobalInventoryView(data: controller.inventories[index]);
  }

  void _onPressedScanner() {
    closeKeyboard();
    Get.toNamed(
      Routes.SCANNER,
    )?.then((code) {
      controller.onScanned(code);
    });
  }

  void _subscribeAddInventoryController() {
    controller.addInventoryController.listen((GlobalInventoryUiModel? data) {
      if (data != null) {
        _showAddInventoryDialog(data);
      }
    });
  }

  void _subscribeUnavailableInventoryController() {
    controller.alternativeInventoryController
        .listen((GlobalUnavailableProductUiModel? data) {
      if (data != null) {
        _showAlternativeInventoryDialog(data);
      }
    });
  }

  void _showAddInventoryDialog(GlobalInventoryUiModel data) {
    if (_context != null) {
      TextEditingController minController = TextEditingController();
      TextEditingController maxController = TextEditingController();
      TextEditingController fixedSuggestionController = TextEditingController();
      TextEditingController stockCountController = TextEditingController();

      showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AppDialog(
            title: appLocalization.editProduct,
            content: GlobalInventoryAddDialogView(
              data: data,
              minController: minController,
              maxController: maxController,
              fixedSuggestionController: fixedSuggestionController,
              stockCountController: stockCountController,
            ),
            isCancelable: false,
            negativeButtonIcon: Icons.close,
            negativeButtonText: appLocalization.cancel,
            positiveButtonText: appLocalization.buttonTextAddProduct,
            onPositiveButtonTap: () {
              controller.createInventory(
                data: data,
                minCount: minController.text,
                maxCount: maxController.text,
                fixedSuggestion: fixedSuggestionController.text,
                stockCount: stockCountController.text,
              );
            },
          );
        },
      );
      controller.addInventoryController(null);
    }
  }

  void _showAlternativeInventoryDialog(GlobalUnavailableProductUiModel data) {
    if (_context != null) {
      showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AppDialog(
            title: appLocalization.titleUnavailableProduct,
            content: GlobalUnavailableInventoryDialogView(data: data),
            headerColor: AppColors.errorColor,
            isCancelable: false,
            negativeButtonIcon: Icons.close,
            negativeButtonText: appLocalization.cancel,
            positiveButtonText: appLocalization.buttonTextAddProduct,
            onPositiveButtonTap: () {
              controller.createInventory(data: data.availableProduct);
            },
          );
        },
      );
      controller.alternativeInventoryController(null);
    }
  }
}
