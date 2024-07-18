import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product/product_top_view.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:dental_inventory/app/modules/selectable_inventory_list/model/selectable_inventory_item_ui_model.dart';
import 'package:dental_inventory/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShoppingCartSelectableInventoryEditDialogView extends StatelessWidget
    with BaseWidgetMixin {
  final TextEditingController numberController;
  final SelectableInventoryItemUiModel data;
  final String? suggestionLabel;

  final RxInt _suggestionController = RxInt(0);

  ShoppingCartSelectableInventoryEditDialogView({
    super.key,
    required this.numberController,
    required this.data,
    this.suggestionLabel,
  }) {
    _suggestionController(numberController.text.toInt);
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getProductTopView(),
          _getTitle(),
          _getNumberChangingView(),
        ],
      ),
    );
  }

  Widget _getProductTopView() {
    return ProductTopView(
      id: data.itemId.toString(),
      name: data.name,
      imageUrl: data.imageUrl,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getTitleAndValue(
            appLocalization.inventory,
            "${data.available}",
          ),
          _getTitleAndValue(
            suggestionLabel ?? appLocalization.labelSuggestion,
            (data.connectedCartItem.isCartedItem()
                    ? 0
                    : data.connectedCartItem.quantity)
                .toString(),
          ),
          const Divider(),
          _getSuggestionChangerAndPriceView(),
        ],
      ).paddingSymmetric(
        vertical: AppValues.padding.h,
      ),
    );
  }

  Widget _getTitleAndValue(
    String title,
    String value,
  ) {
    return Text(
      "$title: $value",
      style: textTheme.bodyMedium,
    ).marginSymmetric(
      horizontal: AppValues.margin.w,
    );
  }

  Widget _getSuggestionChangerAndPriceView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getDecrementButton(),
        _getSuggestion(),
        _getIncrementButton(),
      ],
    );
  }

  Widget _getDecrementButton() {
    return Obx(
      () => IconButton(
        onPressed: _isDecrementButtonEnabled ? _onTapDecrement : null,
        icon: AssetImageView(
          fileName: AppIcons.roundedMinus,
          height: AppValues.iconLargeSize.h,
          width: AppValues.iconLargeSize.h,
          color: _suggestionController.value > 0
              ? theme.colorScheme.primary
              : AppColors.basicGrey,
        ),
      ),
    );
  }

  Widget _getIncrementButton() {
    return Obx(
      () => IconButton(
        onPressed: _isIncrementButtonEnabled ? _onTapIncrement : null,
        icon: AssetImageView(
          fileName: AppIcons.roundedPlus,
          height: AppValues.iconLargeSize.h,
          width: AppValues.iconLargeSize.h,
          color: _isIncrementButtonEnabled
              ? theme.colorScheme.primary
              : AppColors.basicGrey,
        ),
      ),
    );
  }

  Widget _getSuggestion() {
    return TextFieldWithTitle(
      controller: numberController,
      onChangedValue: (String value) {
        _suggestionController(value.toInt);
      },
    );
  }

  void _onTapDecrement() {
    _suggestionController(_suggestionController.value - 1);
    numberController.text = _suggestionController.value.toString();
  }

  void _onTapIncrement() {
    _suggestionController(_suggestionController.value + 1);
    numberController.text = _suggestionController.value.toString();
  }

  bool get _isDecrementButtonEnabled => _suggestionController.value > 0;

  bool get _isIncrementButtonEnabled =>
      _suggestionController.value < AppValues.maxCountValue;
}
