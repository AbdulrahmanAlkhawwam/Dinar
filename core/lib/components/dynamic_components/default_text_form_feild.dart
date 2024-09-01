import 'package:flutter/material.dart';

import '../../styles/colors/main_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    this.controller,
    this.label = "Text",
    this.labelStyle,
    this.suffixIconButton,
    this.suffixIcon,
    this.prefixIconButton,
    this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  final Function()? onTap;

  final Function(dynamic)? onChanged;

  final Function(dynamic)? onSubmitted;

  final IconButton? suffixIconButton;
  final Icon? suffixIcon;
  final IconButton? prefixIconButton;
  final Icon? prefixIcon;
  final String? label;
  final TextStyle? labelStyle;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: true,
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      enabled: onTap == null && onSubmitted == null && onChanged == null
          ? false
          : true,
      cursorColor: MainColors.darkTeal,
      controller: controller,
      style: const TextStyle(
        height: 0,
      ),
      decoration: InputDecoration(
        labelText: " $label",
        labelStyle: labelStyle?.copyWith(color: MainColors.darkTeal),
        suffix: suffixIconButton ?? suffixIcon,
        prefix: prefixIconButton ?? prefixIcon,
        border: InputBorder.none,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: MainColors.lightGray,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MainColors.forestGreen,
            width: 3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MainColors.redwood,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: MainColors.forestGreen,
            width: 2,
          ),
        ),
      ),
    );
  }
}
