import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/app_dialog.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/label_and_count_view.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_id_view.dart';
import 'package:dental_inventory/app/core/widget/product/product_name_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/suggested_orders/controllers/suggested_orders_controller.dart';
import 'package:dental_inventory/app/modules/suggested_orders/models/suggested_order_ui_model.dart';
import 'package:dental_inventory/app/modules/suggested_orders/widgets/inventory_order_edit_dialog_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemFixedSuggestionView extends StatelessWidget with BaseWidgetMixin {
  final SuggestedOrdersController _controller = Get.find();
  final SuggestedOrderUiModel data;

  ItemFixedSuggestionView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return Dismissible(
      key: ValueKey(data.id),
      direction: DismissDirection.startToEnd,
      background: _getDismissibleBackground(),
      confirmDismiss: _onDismissed,
      child: ElevatedContainer(
        height: AppValues.itemImageHeight.h,
        child: Row(
          children: [
            _getImageView(),
            SizedBox(width: AppValues.smallMargin.w),
            _getItemDetails(),
            _getEditButton(context),
          ],
        ),
      ).marginOnly(bottom: AppValues.margin_6.h),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getInventoryName(),
          SizedBox(height: AppValues.margin_4.h),
          _getIdAndCountView(),
          _getMaxMinAndFixedSuggestionView(),
        ],
      ),
    );
  }

  Widget _getInventoryName() {
    return ProductNameView(name: data.name);
  }

  Widget _getIdAndCountView() {
    return Row(
      children: [
        _getIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.inventory,
          data.count.toString(),
        ),
      ],
    );
  }

  Widget _getMaxMinAndFixedSuggestionView() {
    return Row(
      children: [
        _getLabelAndCount(
          appLocalization.labelMinMax,
          "${data.min}/${data.max}",
        ),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.labelSuggestion,
          data.suggestion.toString(),
        ),
      ],
    );
  }

  Widget _getIdView() {
    return Expanded(
      child: ProductIdView(
        id: data.itemId,
      ),
    );
  }

  Widget _getLabelAndCount(String label, [String? count]) {
    return Expanded(
      child: LabelAndCountView(
        label: label,
        count: count,
      ),
    );
  }

  Widget _getEditButton(BuildContext context) {
    return Ripple(
      onTap: () => _onTapEdit(context),
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
      bgColor: appColors.bgDismissibleItem,
      child: Row(
        children: [
          Icon(
            Icons.add_shopping_cart,
            size: AppValues.iconDefaultSize.r,
            color: appColors.colorBlack,
          ).paddingSymmetric(
            vertical: AppValues.padding.h,
            horizontal: AppValues.padding.w,
          ),
        ],
      ),
    ).marginOnly(bottom: AppValues.margin_6.h);
  }

  void _onTapEdit(BuildContext context) {
    _controller.getProductPrice(data);
    TextEditingController suggestionController = TextEditingController();
    suggestionController.text = data.suggestion.toString();

    showDialog(
      context: context,
      builder: (_) {
        return AppDialog(
          title: appLocalization.titleEditOrderDialog,
          content: Obx(
            () => InventoryOrderEditDialogContentView(
              numberController: suggestionController,
              id: data.itemId,
              name: data.name,
              imageUrl: data.imageUrl,
              count: data.count,
              suggestion: data.suggestion,
              price: data.price,
            ),
          ),
          positiveButtonText: appLocalization.buttonTextAddToCart,
          onPositiveButtonTap: () {
            _controller.addToCart(
              data.itemId,
              suggestionController.text,
            );
          },
        );
      },
    );
  }

  Future<bool> _onDismissed(DismissDirection direction) {
    return _controller
        .addToCart(data.itemId, data.suggestion.toString())
        .then((value) => value != null);
  }
}
