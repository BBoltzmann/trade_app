import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/constants.dart';
import 'package:trade_app/utils/ui_helpers.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/size_config.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? label, hintText, suffixText;
  final IconData? prefixIconData;
  final bool obscureText, enabled;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String?)? onChanged, onSaved, onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType type;
  final Color? borderColor;
  final Color? fillColor;
  final FocusNode? focusNode;
  final int maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final String? title;
  const TextFormFieldWidget({
    Key? key,
    this.title,
    this.label,
    this.hintText,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.onFieldSubmitted,
    this.onSaved,
    this.obscureText = false,
    this.enabled = true,
    this.suffixText,
    this.validator,
    this.initialValue,
    this.suffixIcon,
    this.type = TextInputType.text,
    this.maxLines = 1,
    this.prefixIconData,
    this.fillColor,
    this.borderColor,
    this.readOnly = false,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.grey1,
        width: 0.5,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(
                title!,
                size: 14,
                weight: FontWeight.w400,
              ),
              UIHelper.customVerticalSpace(4.0),
            ],
          ),
        TextFormField(
          readOnly: readOnly,
          keyboardType: type,
          cursorColor: appColor,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.textSize(14),
            color: AppColors.appBlackVariant,
          ),
          decoration: InputDecoration(
            filled: false,
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: borderColor ?? AppColors.grey1,
                width: 0.5,
              ),
            ),
            labelText: label,
            hintText: hintText ?? '',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: suffixIcon,
            suffixText: suffixText ?? '',
          ),
          obscureText: obscureText,
          enabled: enabled,
          onSaved: onSaved,
          initialValue: initialValue,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
