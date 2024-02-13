import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/values/app_values.dart';
import 'item_order_card.dart';

//ignore: must_be_immutable
class ItemOrderDetails extends StatelessWidget with BaseWidgetMixin {
  ItemOrderDetails({required this.orderUiModel});

  final OrderUiModel orderUiModel;

  @override
  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Text(appLocalization.orderLine, style: textTheme.titleMedium),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orderUiModel.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(AppValues.halfPadding.sp),
              child: ItemOrderCard(
                productId: orderUiModel.items[index].id,
                productImage: orderUiModel.items[index].image,
                productName: orderUiModel.items[index].name,
                productPrice: orderUiModel.items[index].price.toString(),
                productQuantity: orderUiModel.items[index].quantity,
              ),
            );
          },
        )
      ],
    );
  }
}
