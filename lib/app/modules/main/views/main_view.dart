import 'package:dental_inventory/app/core/utils/url_launcher.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_strings.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/main/model/item_home_menu_ui_model.dart';
import 'package:dental_inventory/app/modules/main/views/main_app_bar.dart';
import 'package:dental_inventory/app/modules/main/widget/item_home_menu_view.dart';
import 'package:dental_inventory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/modules/main/controllers/main_controller.dart';
import '/app/modules/main/model/menu_code.dart';
import '/app/modules/main/views/bottom_nav_bar.dart';

// ignore: must_be_immutable
class MainView extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => MainAppBar();

  @override
  Widget body(BuildContext context) {
    return PagingView(
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppValues.margin.h),
            _getMenuGridView(),
            SizedBox(height: AppValues.smallMargin.h),
            _getItemRetrievalOptionView(),
            SizedBox(height: AppValues.margin.h),
          ],
        ).marginSymmetric(
          horizontal: AppValues.margin.w,
        ),
      ),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomNavBar(onItemSelected: _onMenuSelected);
  }

  Widget _getMenuGridView() {
    return Obx(
      () => AlignedGridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: AppValues.smallMargin.h,
        crossAxisSpacing: AppValues.smallMargin.w,
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
        route: Routes.PRODUCT_OUT,
      ),
    );
  }

  void _onMenuSelected(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        UrlLauncher.launchUrl(AppStrings.website);
        break;
      case MenuCode.CONTACT_US:
        Get.toNamed(Routes.CONTACT_US);
        break;
      case MenuCode.ABOUT_US:
        Get.toNamed(Routes.ABOUT_APP);
        break;
    }
  }
}
