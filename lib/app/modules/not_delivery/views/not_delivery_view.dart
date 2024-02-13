import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/delivery/widgets/item_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/not_delivery_controller.dart';

//ignore: must_be_immutable
class NotDeliveryView extends BaseView<NotDeliveryController> {
  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return _buildBody();
    });
  }

  Widget _buildBody() {
    return PagingView(
      controller: controller.refreshController,
      enablePullDown: false,
      child: Padding(
        padding: const EdgeInsets.all(AppValues.halfPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderNumberView(),
            _buildNotDeliveryOrderList(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderNumberView() {
    return Padding(
      padding: const EdgeInsets.all(AppValues.halfPadding),
      child: Text(appLocalization.orderNumber, style: textTheme.titleLarge),
    );
  }

  Widget _buildNotDeliveryOrderList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.orderList.length,
        itemBuilder: (context, index) {
          return _buildOrderItem(index);
        },
      ),
    );
  }

  Widget _buildOrderItem(int index) {
    return Card(
      elevation: AppValues.extraSmallElevation,
      child: ListTile(
        title: _buildListTileTitle(index),
        subtitle: controller.orderList[index].isExpanded
            ? ItemOrderDetails(orderUiModel: controller.orderList[index])
            : const SizedBox(),
      ),
    );
  }

  Widget _buildListTileTitle(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              controller.orderList[index].id,
              style: textTheme.titleMedium,
            ),
            SizedBox(width: AppValues.margin_10.w),
            Text(
              controller.orderList[index].date.toString(),
              style: textTheme.bodySmall?.copyWith(color: theme.dividerColor),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            controller.toggleExpandStatus(index);
          },
          icon: controller.orderList[index].isExpanded
              ? const Icon(Icons.arrow_drop_up)
              : const Icon(Icons.arrow_forward_ios_outlined),
        )
      ],
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
        title: Text(appLocalization.homeMenuNotDelivered),
        centerTitle: true,
      );
}
