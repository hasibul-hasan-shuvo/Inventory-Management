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

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
        title: Text(appLocalization.homeMenuNotDelivered),
        centerTitle: true,
      );

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
      child: Column(
        children: [
          _buildOrderBasicInfo(index),
          _buildOrderDetails(index),
        ],
      ),
    );
  }

  Widget _buildOrderBasicInfo(int index) {
    return InkWell(
      splashColor: Colors.transparent,
      enableFeedback: false,
      onTap: () {
        controller.toggleExpandStatus(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppValues.padding, vertical: AppValues.halfPadding),
        child: Row(
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
                  style:
                      textTheme.bodySmall?.copyWith(color: theme.dividerColor),
                ),
              ],
            ),
            controller.orderList[index].isExpanded
                ? const Icon(Icons.arrow_drop_up)
                : const Icon(Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetails(int index) => Visibility(
        visible: controller.orderList[index].isExpanded,
        child: ItemOrderDetails(orderUiModel: controller.orderList[index]),
      );
}
