import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:dental_inventory/app/modules/delivery/widgets/item_order_details.dart';
import 'package:dental_inventory/app/modules/not_delivery/controllers/not_delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemNotDeliveryView extends StatelessWidget with BaseWidgetMixin {
  final NotDeliveryController _controller = Get.find();
  final OrderUiModel data;

  ItemNotDeliveryView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return Card(
      elevation: AppValues.extraSmallElevation,
      child: Column(
        children: [
          _buildOrderBasicInfo(),
          _buildOrderDetails(),
        ],
      ),
    );
  }

  Widget _buildOrderBasicInfo() {
    return Ripple(
      onTap: _onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppValues.margin_10.w,
          vertical: AppValues.padding.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getInvoiceNoAndDate(),
            _getIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetails() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      opacity: data.isExpanded ? 1 : 0,
      child: Visibility(
        visible: data.isExpanded,
        child: ItemOrderDetails(orderUiModel: data),
      ),
    );
  }

  Widget _getInvoiceNoAndDate() {
    return Row(
      children: [
        _getInvoiceNo(),
        SizedBox(width: AppValues.margin_10.w),
        _getDate(),
      ],
    );
  }

  Widget _getInvoiceNo() {
    return Text(
      data.invoiceNo,
      style: textTheme.titleMedium,
    );
  }

  Widget _getDate() {
    return Text(
      data.date.toString(),
      style: textTheme.bodySmall?.copyWith(color: theme.dividerColor),
    );
  }

  Widget _getIcon() {
    return data.isExpanded
        ? const Icon(Icons.keyboard_arrow_up)
        : const Icon(Icons.keyboard_arrow_down);
  }

  void _onTap() {
    _controller.toggleExpandStatus(data);
  }
}
