import 'package:flutter/material.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final String? hintText, labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? suffixIconOnTap;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final int? maxLines;
  final int? maxLength;
  final String? initialValue;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool disableFocusNode;
  final void Function()? onTap;
  const CustomTextField({
    super.key,
    this.width,
    this.hintText,
    this.suffixIconOnTap,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.maxLines = 1,
    this.initialValue,
    this.autofocus = false,
    this.maxLength,
    this.textInputAction,
    this.controller,
    this.disableFocusNode = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? SizeConfig.defaultSize * 39,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        focusNode: disableFocusNode ? AlwaysDisabledFocusNode() : null,
        autofocus: autofocus,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        initialValue: initialValue,
        textInputAction: textInputAction,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: validator ??
            (value) {
              if (value?.isEmpty ?? true) {
                return 'required';
              }
              return null;
            },
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.color2,
            fontWeight: FontWeight.w500,
            fontSize: SizeConfig.defaultSize * 1.5,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 22),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
