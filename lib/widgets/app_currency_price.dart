import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/ui_helpers.dart';

import 'app_text.dart';

class AppCurrencyWithLabel extends StatelessWidget {
  const AppCurrencyWithLabel({Key? key, this.size, this.color, this.fontSize})
      : super(key: key);
  final double? size;
  final Color? color;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageIcon(
          AssetImage('assets/icons/tele-icon.png'),
          size: size ?? 16,
          color: color ?? Colors.white,
        ),
        UIHelper.customHorizontalSpace(4.0),
        SimpleText(
          '1,500',
          size: fontSize ?? 16,
          color: color ?? AppColors.appWhite,
          weight: FontWeight.w700,
        ),
      ],
    );
  }
}
