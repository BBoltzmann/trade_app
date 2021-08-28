import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/widgets/text_widget.dart';

class EmptyTradeBaloon extends StatelessWidget {
  final String text;
  final double height, width;
  const EmptyTradeBaloon(this.text, {Key key, this.height = 92, this.width = 239}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: baloonColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: CustomText(text, textColor: yellow,)
      ),
    );
  }
}
