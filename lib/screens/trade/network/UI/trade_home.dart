import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/trade/widgets/back_button.dart';
import 'package:trade_app/screens/trade/post/trade_post_screen.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/margins.dart';
import 'package:trade_app/utils/text_style.dart';
import 'package:trade_app/widgets/text_widget.dart';
import 'index.dart';

class TradeHome extends StatefulWidget {
  const TradeHome({Key key}) : super(key: key);

  @override
  _TradeHomeState createState() => _TradeHomeState();
}

PageController controller = PageController();
int currentIndex = 0;

class _TradeHomeState extends State<TradeHome> {
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250.h,
            width: double.infinity,
            child: Column(
              children: [
                verticalSpace(61),
                Padding(
                  padding: EdgeInsets.only(left: 34.w, right: 20.w),
                  child: Row(
                    children: [
                      TradeBackButton(
                        onTap: () {},
                      ),
                      horizontalSpace(57),
                      Container(
                        height: 45,
                        width: 220,
                        child: TextFormField(
                          cursorColor: searchBarGrey,
                          decoration: InputDecoration(
                            hintText: "search, profile, price",
                            hintStyle: style(
                                weight: FontWeight.w400,
                                textColor: searchBarGrey),
                            suffixIcon: InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                "assets/images/search.svg",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: searchBarGrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: searchBarGrey),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                verticalSpace(24),
                Padding(
                  padding: EdgeInsets.only(left: 20.h, right: 24.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        "Trade Network",
                        fontSize: 24,
                        weight: FontWeight.w700,
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TradePostScreen(),
                            ),
                          );
                        },
                        child: Icon(Icons.add),
                        backgroundColor: paleBlueDark,
                      ),
                    ],
                  ),
                ),
                verticalSpace(28),
                Container(
                  height: height(44),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                              onTap: () => controller.jumpToPage(0),
                              child: ScreenTag(
                                height: 36,
                                width: 48,
                                text: "All",
                                isTapped: currentIndex == 0 ? true : false,
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.jumpToPage(1),
                              child: ScreenTag(
                                height: 36,
                                width: 69,
                                text: "Ongoing",
                                isTapped: currentIndex == 1 ? true : false,
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.jumpToPage(2),
                              child: ScreenTag(
                                height: 36,
                                width: 77,
                                text: "Disputed",
                                isTapped: currentIndex == 2 ? true : false,
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.jumpToPage(3),
                              child: ScreenTag(
                                height: 36,
                                width: 82,
                                text: "Completed",
                                isTapped: currentIndex == 3 ? true : false,
                              ),
                            ),
                            InkWell(
                              onTap: () => controller.jumpToPage(4),
                              child: ScreenTag(
                                height: 36,
                                width: 82,
                                text: "Incomplete",
                                isTapped: currentIndex == 4 ? true : false,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(16),
          Container(
            height: 490.h,
            width: double.infinity,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: onchahged,
              controller: controller,
              children: [
                AllTrades(),
                OngoingTrades(),
                DisputedTrades(),
                CompletedTrades(),
                IncompleteTrades()
              ],
            ),
          )
        ],
      ),
    );
  }

  onchahged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
