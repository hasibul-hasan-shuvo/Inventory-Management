import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_images.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/modules/inventory/model/inventory_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class InventoryCard extends StatelessWidget with BaseWidgetMixin {
  final InventoryCardUIModel inventoryData;
  final VoidCallback onTap;

  InventoryCard({required this.inventoryData, required this.onTap});

  @override
  Widget body(BuildContext context) {
    return Card(
      elevation:AppValues.extraSmallElevation,
      child: Padding(
        padding: EdgeInsets.all(AppValues.halfPadding.sp),
        child: Row(
          children: [
            _buildProductName(),
            SizedBox(
              width: AppValues.margin_10.w,
            ),
            _buildQuantityRow(),
            SizedBox(
              width: AppValues.margin_10.w,
            ),
            _buildEditButton(onTap: onTap)
          ],
        ),
      ),
    );
  }

  Expanded _buildProductName() {
    return Expanded(
        flex: 2, child: Image.network(inventoryData.productImageUrl ?? ""));
  }

  Widget _buildEditButton({required VoidCallback onTap}) {
    return Expanded(
        flex: 1,
        child: IconButton(
          onPressed: onTap,
          icon: SvgPicture.asset(
            AppImages.ic_edit,
            color: theme.colorScheme.onSurface,
          ),
        ));
  }

  Widget _buildQuantityRow() {
    return Expanded(
        flex: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              inventoryData.productName ?? "",
              style: textTheme.titleMedium,
            ),
            SizedBox(height: AppValues.margin_10.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text("${appLocalization.available}: ${inventoryData.currentStock}"),
                ),
                SizedBox(
                  width: AppValues.margin_10.w,
                ),
                Expanded(
                  child: Text(
                    "${appLocalization.max}: ${inventoryData.maxTreshold} - ${appLocalization.min}: ${inventoryData.minTreshold}",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
