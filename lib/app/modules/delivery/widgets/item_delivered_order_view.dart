import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/delivery/models/order_ui_model.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemDeliveredOrderView extends StatelessWidget with BaseWidgetMixin {
  final OrderUiModel data;

  ItemDeliveredOrderView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return Card(
      elevation: AppValues.extraSmallElevation,
      child: Ripple(
        onTap: _onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppValues.margin_12.w,
            vertical: AppValues.padding.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getInvoiceNoAndDate(),
              SizedBox(width: AppValues.margin.w),
              _getIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getInvoiceNoAndDate() {
    return Expanded(
      child: Row(
        children: [
          _getInvoiceNo(),
          SizedBox(width: AppValues.margin_10.w),
          _getDate(),
        ],
      ),
    );
  }

  Widget _getInvoiceNo() {
    return Flexible(
      child: Text(
        data.invoiceNo,
        style: textTheme.titleMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _getDate() {
    return Flexible(
      child: Text(
        data.date.toString(),
        style: textTheme.bodySmall?.copyWith(color: theme.dividerColor),
      ),
    );
  }

  Widget _getIcon() {
    return const Icon(Icons.chevron_right);
  }

  void _onTap() {
    Get.toNamed(
      Routes.DELIVERY_DETAILS,
      arguments: data,
    );
  }
}
