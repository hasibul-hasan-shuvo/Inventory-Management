import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        SizedBox(width: AppValues.padding.w),
        _getDetails(),
      ],
    );
  }

  Widget _getImage() {
    return NetworkImageView(
      imageUrl: productImage,
      width: AppValues.itemImageWidth.w,
      height: AppValues.itemImageHeight.h,
      fit: BoxFit.cover,
    );
  }

  Widget _getDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getProductName(),
          SizedBox(height: AppValues.margin_2.h),
          _getProductId(),
          SizedBox(height: AppValues.margin_2.h),
          _getQuantity(),
        ],
      ),
    );
  }

  Widget _getProductName() {
    return Text(
      productName,
      style: textTheme.titleMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getProductId() {
    return Text(
      "#$productId",
      style: textTheme.bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getQuantity() {
    return Text(
      "${appLocalization.total}: $productQuantity",
      style: textTheme.bodyMedium,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
