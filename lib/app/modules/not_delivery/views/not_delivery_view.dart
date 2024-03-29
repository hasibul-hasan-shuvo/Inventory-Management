import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/not_delivery/widgets/item_not_delivery_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/not_delivery_controller.dart';

//ignore: must_be_immutable
class NotDeliveryView extends BaseView<NotDeliveryController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) =>
      CustomAppBar(appBarTitleText: appLocalization.homeMenuNotDelivered);

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return PagingView(
        controller: controller.refreshController,
        enablePullDown: false,
        enablePullUp: controller.pagingController.canLoadNextPage(),
        onLoading: controller.onLoading,
        child: _buildNotDeliveryOrderList(),
      );
    });
  }

  Widget _buildNotDeliveryOrderList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.margin.w,
        vertical: AppValues.margin.h,
      ),
      itemCount: controller.orderList.length,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ItemNotDeliveryView(
      data: controller.orderList[index],
    );
  }
}
