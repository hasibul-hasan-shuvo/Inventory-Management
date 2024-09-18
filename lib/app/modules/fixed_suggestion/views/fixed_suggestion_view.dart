import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/custom_app_bar.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/modules/fixed_suggestion/widgets/item_fixed_suggestion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/fixed_suggestion_controller.dart';

class FixedSuggestionView extends BaseView<FixedSuggestionController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) => CustomAppBar(
        appBarTitleText: appLocalization.homeMenuFixedSuggestion,
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
    return Container();
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
    return ItemFixedSuggestionView(data: controller.suggestedOrders[index]);
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
