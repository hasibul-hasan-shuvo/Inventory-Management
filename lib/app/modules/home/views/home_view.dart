import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/modules/home/model/item_home_menu_ui_model.dart';
import 'package:dental_inventory/app/modules/home/widget/item_home_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/modules/home/controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends BaseView<HomeController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => null;

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppValues.margin.h),
        _getMenuGridView(),
        SizedBox(height: AppValues.margin.h),
        _getItemRetrievalOptionView(),
        SizedBox(height: AppValues.margin.h),
      ],
    ).marginSymmetric(
      horizontal: AppValues.margin.w,
    );
  }

  Widget _getMenuGridView() {
    return Obx(
      () => AlignedGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: AppValues.margin.h,
        crossAxisSpacing: AppValues.margin.w,
        itemCount: controller.menuList.length,
        shrinkWrap: true,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return ItemHomeMenuView(
      data: controller.menuList[index],
    );
  }

  Widget _getItemRetrievalOptionView() {
    return ItemHomeMenuView(
      data: ItemHomeMenuUiModel(
        icon: AppIcons.qrCodeScanner,
        title: appLocalization.homeMenuItemRetrieval,
        route: "",
      ),
    );
  }
}
