import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_id_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_name_view.dart';
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
    return ProductNameView(name: productName);
  }

  Widget _getProductId() {
    return ProductIdView(id: productId);
  }

  Widget _getQuantity() {
    return LabelAndCountView(
      label: appLocalization.total,
      count: productQuantity,
    );
  }
}
