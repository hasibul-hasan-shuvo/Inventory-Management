import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product_top_view.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductInItemEditDialogContentView extends StatelessWidget
    with BaseWidgetMixin {
  final ScannedProductUiModel data;
  final Function(int) onNumberChanged;
  final RxInt _numberController = RxInt(0);

  ProductInItemEditDialogContentView({
    super.key,
    required this.data,
    required this.onNumberChanged,
  }) {
    _numberController(data.number);
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
        SizedBox(height: AppValues.smallMargin.h),
        _getAvailableWithTitleView(),
      ],
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
      appLocalization.number,
      style: textTheme.labelMedium,
    ).marginSymmetric(
      horizontal: AppValues.smallMargin.w,
      vertical: AppValues.smallMargin.h,
    );
  }

  Widget _getAvailableWithTitleView() {
    return Obx(
      () => Text(
        "${appLocalization.titleEditProductInAvailableCount}: $latestStock",
        style: textTheme.bodyMedium,
      ),
    ).marginSymmetric(horizontal: AppValues.smallMargin.w);
  }

  Widget _getNumberChangingView() {
    return ElevatedContainer(
      bgColor: theme.colorScheme.background,
      borderRadius: AppValues.radius_6.r,
      child: _getNumberChangerView().paddingSymmetric(
        vertical: AppValues.padding.h,
      ),
    );
  }

  Widget _getNumberChangerView() {
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
        onPressed: _numberController.value > 0 ? _onTapDecrement : null,
        icon: AssetImageView(
          fileName: AppIcons.roundedMinus,
          height: AppValues.iconLargeSize.h,
          width: AppValues.iconLargeSize.h,
          color: _numberController.value > 0
              ? theme.colorScheme.primary
              : AppColors.basicGrey,
        ),
      ),
    );
  }

  Widget _getIncrementButton() {
    return IconButton(
      onPressed: latestStock > 0 ? _onTapIncrement : null,
      icon: AssetImageView(
        fileName: AppIcons.roundedPlus,
        height: AppValues.iconLargeSize.h,
        width: AppValues.iconLargeSize.h,
        color: theme.colorScheme.primary,
      ),
    );
  }

  Widget _getNumberView() {
    return Obx(
      () => Text(
        _numberController.value.toString(),
        style: textTheme.bodyMedium,
      ),
    );
  }

  void _onTapDecrement() {
    _numberController(_numberController.value - 1);
    onNumberChanged(_numberController.value);
  }

  void _onTapIncrement() {
    _numberController(_numberController.value + 1);
    onNumberChanged(_numberController.value);
  }

  int get latestStock => data.available + _numberController.value;
}
