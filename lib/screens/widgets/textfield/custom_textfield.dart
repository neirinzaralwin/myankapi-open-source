import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myankapi/constants/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String text;
  final Color? textColor;
  final Color? labelColor;
  final Color? iconColor;
  final Color? fillColor;
  final Color? cursorColor;
  final bool? enableBorder;
  final String hint;
  final IconData? prefixIcon;
  final double? iconSize;
  final TextEditingController controller;
  final dynamic validator;
  final int? maxLine;
  final dynamic onChanged;
  final dynamic onSaved;
  final bool isDigitOnly;
  final bool isPassword;
  final bool isEnabled;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  const CustomTextFormField(
      {super.key,
      required this.text,
      this.textColor,
      this.iconColor,
      this.labelColor,
      this.fillColor,
      this.cursorColor = AppColor.primaryColor,
      this.enableBorder = true,
      required this.hint,
      this.prefixIcon,
      this.iconSize,
      required this.controller,
      required this.validator,
      this.maxLine,
      this.onChanged,
      this.onSaved,
      this.isDigitOnly = false,
      this.isPassword = false,
      this.isEnabled = true,
      this.enabledBorderColor,
      this.disabledBorderColor,
      this.focusBorderColor,
      this.errorBorderColor});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      cursorColor: widget.cursorColor,
      obscureText: widget.isPassword ? isObscure : false,
      maxLines: widget.maxLine ?? 1,
      enabled: widget.isEnabled,
      style: TextStyle(color: widget.textColor),
      decoration: widget.enableBorder!
          ? InputDecoration(
              fillColor: widget.fillColor ?? AppColor.primaryColor,
              filled: widget.fillColor == null ? false : true,
              alignLabelWithHint: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              labelText: widget.text,
              hintText: widget.hint,
              labelStyle: TextStyle(color: widget.textColor ?? AppColor.swatch),
              hintStyle: const TextStyle(
                  color: AppColor.grey, fontSize: 12.0), // small
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.iconColor ?? AppColor.swatch,
                      size: widget.iconSize,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: widget.iconColor ?? AppColor.primaryColor))
                  : null,
              enabledBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.enabledBorderColor ?? AppColor.swatch,
                          width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              floatingLabelStyle:
                  TextStyle(color: widget.labelColor ?? AppColor.black),
              focusedBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.focusBorderColor ??
                              AppColor.secondaryColor,
                          width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              focusedErrorBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.errorBorderColor ?? AppColor.redColor,
                          width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              errorBorder: widget.enableBorder!
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.errorBorderColor ?? AppColor.redColor,
                          width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    )
                  : null,
              errorStyle: TextStyle(
                  color: widget.errorBorderColor ?? AppColor.redColor),
            )
          : InputDecoration(
              filled: true,
              fillColor: widget.fillColor,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.iconColor ?? AppColor.swatch,
                      size: 18,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: widget.iconColor ?? AppColor.swatch))
                  : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
              hintStyle: const TextStyle(color: AppColor.grey),
              hintText: widget.hint,
            ),
      keyboardType: widget.isDigitOnly ? TextInputType.number : null,
      inputFormatters: widget.isDigitOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
    );
  }
}
