import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/inventory/controllers/inventory_controller.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/widget/network_image_view.dart';

// ignore: must_be_immutable
class ItemUnavailableInventoryView extends StatelessWidget
    with BaseWidgetMixin {
  final InventoryUiModel data;
  final InventoryController _controller = Get.find<InventoryController>();

  ItemUnavailableInventoryView({
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      child: Container(
        color: Colors.amber.withOpacity(0.2),
        child: Ripple(
          onTap: () {},
          child: Row(
            children: [
              _buildProductImage(),
              SizedBox(width: AppValues.margin_10.w),
              _buildQuantityRow(),
              SizedBox(width: AppValues.margin_10.w),
              _getUnavailableTag(),
              SizedBox(width: AppValues.margin_10.w),
            ],
          ),
        ),
      ),
    ).marginOnly(bottom: AppValues.smallMargin.h);
  }

  Widget _buildProductImage() {
    return NetworkImageView(
      imageUrl: data.imageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
      fit: BoxFit.cover,
    );
  }

  Widget _getUnavailableTag() {
    return ElevatedContainer(
      borderRadius: AppValues.radius_6.r,
      bgColor: theme.primaryColor,
      width: AppValues.iconSize_40.w,
      child: Text(
        appLocalization.tagUnavailableProduct,
        style: textTheme.bodySmall?.copyWith(
          fontSize: FontSize.extraSmall.sp,
          color: theme.colorScheme.onPrimary,
        ),
        textAlign: TextAlign.center,
      ).paddingAll(AppValues.padding_4.r),
    );
  }

  Widget _buildQuantityRow() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            data.name,
            style: textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppValues.margin_10.h),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  "${appLocalization.available}: ${data.currentStock}",
                  style: textTheme.bodySmall,
                ),
              ),
              SizedBox(width: AppValues.margin_10.w),
              Expanded(
                flex: 2,
                child: Text(
                  appLocalization.inventoryMaxMin(data.min, data.max),
                  style: textTheme.bodySmall,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
