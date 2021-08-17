import 'package:flutter/material.dart';

class SizeConfig {
  static BuildContext? appContext;
  static MediaQueryData? _mediaQueryData;
  static const double _designHeight = 812.0;
  static const double _designWidth = 375.0;
  static const double _textWidthRatio = 400.0;
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    appContext = context;
  }

  static double height(double height) {
    double screenHeight = _mediaQueryData!.size.height / _designHeight;
    return height * screenHeight;
  }

  static double width(double width) {
    double screenWidth = _mediaQueryData!.size.width / _designWidth;
    return width * screenWidth;
  }

  static double textSize(double textSize) {
    double screenWidth = _mediaQueryData!.size.width / _textWidthRatio;
    return textSize * screenWidth;
  }
}
