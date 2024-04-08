import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product_top_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InventoryOrderEditDialogContentView extends StatelessWidget
    with BaseWidgetMixin {
  final String id;
  final String name;
  final String imageUrl;
  final int count;
  final String? suggestionLabel;
  final int? suggestion;
  final num price;
  final Function(int) onSuggestionValueChange;
  final RxInt _suggestionController = RxInt(0);

  InventoryOrderEditDialogContentView({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.count,
    this.suggestionLabel,
    required this.suggestion,
    required this.price,
    required this.onSuggestionValueChange,
  }) {
    _suggestionController(suggestion);
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
      id: id,
      name: name,
      imageUrl: imageUrl,
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
            "$count",
          ),
          _getTitleAndValue(
            suggestionLabel ?? appLocalization.labelSuggestion,
            suggestion != null ? "$suggestion" : "",
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
        _getPriceView(),
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
    return Obx(
      () => Text(
        _suggestionController.value.toString(),
        style: textTheme.bodyMedium,
      ),
    );
  }

  Widget _getPriceView() {
    return Expanded(
      child: Obx(
        () => Text(
          "${appLocalization.currency}. ${_getTotalPrice()}",
          style: textTheme.titleMedium,
          textAlign: TextAlign.right,
        ).marginSymmetric(
          horizontal: AppValues.margin.w,
        ),
      ),
    );
  }

  void _onTapDecrement() {
    _suggestionController(_suggestionController.value - 1);
    onSuggestionValueChange(_suggestionController.value);
  }

  void _onTapIncrement() {
    _suggestionController(_suggestionController.value + 1);
    onSuggestionValueChange(_suggestionController.value);
  }

  String _getTotalPrice() {
    return (_suggestionController.value * price).toStringAsFixed(2);
  }

  bool get _isDecrementButtonEnabled => _suggestionController.value > 0;

  bool get _isIncrementButtonEnabled =>
      _suggestionController.value < AppValues.maxCountValue;
}
