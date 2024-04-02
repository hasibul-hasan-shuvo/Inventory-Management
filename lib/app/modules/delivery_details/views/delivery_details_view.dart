import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/order_status.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/modules/delivery/widgets/item_order_details.dart';
import 'package:dental_inventory/app/modules/delivery_details/controllers/delivery_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class DeliveryDetailsView extends BaseView<DeliveryDetailsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: '${appLocalization.order} ${controller.order.invoiceNo}',
      actions: _getActions(context),
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppValues.margin.h),
          _buildHeader(
            controller.order.status.getTitle(appLocalization),
            controller.order.invoiceNo,
            controller.order.date,
          ),
          ItemOrderDetails(
            orderUiModel: controller.order,
          ),
        ],
      ).marginSymmetric(
        horizontal: AppValues.margin.w,
      ),
    );
  }

  Widget _buildHeader(
    String status,
    String orderNumber,
    String orderDate,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${appLocalization.status}: $status',
          style: textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppValues.halfPadding.h),
        Text(
          '${appLocalization.orderDate}: $orderDate',
          style: textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  List<Widget> _getActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => _onConfirmDelivery(context),
        icon: const Icon(
          Icons.done,
        ),
      )
    ];
  }

  void _onConfirmDelivery(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: appLocalization.titleConfirmDelivery,
        message: appLocalization.messageConfirmDelivery,
        isCancelable: false,
        negativeButtonText: appLocalization.no,
        positiveButtonText: appLocalization.yes,
        onPositiveButtonTap: _onConfirmDeliveryTap,
      ),
    );
  }

  void _onConfirmDeliveryTap() {
    controller.confirmDelivery();
  }
}
