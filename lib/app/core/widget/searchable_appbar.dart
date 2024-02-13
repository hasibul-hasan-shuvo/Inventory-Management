import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/base_widget_mixin.dart';
import '../values/app_colors.dart';
import '../values/app_icons.dart';
import '../values/app_images.dart';
import '../values/app_values.dart';
import 'asset_image_view.dart';

// ignore: must_be_immutable
class SearchAbleAppBar extends StatelessWidget
    with BaseWidgetMixin
    implements PreferredSizeWidget {
  final bool isSearchableMode;
  final VoidCallback onChangeSearchMode;
  final Function(String) updateSearchQuery;
  final String title;

  SearchAbleAppBar(
      {required this.isSearchableMode,
      required this.title,
      required this.onChangeSearchMode,
      required this.updateSearchQuery});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget body(BuildContext context) => AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: AppColors.colorWhite),
        actions: [
          isSearchableMode ? _buildClearButton() : _buildSearchButton()
        ],
        title: isSearchableMode ? _buildSearchTextField() : _buildTitle(),
        centerTitle: true,
      );

  Widget _buildClearButton() {
    return IconButton(
        onPressed: () {
          onChangeSearchMode();
        },
        icon: AssetImageView(
          fileName: AppIcons.close,
          height: AppValues.iconDefaultSize.h,
          width: AppValues.iconDefaultSize.w,
        ));
  }

  Widget _buildSearchButton() {
    return IconButton(
      onPressed: () {
        onChangeSearchMode();
      },
      icon: const Icon(Icons.search),
    );
  }

  Widget _buildSearchTextField() {
    return TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: appLocalization.search,
          border: InputBorder.none,
        ),
        maxLines: 1,
        cursorColor: AppColors.colorWhite,
        onChanged: (value) {
          updateSearchQuery(value);
        },
        style: const TextStyle(color: AppColors.colorWhite));
  }

  _buildTitle() => Text(title);
}
