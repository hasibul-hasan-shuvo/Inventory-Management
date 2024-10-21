import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/modules/shopping_cart/controllers/shopping_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ShoppingCartTotalPriceView extends StatelessWidget with BaseWidgetMixin {
  final ShoppingCartController _controller = Get.find();

  ShoppingCartTotalPriceView({super.key});

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => _controller.isPageLoading && _controller.totalPrice.isZero
          ? const SizedBox.shrink()
          : Container(
              color: theme.primaryColor,
              child: Text(
                "${appLocalization.total}: ${_controller.totalPrice.totalPrice.toStringAsFixed(2)} ${appLocalization.includeVat}",
                style: textTheme.titleMedium
                    ?.copyWith(color: appColors.colorWhite),
              ).marginSymmetric(
                horizontal: AppValues.margin.w,
                vertical: AppValues.margin_4.h,
              ),
            ),
    );
  }
}
