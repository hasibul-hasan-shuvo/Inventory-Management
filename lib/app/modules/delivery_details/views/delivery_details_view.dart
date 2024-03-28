import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:dental_inventory/app/modules/delivery/widgets/item_order_details.dart';
import 'package:dental_inventory/app/modules/delivery_details/controllers/delivery_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class DeliveryDetailsView extends BaseView<DeliveryDetailsController> {
  late OrderUiModel order;

  DeliveryDetailsView() {
    init();
  }

  init() {
    order = Get.arguments as OrderUiModel;
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: '${appLocalization.order} ${order.invoiceNo}',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppValues.halfPadding.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(order.status, order.invoiceNo, order.date),
          ItemOrderDetails(orderUiModel: order),
        ],
      ),
    );
  }

  Widget _buildHeader(String status, String orderNumber, String orderDate) {
    return Padding(
      padding: EdgeInsets.all(AppValues.halfPadding.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${appLocalization.status}: $status',
              style: textTheme.bodyMedium),
          SizedBox(height: AppValues.halfPadding.h),
          Text('${appLocalization.orderDate}: $orderDate',
              style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}
