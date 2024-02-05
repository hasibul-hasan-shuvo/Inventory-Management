import 'package:cached_network_image/cached_network_image.dart';
import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:flutter/material.dart';

import '/app/core/values/app_values.dart';
import 'asset_image_view.dart';

// ignore: must_be_immutable
class NetworkImageView extends StatelessWidget with BaseWidgetMixin {
  NetworkImageView({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadiusAll = AppValues.radius_zero,
    this.borderRadiusTopLeft = AppValues.radius_zero,
    this.borderRadiusTopRight = AppValues.radius_zero,
    this.borderRadiusBottomLeft = AppValues.radius_zero,
    this.borderRadiusBottomRight = AppValues.radius_zero,
    this.placeHolder = AppImages.placeholder,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String imageUrl;
  final double borderRadiusAll;
  final double borderRadiusTopLeft;
  final double borderRadiusTopRight;
  final double borderRadiusBottomLeft;
  final double borderRadiusBottomRight;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String placeHolder;

  @override
  Widget body(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular((borderRadiusAll != AppValues.radius_zero)
            ? borderRadiusAll
            : borderRadiusTopLeft),
        topRight: Radius.circular((borderRadiusAll != AppValues.radius_zero)
            ? borderRadiusAll
            : borderRadiusTopRight),
        bottomLeft: Radius.circular((borderRadiusAll != AppValues.radius_zero)
            ? borderRadiusAll
            : borderRadiusBottomLeft),
        bottomRight: Radius.circular((borderRadiusAll != AppValues.radius_zero)
            ? borderRadiusAll
            : borderRadiusBottomRight),
      ),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => AssetImageView(
          fileName: placeHolder,
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => AssetImageView(
          fileName: placeHolder,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
