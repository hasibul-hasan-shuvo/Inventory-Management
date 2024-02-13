import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';

//ignore: must_be_immutable
class DeliveryView extends BaseView<DeliveryController> {
  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return _buildBody();
    });
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) => AppBar(
        title: Text(appLocalization.homeMenuOrderDelivery),
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
            _buildNotOrderList(),
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

  Widget _buildNotOrderList() {
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
      child: InkWell(
        enableFeedback: false,
        splashColor: Colors.transparent,
        onTap: () {
          Get.toNamed(Routes.DELIVERY_DETAILS,
              arguments: controller.orderList[index]);
        },
        child: _buildOrderBasicInfo(index),
      ),
    );
  }

  Widget _buildOrderBasicInfo(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.padding.w, vertical: AppValues.halfPadding.h),
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
                style: textTheme.bodySmall?.copyWith(color: theme.dividerColor),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_outlined),
        ],
      ),
    );
  }
}
