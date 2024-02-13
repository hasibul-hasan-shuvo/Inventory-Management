import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProductTopView extends StatelessWidget with BaseWidgetMixin {
  final String id;
  final String name;
  final String imageUrl;
  ProductTopView({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      height: AppValues.itemImageHeight.h,
      child: Row(
        children: [
          _getImageView(),
          SizedBox(width: AppValues.margin.w),
          _getNameAndId(),
        ],
      ),
    );
  }

  Widget _getImageView() {
    return NetworkImageView(
      imageUrl: imageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
      fit: BoxFit.cover,
    );
  }

  Widget _getNameAndId() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getName(),
          _getIdView(),
        ],
      ),
    );
  }

  Widget _getName() {
    return Text(
      name,
      style: textTheme.titleMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getIdView() {
    return Text(
      "#$id",
      style: textTheme.bodySmall,
      maxLines: 1,
    );
  }
}
