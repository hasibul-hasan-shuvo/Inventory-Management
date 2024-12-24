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
import 'package:dental_inventory/app/modules/product_out/controllers/product_out_controller.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
import 'package:dental_inventory/app/modules/product_out/widgets/product_out_item_edit_dialog_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemProductOutView extends StatelessWidget with BaseWidgetMixin {
  final ProductOutController _controller = Get.find();
  final ScannedProductUiModel data;

  ItemProductOutView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return Dismissible(
      key: ValueKey(data.id),
      direction: DismissDirection.endToStart,
      background: _getDismissibleBackground(),
      confirmDismiss: _onDismissed,
      child: ElevatedContainer(
        height: AppValues.itemImageHeight.h,
        child: Ripple(
          onTap: _onTap,
          child: Row(
            children: [
              _getImageView(),
              SizedBox(width: AppValues.smallMargin.w),
              _getItemDetails(),
              _getEditButton(context),
            ],
          ),
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
          _getIdAndNumberView(),
          _getAvailableView(),
        ],
      ),
    );
  }

  Widget _getInventoryName() {
    return ProductNameView(name: data.name);
  }

  Widget _getIdAndNumberView() {
    return Row(
      children: [
        _getIdView(),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.labelNumber,
          data.number.toString(),
        ),
      ],
    );
  }

  Widget _getAvailableView() {
    return Row(
      children: [
        Expanded(child: Container()),
        SizedBox(width: AppValues.smallMargin.w),
        _getLabelAndCount(
          appLocalization.labelAvailable,
          data.available.toString(),
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
        spaceBetween: true,
      ).marginOnly(right: AppValues.smallMargin.w),
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

  void _onTap() {
    _controller.incrementProductNumber(data);
  }

  void _onTapEdit(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    numberController.text = data.number.toString();

    showDialog(
      context: context,
      builder: (_) {
        return AppDialog(
          title: appLocalization.titleEditOrderDialog,
          content: ProductOutItemEditDialogContentView(
            controller: numberController,
            data: data,
          ),
          positiveButtonText: appLocalization.buttonTextSaveChanges,
          onPositiveButtonTap: () {
            _controller.updateProductNumber(
              data,
              numberController.text,
            );
          },
        );
      },
    );
  }

  Widget _getDismissibleBackground() {
    return ElevatedContainer(
      bgColor: appColors.colorRed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete_outline,
            size: AppValues.iconDefaultSize.r,
            color: appColors.colorWhite,
          ).paddingSymmetric(
            vertical: AppValues.padding.h,
            horizontal: AppValues.padding.w,
          ),
        ],
      ),
    ).marginOnly(bottom: AppValues.margin_6.h);
  }

  Future<bool> _onDismissed(DismissDirection direction) {
    return _controller
        .removeProduct(data.itemId)
        .then((value) => value != null);
  }
}
