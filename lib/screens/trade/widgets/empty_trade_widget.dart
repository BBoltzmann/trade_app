import 'package:flutter/material.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/widgets/text_widget.dart';

class EmptyTradeBaloon extends StatelessWidget {
  const EmptyTradeBaloon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 16),
      height: 92.h,
      width: 239.w,
      decoration: BoxDecoration(
        color: baloonColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: CustomText("You currently do not have any trades. Create a TRADE or contact a trader to make trade records.", textColor: yellow,)
      ),
    );
  }
}
