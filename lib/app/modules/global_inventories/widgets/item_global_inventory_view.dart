import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:dental_inventory/app/core/widget/elevated_container.dart';
import 'package:dental_inventory/app/core/widget/network_image_view.dart';
import 'package:dental_inventory/app/modules/global_inventories/controllers/global_inventories_controller.dart';
import 'package:dental_inventory/app/modules/global_inventories/models/global_inventory_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ItemGlobalInventoryView extends StatelessWidget with BaseWidgetMixin {
  final GlobalInventoryUiModel data;

  ItemGlobalInventoryView({
    super.key,
    required this.data,
  });

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      child: Row(
        children: [
          _getImage(),
          SizedBox(width: AppValues.margin_10.w),
          _getNameAndId(),
          SizedBox(width: AppValues.margin_10.w),
          _getAddButton(context),
        ],
      ),
    ).marginOnly(bottom: AppValues.smallMargin.h);
  }

  Widget _getImage() {
    return NetworkImageView(
      imageUrl: data.imageUrl,
      height: AppValues.itemImageHeight.h,
      width: AppValues.itemImageWidth.w,
      fit: BoxFit.cover,
    );
  }

  Widget _getNameAndId() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getName(),
          SizedBox(height: AppValues.margin_4.h),
          _getId(),
        ],
      ),
    );
  }

  Widget _getName() {
    return Text(
      data.name,
      style: textTheme.titleMedium,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getId() {
    return Text(
      "#${data.itemId}",
      style: textTheme.bodySmall,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _getAddButton(BuildContext context) {
    return IconButton(
      onPressed: () => _onTapAdd(context),
      icon: Icon(
        Icons.add,
        color: theme.colorScheme.primary,
      ),
    );
  }

  void _onTapAdd(BuildContext context) {
    GlobalInventoriesController controller = Get.find();
    controller.onTapAddProduct(data);
  }
}
