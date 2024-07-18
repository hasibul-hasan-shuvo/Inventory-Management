import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product/product_top_view.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemCountEditDialogView extends StatelessWidget with BaseWidgetMixin {
  final TextEditingController controller;
  final ScannedProductUiModel data;
  final RxInt _currentStockController = RxInt(0);

  ItemCountEditDialogView({
    super.key,
    required this.controller,
    required this.data,
  }) {
    _currentStockController(controller.text.toInt);
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
          _getCurrentStockChangingView(),
        ],
      ),
    );
  }

  Widget _getProductTopView() {
    return ProductTopView(
      id: data.itemId,
      name: data.name,
      imageUrl: data.imageUrl,
    );
  }

  Widget _getTitle() {
    return Text(
      appLocalization.inventory,
      style: textTheme.labelMedium,
    ).marginSymmetric(
      horizontal: AppValues.smallMargin.w,
      vertical: AppValues.smallMargin.h,
    );
  }

  Widget _getCurrentStockChangingView() {
    return ElevatedContainer(
      bgColor: theme.colorScheme.background,
      borderRadius: AppValues.radius_6.r,
      child: _getCurrentStockChangerView().paddingSymmetric(
        vertical: AppValues.padding.h,
      ),
    );
  }

  Widget _getCurrentStockChangerView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getDecrementButton(),
        _getNumberView(),
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
          color: _isDecrementButtonEnabled
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

  Widget _getNumberView() {
    return TextFieldWithTitle(
      controller: controller,
      onChangedValue: (String value) {
        _currentStockController(value.toInt);
      },
    );
  }

  void _onTapDecrement() {
    _currentStockController(_currentStockController.value - 1);
    controller.text = _currentStockController.value.toString();
  }

  void _onTapIncrement() {
    _currentStockController(_currentStockController.value + 1);
    controller.text = _currentStockController.value.toString();
  }

  bool get _isDecrementButtonEnabled => _currentStockController.value > 0;

  bool get _isIncrementButtonEnabled =>
      _currentStockController.value < AppValues.maxCountValue;
}
