import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/home/model/item_home_menu_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemHomeMenuView extends StatelessWidget with BaseWidgetMixin {
  final ItemHomeMenuUiModel data;
  ItemHomeMenuView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      bgColor: AppColors.homeOptionBackground,
      borderRadius: AppValues.radius_6.r,
      child: Ripple(
        rippleRadius: AppValues.radius_6.r,
        onTap: _onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getIcon(),
            SizedBox(height: AppValues.margin_4.h),
            _getTitle(),
          ],
        ).paddingSymmetric(
          horizontal: AppValues.smallPadding.w,
          vertical: AppValues.padding_18.h,
        ),
      ),
    );
  }

  Widget _getIcon() {
    return Center(
      child: AssetImageView(
        fileName: data.icon,
        color: AppColors.primary,
        height: AppValues.iconLargeSize.h,
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      data.title,
      style: textTheme.bodyMedium?.copyWith(color: AppColors.primary),
      textAlign: TextAlign.center,
    );
  }

  void _onTap() {
    if (data.route.isNotEmpty) {
      Get.toNamed(
        data.route,
        arguments: data.arguments,
      );
    }
  }
}
