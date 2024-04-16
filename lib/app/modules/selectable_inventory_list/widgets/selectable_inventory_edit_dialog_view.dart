import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product_top_view.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SelectableInventoryItemEditDialogView extends StatelessWidget
    with BaseWidgetMixin {
  final SelectableInventoryItemUiModel inventoryData;
  final TextEditingController controller;
  final Function(String) onCurrentStockChanged;
  final RxInt _numberController = RxInt(0);

  SelectableInventoryItemEditDialogView({
    super.key,
    required this.inventoryData,
    required this.onCurrentStockChanged,
    required this.controller,
  }) {
    _numberController(inventoryData.number);
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _getProductTopView(),
        _getTitle(),
        _getNumberChangingView(),
      ],
    );
  }

  Widget _getProductTopView() {
    return ProductTopView(
      id: inventoryData.itemId,
      name: inventoryData.name,
      imageUrl: inventoryData.imageUrl,
    );
  }

  Widget _getTitle() {
    return Text(
      appLocalization.number,
      style: textTheme.labelMedium,
    ).marginSymmetric(
      horizontal: AppValues.smallMargin.w,
      vertical: AppValues.smallMargin.h,
    );
  }

  Widget _getNumberChangingView() {
    return ElevatedContainer(
      bgColor: theme.colorScheme.background,
      borderRadius: AppValues.radius_6.r,
      child: _buildNumberChangerView().paddingSymmetric(
        vertical: AppValues.padding.h,
      ),
    );
  }

  Widget _buildNumberChangerView() {
    return Row(
      children: [
        TextFieldWithTitle(
          title: appLocalization.number,
          // initialValue: inventoryData.number.toString(),
          onChangedValue: onCurrentStockChanged, controller: controller,
        )
        // // _getTitleAndValue(
        // //   appLocalization.labelCount,
        // //   "$count",
        // // ),
        // // _getTitleAndValue(
        // //   appLocalization.labelSuggestion,
        // //   suggestion != null ? "$suggestion" : "",
        // // ),
        // // const Divider(),
        // _getSuggestionChangerAndPriceView(),
      ],
    ).marginSymmetric(horizontal: AppValues.margin.w);
  }

  Widget _getRemainingStock() {
    return Text("${appLocalization.remainingStockAfterWithdrawal}: 1");
  }

  // Widget _getTitleAndValue(
  //   String title,
  //   String value,
  // ) {
  //   return Text(
  //     "$title: $value",
  //     style: textTheme.bodyMedium,
  //   ).marginSymmetric(
  //     horizontal: AppValues.margin.w,
  //   );
  // }

  Widget _getSuggestionChangerAndPriceView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // _getDecrementButton(),
        // _getSuggestion(),
        // _getIncrementButton(),
        // _getPriceView(),
      ],
    );
  }

// Widget _getDecrementButton() {
//   return Obx(
//     () => IconButton(
//       onPressed: _isDecrementButtonEnabled ? _onTapDecrement : null,
//       icon: AssetImageView(
//         fileName: AppIcons.roundedMinus,
//         height: AppValues.iconLargeSize.h,
//         width: AppValues.iconLargeSize.h,
//         color: _suggestionController.value > 0
//             ? theme.colorScheme.primary
//             : AppColors.basicGrey,
//       ),
//     ),
//   );
// }

// Widget _getIncrementButton() {
//   return Obx(
//     () => IconButton(
//       onPressed: _isIncrementButtonEnabled ? _onTapIncrement : null,
//       icon: AssetImageView(
//         fileName: AppIcons.roundedPlus,
//         height: AppValues.iconLargeSize.h,
//         width: AppValues.iconLargeSize.h,
//         color: _isIncrementButtonEnabled
//             ? theme.colorScheme.primary
//             : AppColors.basicGrey,
//       ),
//     ),
//   );
// }

// Widget _getSuggestion() {
//   return Obx(
//     () => Text(
//       _suggestionController.value.toString(),
//       style: textTheme.bodyMedium,
//     ),
//   );
// }

// Widget _getPriceView() {
//   return Expanded(
//     child: Obx(
//       () => Text(
//         "${appLocalization.currency}. ${_getTotalPrice()}",
//         style: textTheme.titleMedium,
//         textAlign: TextAlign.right,
//       ).marginSymmetric(
//         horizontal: AppValues.margin.w,
//       ),
//     ),
//   );
// }

// void _onTapDecrement() {
//   _suggestionController(_suggestionController.value - 1);
//   onSuggestionValueChange(_suggestionController.value);
// }
//
// void _onTapIncrement() {
//   _suggestionController(_suggestionController.value + 1);
//   onSuggestionValueChange(_suggestionController.value);
// }

// String _getTotalPrice() {
//   return (_suggestionController.value * 1).toStringAsFixed(2);
// }

// bool get _isDecrementButtonEnabled => _suggestionController.value > 0;
//
// bool get _isIncrementButtonEnabled =>
//     _suggestionController.value < AppValues.maxCountValue;
}
