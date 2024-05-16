import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:dental_inventory/app/modules/delivery/widgets/item_order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/app_values.dart';

//ignore: must_be_immutable
class ItemOrderDetails extends StatelessWidget with BaseWidgetMixin {
  ItemOrderDetails({
    required this.orderUiModel,
  });

  final OrderUiModel orderUiModel;

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(),
        SizedBox(height: AppValues.halfPadding.h),
        _getTitle(),
        SizedBox(height: AppValues.halfPadding.h),
        _getItemList(),
      ],
    );
  }

  Widget _getTitle() {
    return Text(
      appLocalization.orderLine,
      style: textTheme.titleMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getItemList() {
    return Obx(
      () => ListView.builder(
        padding: EdgeInsets.only(
          bottom: AppValues.margin.h,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: orderUiModel.items.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      elevation: AppValues.extraSmallElevation,
      child: ItemOrderCard(
        productId: orderUiModel.items[index].itemId,
        productImage: orderUiModel.items[index].imageUrl,
        productName: orderUiModel.items[index].name,
        productPrice: orderUiModel.items[index].price.toString(),
        productQuantity: orderUiModel.items[index].deliveredQuantity.toString(),
      ),
    );
  }
}
