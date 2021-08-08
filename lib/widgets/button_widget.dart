import 'package:flutter/material.dart';
import 'package:trade_app/utils/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color textColor, bgColor;
  final double padding;

  ButtonWidget({this.title, this.onPressed, this.textColor, this.bgColor, this.padding = 70});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.w),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5))),
            backgroundColor: MaterialStateProperty.all(bgColor),
            foregroundColor: MaterialStateProperty.all(textColor)),
        onPressed: onPressed,
        child: Container(
          height: 30.h,
          child: Center(
            child: Text(
              title,
              style: style(fontSize: 12.h, textColor: Colors.white, ),
            ),
          ),
        ),
      ),
    );
  }
}
