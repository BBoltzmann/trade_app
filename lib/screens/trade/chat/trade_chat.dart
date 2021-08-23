import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/trade/network/UI/index.dart';
import 'package:trade_app/screens/trade/widgets/back_button.dart';
import 'package:trade_app/screens/trade/widgets/dial.dart';
import 'package:trade_app/screens/trade/widgets/trade_button.dart';
import 'package:trade_app/utils/margins.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/widgets/text_widget.dart';

class TradeChat extends StatefulWidget {
  const TradeChat({Key key}) : super(key: key);

  @override
  _TradeChatState createState() => _TradeChatState();
}

class _TradeChatState extends State<TradeChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(58),
          Padding(
            padding: EdgeInsets.only(left: 29.w, right: 16.w),
            child: Container(
              height: height(52),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TradeBackButton(),
                  horizontalSpace(20),
                  Container(
                    width: width(267),
                    child: CustomText(
                      "Chat with a trader to discuss the terms of this trade!",
                      fontSize: 16,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(46),
          Card(
            child: Container(
              height: height(143),
              width: width(335),
              child: Row(
                children: [
                  Container(
                    height: height(143),
                    width: width(146),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      image: DecorationImage(
                          image: NetworkImage("https://picsum.photos/200/300"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  horizontalSpace(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width(147),
                        child:
                            CustomText("Deal: Fresh nutritious strawberries"),
                      ),
                      verticalSpace(20),
                      Container(
                        height: height(19.17),
                        child: Row(
                          children: [
                            InkWell(
                              child: SvgPicture.asset(
                                "assets/images/price_tag.svg",
                              ),
                            ),
                            CustomText("\$ 5.00")
                          ],
                        ),
                      ),
                      verticalSpace(13.83),
                      TradeButton("Trade")
                    ],
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          CustomText("Friday 16th July, 2021", weight: FontWeight.w600,),
          verticalSpace(8),
          EmptyTradeBaloon("Failure to click on the TRADE button within 24hrs from now closes this chat.", height: 61,),
          verticalSpace(174),
          CountDownDial(),
        ],
      ),
    );
  }
}
