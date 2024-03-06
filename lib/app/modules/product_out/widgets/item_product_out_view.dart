import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_icons.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/values/string_extensions.dart';
import 'package:dental_inventory/app/core/widget/asset_image_view.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/core/widget/ripple.dart';
import 'package:dental_inventory/app/modules/product_out/controllers/product_out_controller.dart';
import 'package:dental_inventory/app/modules/product_out/models/scanned_product_ui_model.dart';
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
    return ElevatedContainer(
      height: AppValues.itemImageHeight.h,
      child: Row(
        children: [
          _getImageView(),
          SizedBox(width: AppValues.smallMargin.w),
          _getItemDetails(),
          _getEditButton(context),
        ],
      ),
    ).marginOnly(bottom: AppValues.margin_6.h);
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
          _getIdAndNumberView(),
          _getAvailableView(),
        ],
      ),
    );
  }

  Widget _getInventoryName() {
    return Text(
      data.name,
      style: textTheme.titleMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
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
    ).marginOnly(right: AppValues.margin.w);
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
    ).marginOnly(right: AppValues.margin.w);
  }

  Widget _getIdView() {
    return Expanded(
      child: Text(
        "#${data.id}",
        style: textTheme.bodySmall,
      ),
    );
  }

  Widget _getLabelAndCount(String label, [String? count]) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$label:",
              style: textTheme.bodySmall,
            ),
          ),
          if (count.isNotNullOrEmpty)
            Text(
              "$count",
              style: textTheme.bodySmall,
              textAlign: TextAlign.right,
            ),
        ],
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

  void _onTapEdit(BuildContext context) {
    // int suggestion = data.number;
    //
    // showDialog(
    //   context: context,
    //   builder: (_) {
    //     return AppDialog(
    //       title: appLocalization.titleEditOrderDialog,
    //       content: InventoryOrderEditDialogContentView(
    //         id: data.id.toString(),
    //         name: data.name,
    //         imageUrl: data.imageUrl,
    //         count: data.count,
    //         suggestion: data.suggestion,
    //         price: data.price,
    //         onSuggestionValueChange: (int value) {
    //           suggestion = value;
    //         },
    //       ),
    //       positiveButtonText: appLocalization.buttonTextSaveChanges,
    //       onPositiveButtonTap: () {
    //         data.updateSuggestion(suggestion);
    //         _controller.rebuildList();
    //       },
    //     );
    //   },
    // );
  }
}
