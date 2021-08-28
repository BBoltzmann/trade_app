import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyButton extends StatelessWidget {
  final bool isSelected;
  final String currency;
  final Function onTap;
  const CurrencyButton({Key key, this.isSelected = true, this.currency, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected ? paleBlueDark : Colors.white,
        height: 46.h,
        child: CustomText(
          currency,
          fontSize: 14,
          textColor: isSelected ? Colors.white : black,
        ),
      ),
    );
  }
}
