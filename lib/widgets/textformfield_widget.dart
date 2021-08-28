import 'package:flutter/material.dart';
import 'package:trade_app/widgets/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label, hintText, suffixText;
  final IconData  prefixIconData;
  final bool obscureText, enabled, iconData;
  final String initialValue;
  final TextEditingController controller;
  final Function onChanged, onSaved, onIconTap, onFieldSubmitted;
  final String Function(String) validator;
  final TextInputType type;
  final Color borderColor;
  final Color fillColor;
  final FocusNode focusNode;
  final int maxLines;

  const TextFormFieldWidget({
    Key key,
    this.label,
    this.hintText,
    this.iconData,
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
    this.type,
    this.onIconTap,
    this.maxLines = 1,
    this.prefixIconData,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: appColor,
        width: 1,
      ),
    );
    return TextFormField(
      keyboardType: type,
      cursorColor: appColor,
      decoration: iconData == false
          ? InputDecoration(
              filled: false,
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: appColor,
                  width: 1,
                ),
              ),
              disabledBorder: inputBorder,
              errorBorder: inputBorder.copyWith(
                borderSide: BorderSide(
                  color: Theme.of(context).errorColor,
                  width: 1,
                ),
              ),
              errorStyle: TextStyle(color: Theme.of(context).errorColor),
              labelText: label,
              hintText: hintText ?? '',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
            )
          : InputDecoration(
              filled: false,
              border: inputBorder,
              enabledBorder: inputBorder,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: appColor,
                  width: 1,
                ),
              ),
              labelText: label,
              hintText: hintText ?? '',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: InkWell(
                onTap: onIconTap,
                child: Icon(prefixIconData, color: Colors.grey[500]),
              ),
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
    );
  }
}
