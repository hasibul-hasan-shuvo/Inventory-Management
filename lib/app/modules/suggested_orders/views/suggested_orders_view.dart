import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/suggested_orders/widgets/item_suggested_order_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/suggested_orders_controller.dart';

// ignore: must_be_immutable
class SuggestedOrdersView extends BaseView<SuggestedOrdersController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuSuggestedOrder,
        actions: _getActions,
      );

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => controller.isPageLoading && controller.suggestedOrders.isEmpty
          ? const SizedBox.shrink()
          : controller.suggestedOrders.isEmpty
              ? _getPlaceHolder()
              : PagingView(
                  controller: controller.refreshController,
                  enablePullDown: false,
                  enablePullUp: controller.pagingController.canLoadNextPage(),
                  onLoading: controller.onLoading,
                  child: _getSuggestedOrdersListView(),
                ),
    );
  }

  Widget _getPlaceHolder() {
    return Center(
      child: Text(
        appLocalization.placeHolderEmptySuggestedOrders,
        style: textTheme.bodyMedium,
      ),
    ).marginSymmetric(
      horizontal: AppValues.margin.w,
      vertical: AppValues.margin.h,
    );
  }

  Widget _getSuggestedOrdersListView() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: AppValues.padding.h,
        horizontal: AppValues.margin.w,
      ),
      itemCount: controller.suggestedOrders.length,
      itemBuilder: _getItemBuilder,
    );
  }

  Widget _getItemBuilder(BuildContext context, int index) {
    return ItemSuggestedOrderView(data: controller.suggestedOrders[index]);
  }

  List<Widget> get _getActions {
    return [
      IconButton(
        onPressed: controller.addToCartAll,
        icon: const Icon(
          Icons.done,
        ),
      )
    ];
  }
}
