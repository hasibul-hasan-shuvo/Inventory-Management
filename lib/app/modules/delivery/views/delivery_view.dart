import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
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
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.homeMenuOrderDelivery);

  Widget _buildBody() {
    return PagingView(
      controller: controller.refreshController,
      enablePullDown: false,
      child: _buildOrderList(),
    );
  }

  Widget _buildOrderList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.margin.w,
        vertical: AppValues.margin.h,
      ),
      itemCount: controller.orderList.length,
      itemBuilder: (context, index) {
        return _buildOrderItem(index);
      },
    );
  }

  Widget _buildOrderItem(int index) {
    return Card(
      elevation: AppValues.extraSmallElevation,
      child: Ripple(
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
          horizontal: AppValues.margin_12.w, vertical: AppValues.padding.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                controller.orderList[index].invoiceNo,
                style: textTheme.titleMedium,
              ),
              SizedBox(width: AppValues.margin_10.w),
              Text(
                controller.orderList[index].date.toString(),
                style: textTheme.bodySmall?.copyWith(color: theme.dividerColor),
              ),
            ],
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
