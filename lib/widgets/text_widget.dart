import 'package:flutter/material.dart';
import 'package:trade_app/utils/text_style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color textColor;
  const CustomText(this.text,
      {this.fontSize = 12, this.weight, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style(
        fontSize: fontSize,
        weight: weight,
        textColor: textColor,
      ),
    );
  }
}
