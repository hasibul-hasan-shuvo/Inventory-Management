import 'package:dental_inventory/app/core/base/base_widget_mixin.dart';
import 'package:dental_inventory/app/core/values/app_colors.dart';
import 'package:dental_inventory/app/core/values/app_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget{
  AppTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.borderRadius = 8,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.prefix,
      this.suffix,
      this.validator,
      required this.onChanged,
      this.isEnabled})
      : super(key: key);

  final TextEditingController controller;
  late String labelText;
  final double borderRadius;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;
  final Function(String?) onChanged;
  final String hintText;
  final bool? isEnabled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style:Theme.of(context).textTheme.labelLarge),
        const SizedBox(
          height: AppValues.halfPadding,
        ),
        TextFormField(
          enabled: widget.isEnabled,
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: _buildInputDecoration(context),
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          obscureText: widget.obscureText && _obscurePassword,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.hintText,
      alignLabelWithHint: true,
      fillColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      label: FittedBox(child: Text(widget.labelText)),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(width: 1)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
            color: Theme.of(context).textTheme.labelLarge!.color!, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: const BorderSide(color: AppColors.primary, width: 3),
      ),
      suffixIcon: widget.obscureText
          ? GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: _obscurePassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            )
          : widget.suffix,
      prefixIcon: widget.prefix,
    );
  }
}
