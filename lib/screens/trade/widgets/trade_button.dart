import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/widgets/text_widget.dart';

class TradeButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onTap;
  const TradeButton(this.text, {Key key, this.height = 36, this.width = 99, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: paleBlueDark,
        ),
        child: Center(
          child: CustomText(
            text,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
