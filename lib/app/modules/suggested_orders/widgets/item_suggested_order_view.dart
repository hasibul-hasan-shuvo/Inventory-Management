import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/suggested_orders/controllers/suggested_orders_controller.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemSuggestedOrderView extends StatelessWidget with BaseWidgetMixin {
  final SuggestedOrdersController _controller = Get.find();
  final SuggestedOrderUiModel data;

  ItemSuggestedOrderView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      bgColor: theme.colorScheme.background,
      child: Dismissible(
        key: ValueKey(data.id),
        direction: DismissDirection.startToEnd,
        background: _getDismissibleBackground(),
        onDismissed: _onDismissed,
        child: ElevatedContainer(
          child: Row(
            children: [
              _getImageView(),
              SizedBox(width: AppValues.smallMargin.w),
              _getItemDetails(),
              _getEditButton(),
            ],
          ),
        ).marginSymmetric(
          vertical: AppValues.margin_6.h,
        ),
      ),
    );
  }

  Widget _getImageView() {
    return NetworkImageView(
      imageUrl: data.imageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
      fit: BoxFit.cover,
    );
  }

  Widget _getItemDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getInventoryName(),
        ],
      ),
    );
  }

  Widget _getInventoryName() {
    return Text(
      data.name,
      style: textTheme.bodyMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getEditButton() {
    return Ripple(
      onTap: _onTapEdit,
      child: AssetImageView(
        fileName: AppIcons.edit,
        height: AppValues.iconDefaultSize.h,
        width: AppValues.iconDefaultSize.w,
        color: theme.iconTheme.color,
      ).paddingSymmetric(
        horizontal: AppValues.padding.w,
        vertical: AppValues.padding.h,
      ),
    );
  }

  Widget _getDismissibleBackground() {
    return ElevatedContainer(
      bgColor: AppColors.bgDismissibleItem,
      child: Row(
        children: [
          Icon(
            Icons.add_shopping_cart,
            size: AppValues.iconDefaultSize.r,
            color: AppColors.colorBlack,
          ).paddingSymmetric(
            vertical: AppValues.padding.h,
            horizontal: AppValues.padding.w,
          ),
        ],
      ),
    ).marginSymmetric(
      vertical: AppValues.margin_6.h,
    );
  }

  void _onTapEdit() {}

  void _onDismissed(DismissDirection direction) {
    _controller.addToCart(data);
  }
}
