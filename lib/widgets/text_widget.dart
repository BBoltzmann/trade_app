import 'package:flutter/material.dart';
import 'package:trade_app/utils/text_style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final FontStyle fontStyle;
  final Color textColor;
  const CustomText(this.text,
      {this.fontSize, this.weight, this.fontStyle, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style(
        fontSize: fontSize,
        weight: weight,
        fontStyle: fontStyle,
        textColor: textColor,
      ),
    );
  }
}
