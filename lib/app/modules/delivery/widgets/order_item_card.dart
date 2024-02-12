import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ignore: must_be_immutable
class OrderItemCard extends StatelessWidget with BaseWidgetMixin {
  final String productName;
  final String productImage;
  final String productPrice;
  final String productQuantity;
  final String productId;

  OrderItemCard({
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
        NetworkImageView(
            imageUrl: productImage,
            width: AppValues.itemImageWidth.w,
            height: AppValues.itemImageHeight.h),
        SizedBox(
          width: AppValues.padding.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName, style: textTheme.titleMedium),
            SizedBox(
              height: AppValues.margin_2.h,
            ),
            Text("#$productId", style: textTheme.bodyMedium),
            SizedBox(
              height: AppValues.margin_2.h,
            ),
            Text("Ant: $productQuantity", style: textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
