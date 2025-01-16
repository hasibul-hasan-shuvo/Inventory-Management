import 'package:dental_inventory/app/core/base/base_view.dart';
import 'package:dental_inventory/app/core/services/scanner/scanner_service.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/paging_view.dart';
import 'package:dental_inventory/app/core/widget/searchable_appbar.dart';
import 'package:dental_inventory/app/modules/fixed_suggestion/widgets/item_fixed_suggestion_in_cart_view.dart';
import 'package:dental_inventory/app/modules/fixed_suggestion/widgets/item_fixed_suggestion_view.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/fixed_suggestion_controller.dart';

class FixedSuggestionView extends BaseView<FixedSuggestionController> {
  FixedSuggestionView() {
    ScannerService.setScannerDelegate(controller.onScanned);
  }
  @override
  PreferredSizeWidget? appBar(BuildContext context) => PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Obx(
          () => _getAppBar(context),
        ),
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

  Widget _getAppBar(BuildContext context) {
    return SearchAbleAppBar(
      searchController: controller.searchController,
      isSearchableMode: controller.isSearchable,
      title: appLocalization.homeMenuFixedSuggestion,
      onChangeSearchMode: controller.changeSearchMode,
      updateSearchQuery: (value) {
        controller.updateSearchQuery(value);
      },
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
    SuggestedOrderUiModel data = controller.suggestedOrders[index];

    return data.isAvailableInCart
        ? ItemFixedSuggestionInCartView(data: data)
        : ItemFixedSuggestionView(data: data);
  }
}
