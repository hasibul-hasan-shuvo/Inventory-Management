import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/product_top_view.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:dental_inventory/app/modules/inventory/widget/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemCountEditDialogView extends StatelessWidget with BaseWidgetMixin {
  final InventoryCardUIModel data;
  final Function(String) onCurrentStockChanged;

  ItemCountEditDialogView({
    super.key,
    required this.data,
    required this.onCurrentStockChanged,
  });

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
      children: [
        TextFieldWithTitle(
          title: appLocalization.number,
          initialValue: data.currentStock.toString(),
          onChanged: onCurrentStockChanged,
        ),
      ],
    ).marginSymmetric(horizontal: AppValues.margin.w);
  }
}
