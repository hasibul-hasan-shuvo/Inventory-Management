import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/base_widget_mixin.dart';
import '../values/app_colors.dart';
import '../values/app_icons.dart';
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

  final TextEditingController _searchController = TextEditingController();

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
        actions: _buildActions(),
        title: isSearchableMode ? _buildSearchTextField() : _buildTitle(),
        centerTitle: true,
      );

  List<Widget> _buildActions() {
    return [
      isSearchableMode ? _buildClearButton() : _buildSearchButton(),
    ];
  }

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
      controller: _searchController,
      decoration: InputDecoration(
        hintText: appLocalization.search,
        suffixIcon: _buildSuffix(),
        border: InputBorder.none,
      ),
      maxLines: 1,
      cursorColor: AppColors.colorWhite,
      onChanged: (value) {},
      style: const TextStyle(color: AppColors.colorWhite),
    );
  }

  Widget _buildSuffix() {
    return MaterialButton(
      onPressed: () {
        updateSearchQuery(_searchController.text);
      },
      padding: EdgeInsets.zero,
      child: Text(
        appLocalization.done,
        style: const TextStyle(color: AppColors.colorWhite),
      ),
    );
  }

  Widget _buildTitle() => Text(title);
}
