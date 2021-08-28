import 'package:flutter/material.dart';
import 'package:trade_app/constants/strings.dart';
import 'package:trade_app/utils/margins.dart';
import 'package:trade_app/widgets/circle.dart';
import 'package:trade_app/widgets/text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/text_style.dart';
import 'package:trade_app/widgets/button_widget.dart';


Widget spamScam(String reportType) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      verticalSpace(10),
      CustomText(
        reportType,
        fontSize: 20,
        weight: FontWeight.w700,
      ),
      verticalSpace(16),
      circleVerify(),
      verticalSpace(24),
      const CustomText(
        reportThanks,
        fontSize: 16,
        weight: FontWeight.w400,
      ),
      verticalSpace(19),
      Container(
        width: 308.w,
        height: 39.h,
        child: const CustomText(
          reportStatement,
          fontSize: 16,
          weight: FontWeight.w400,
        ),
      )
    ],
  );
}

Widget submitReport(String reportType,{String hintText = "Tell us about it?"}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      verticalSpace(10),
      CustomText(
        reportType,
        fontSize: 20,
        weight: FontWeight.w700,
      ),
      verticalSpace(63),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.h),
        child: Card(
          child: Container(
            height: 118.h,
            width: double.infinity,
            child: TextFormField(
              maxLines: 10,
              decoration: InputDecoration(
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: Colors.transparent)),
                hintText: hintText,
                hintStyle: style(
                  weight: FontWeight.w400,
                  textColor: back_arrow_grey,
                ),
              ),
            ),
          ),
        ),
      ),
      verticalSpace(71.5),
      ButtonWidget(
        padding: 30,
        title: "Submit Report",
        bgColor: submitReportBlue,
      )
    ],
  );
}

