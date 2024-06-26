import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText,
  });

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "This field is required";
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText ?? false,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 20),
          isDense: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          hintText: hintText,
          hintStyle: CustomTextStyle.poppins300style16,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
