import 'package:flutter/material.dart';
import 'package:trade_app/widgets/size_config.dart';

/// Contains useful constants to reduce boilerplate and duplicate code
class UIHelper {
  // Vertical spacing constants.
  static double _verticalSpaceSmall = SizeConfig.width(8.0);
  static double _verticalSpaceMedium = SizeConfig.width(16.0);
  static double _verticalSpaceMediumPlus = SizeConfig.width(20.0);
  static double _verticalSpaceLarge = SizeConfig.width(40.0);

  // Horizontal spacing constants.
  static double _horizontalSpaceSmall = SizeConfig.height(8.0);
  static double _horizontalSpaceMedium = SizeConfig.height(16.0);
  static double _horizontalSpaceLarge = SizeConfig.height(60.0);

  static Widget customVerticalSpace(double height) =>
      SizedBox(height: SizeConfig.height(height));
  static Widget customHorizontalSpace(double width) =>
      SizedBox(width: SizeConfig.width(width));
  static Widget verticalSpaceSmall = SizedBox(height: _verticalSpaceSmall);
  static Widget verticalSpaceMedium = SizedBox(height: _verticalSpaceMedium);
  static Widget verticalSpaceMediumPlus =
      SizedBox(height: _verticalSpaceMediumPlus);
  static Widget verticalSpaceLarge = SizedBox(height: _verticalSpaceLarge);

  static Widget horizontalSpaceSmall = SizedBox(width: _horizontalSpaceSmall);
  static Widget horizontalSpaceMedium = SizedBox(width: _horizontalSpaceMedium);
  static Widget horizontalSpaceLarge = SizedBox(width: _horizontalSpaceLarge);
}
