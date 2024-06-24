import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/font_size.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class ItemOrderCard extends StatelessWidget with BaseWidgetMixin {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productQuantity;
  final String productId;

  ItemOrderCard({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.productId,
  });

  @override
  Widget body(BuildContext context) {
    return Row(
      children: [
        _getImage(),
        _getDetails(),
      ],
    );
  }

  Widget _getImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppValues.radius.r),
        bottomLeft: Radius.circular(AppValues.radius.r),
      ),
      child: NetworkImageView(
        imageUrl: productImage,
        width: AppValues.itemImageWidth.w,
        height: AppValues.itemImageHeight.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _getDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getProductName(),
          SizedBox(height: AppValues.margin_4.h),
          _getProductId(),
          SizedBox(height: AppValues.margin_4.h),
          _getQuantity(),
        ],
      ).marginSymmetric(horizontal: AppValues.smallMargin.w),
    );
  }

  Widget _getProductName() {
    return Text(
      productName,
      style: textTheme.labelMedium,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getProductId() {
    return Text(
      "#$productId",
      style: textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getQuantity() {
    return Text(
      "${appLocalization.total}: $productQuantity",
      style: textTheme.bodySmall?.copyWith(fontSize: FontSize.labelSmall.sp),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
