import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product/product_top_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:dental_inventory/app/modules/shopping_cart/models/shopping_cart_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShoppingCartInventoryOrderEditDialogContentView extends StatelessWidget
    with BaseWidgetMixin {
  final TextEditingController numberController;
  final String id;
  final String name;
  final String imageUrl;
  final int count;
  final String? suggestionLabel;
  final int? suggestion;
  final num price;
  final RxInt _suggestionController = RxInt(0);
  final ShoppingCartUiModel data;
  final Function(ShoppingCartUiModel) onTapShowPrice;

  ShoppingCartInventoryOrderEditDialogContentView({
    super.key,
    required this.numberController,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.count,
    this.suggestionLabel,
    required this.suggestion,
    required this.price,
    required this.data,
    required this.onTapShowPrice,
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
        _getPriceAndRemarkView(),
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
              : appColors.basicGrey,
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
              : appColors.basicGrey,
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

  Widget _getPriceAndRemarkView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getPriceView(),
          _getRemarkTextView(),
        ],
      ).marginSymmetric(
        horizontal: AppValues.margin.w,
      ),
    );
  }

  Widget _getRemarkTextView() {
    return Text(
      appLocalization.labelPerUnitIncludedVat,
      style: textTheme.bodySmall,
      textAlign: TextAlign.left,
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

  String _getPrice() {
    return price.toStringAsFixed(2);
  }

  bool get _isDecrementButtonEnabled => _suggestionController.value > 0;

  bool get _isIncrementButtonEnabled =>
      _suggestionController.value < AppValues.maxCountValue;

  Widget _getPriceView() {
    return Obx(() => Row(
          children: [
            if (data.isPriceAvailable)
              Text(
                "${appLocalization.currency}. ",
                style: textTheme.bodySmall,
              ),
            data.isPriceAvailable
                ? Text(
                    data.price.toString(),
                    style: textTheme.bodySmall,
                  )
                : _getUnavailablePriceView(),
          ],
        ));
  }

  Widget _getUnavailablePriceView() {
    return  _getPriceFetchingLoaderView();

  }

  Widget _getPriceFetchingLoaderView() {
    return Row(
      children: [
        SizedBox(
          height: AppValues.iconSize_14,
          width: AppValues.iconSize_14,
          child: CircularProgressIndicator(
            strokeWidth: AppValues.priceFetchingLoaderStrokeSize.r,
          ),
        ),
      ],
    );
  }

  Widget _getFetchPriceButtonView() {
    return Ripple(
      onTap: () {
        data.changePriceStateToLoad();
        onTapShowPrice(data);
      },
      child: Text(
        appLocalization.getPrice,
        style: textTheme.bodySmall,
      ),
    );
  }
}
