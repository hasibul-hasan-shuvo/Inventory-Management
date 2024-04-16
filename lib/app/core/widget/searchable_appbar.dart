import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../base/base_widget_mixin.dart';
import '../values/app_colors.dart';
import '../values/app_values.dart';

// ignore: must_be_immutable
class SearchAbleAppBar extends StatelessWidget
    with BaseWidgetMixin
    implements PreferredSizeWidget {
  final bool isSearchableMode;
  final VoidCallback onChangeSearchMode;
  VoidCallback? onBackButtonClick;
  final Function(String) updateSearchQuery;
  final String title;

  final RxBool isSearchBoxEmpty = true.obs;

  final TextEditingController _searchController = TextEditingController();

  SearchAbleAppBar(
      {required this.isSearchableMode,
      required this.title,
      required this.onChangeSearchMode,
      required this.updateSearchQuery,
      this.onBackButtonClick});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget body(BuildContext context) => AppBar(
        iconTheme:
            Theme.of(context).iconTheme.copyWith(color: AppColors.colorWhite),

        ///
        leading: IconButton(
          onPressed: () {
            onBackButtonClick != null ? onBackButtonClick!() : Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: AppValues.iconDefaultSize.h,
          ),
        ),
        actions: _buildActions(),
        title: isSearchableMode ? _buildSearchTextField() : _buildTitle(),
        centerTitle: true,
      );

  List<Widget> _buildActions() {
    return [
      isSearchableMode ? _buildSearchableActions() : _buildSearchButton(),
    ];
  }

  Widget _buildSearchableActions() {
    return Row(
      children: [
        _buildSearchActionButton(),
        _buildClearButton(),
      ],
    );
  }

  Widget _buildSearchActionButton() {
    return Obx(
      () {
        return IconButton(
          onPressed: isSearchBoxEmpty.value
              ? null
              : () {
                  updateSearchQuery(_searchController.text);
                },
          icon: Icon(
            Icons.done,
            color: isSearchBoxEmpty.value
                ? AppColors.colorWhite.withOpacity(0.5)
                : AppColors.colorWhite,
            size: AppValues.iconDefaultSize.h,
          ),
        );
      },
    );
  }

  Widget _buildClearButton() {
    return IconButton(
      onPressed: () {
        onChangeSearchMode();
      },
      icon: Icon(
        Icons.clear,
        size: AppValues.iconDefaultSize.h,
      ),
    );
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
        border: InputBorder.none,
      ),
      maxLines: 1,
      textInputAction: TextInputAction.search,
      cursorColor: AppColors.colorWhite,
      onFieldSubmitted: (value) {
        updateSearchQuery(value);
      },
      onChanged: (value) {
        isSearchBoxEmpty(value.isEmpty);
      },
      style: const TextStyle(color: AppColors.colorWhite),
    );
  }

  Widget _buildTitle() => Text(title);
}
