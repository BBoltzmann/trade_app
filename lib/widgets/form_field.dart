import 'package:flutter/material.dart';

Widget textFormField(
    {String hintText,
    TextEditingController controller,
    Color borderColor,
    Color enabledBorderColor,
    Widget suffixIcon}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: enabledBorderColor),
      ),
    ),
  );
}
