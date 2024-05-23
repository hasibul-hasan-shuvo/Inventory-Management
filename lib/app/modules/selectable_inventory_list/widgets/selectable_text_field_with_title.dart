import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SelectableTextFieldWithTitle extends StatelessWidget
    with BaseWidgetMixin {
  final String title;
  final String initialValue;
  final Function(String) onChanged;

  SelectableTextFieldWithTitle(
      {required this.title,
      required this.initialValue,
      required this.onChanged});

  @override
  Widget body(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(
          width: AppValues.margin_10,
        ),
        SizedBox(
            width: AppValues.margin_40.w,
            height: AppValues.margin_30.w,
            child: TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              minLines: 1,
              initialValue: initialValue,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: theme.colorScheme.surface,
                contentPadding: const EdgeInsets.all(4),
                counterText: '',
              ),
              onChanged: onChanged,
              maxLength: AppValues.maxCountLength,
            ))
      ],
    );
  }
}
