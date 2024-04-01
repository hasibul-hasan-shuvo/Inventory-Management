import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/empty_list_place_holder.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/delivery/widgets/item_delivered_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';

//ignore: must_be_immutable
class DeliveryView extends BaseView<DeliveryController> {
  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return controller.isPageLoading && controller.orderList.isEmpty
          ? const SizedBox.shrink()
          : controller.orderList.isEmpty
              ? _getPlaceHolder()
              : _buildBody();
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

  Widget _getPlaceHolder() {
    return EmptyListPlaceHolder(
      message: appLocalization.placeHolderEmptyOrders,
    );
  }

  Widget _buildOrderList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppValues.smallMargin.w,
        vertical: AppValues.margin.h,
      ),
      itemCount: controller.orderList.length,
      itemBuilder: (context, index) {
        return _buildOrderItem(index);
      },
    );
  }

  Widget _buildOrderItem(int index) {
    return ItemDeliveredOrderView(data: controller.orderList[index]);
  }
}
