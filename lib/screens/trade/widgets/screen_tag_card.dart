import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/widgets/text_widget.dart';

class ScreenTag extends StatefulWidget {
  final double height, width;
  final String text;
  final bool isTapped;
  const ScreenTag({Key key, this.height, this.width, this.text, this.isTapped = true}) : super(key: key);

  @override
  _ScreenTagState createState() => _ScreenTagState();
}

class _ScreenTagState extends State<ScreenTag> {
  // bool isTapped = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: widget.height.h,
        width: widget.width.w,
        decoration: BoxDecoration(
            color: widget.isTapped ? paleBlueDark : Colors.white,
            borderRadius: BorderRadius.circular(5.r)),
        child: Center(
          child: CustomText(
            widget.text,
            textColor: widget.isTapped ? Colors.white : textGrey,
          ),
        ),
      ),
    );
  }
}
