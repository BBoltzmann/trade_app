import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trade_app/screens/trade/widgets/back_button.dart';
import 'package:trade_app/screens/trade/widgets/trade_button.dart';
import 'package:trade_app/utils/margins.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/widgets/text_widget.dart';

class TradePostReviewScreen extends StatefulWidget {
  final File image;
  final String description;

  const TradePostReviewScreen({Key key, this.image, this.description})
      : super(key: key);

  @override
  _TradePostReviewScreenState createState() => _TradePostReviewScreenState();
}

class _TradePostReviewScreenState extends State<TradePostReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(61),
          Container(
            height: height(40),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TradeBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(51),
          Container(
            height: height(44),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height(36.1),
                  width: width(36.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/200/300"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                horizontalSpace(6.92),
                Column(
                  children: [
                    CustomText(
                      "Celine Jones",
                      fontSize: 18,
                      weight: FontWeight.w700,
                    ),
                    CustomText(
                      "Nicosia, Cyprus",
                      fontSize: 14,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(3.92),
          widget.image != null
              ? Container()
              : Container(
                  height: height(184),
                  width: width(334),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.file(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
          verticalSpace(7.0),
          Card(
            child: Container(
              height: height(80),
              width: width(334),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: CustomText(
                widget.description,
                fontSize: 12,
                weight: FontWeight.w300,
              ),
            ),
          ),
          verticalSpace(131),
          TradeButton(
            "Post",
            height: 48,
            width: 335,
          )
        ],
      ),
    );
  }
}
