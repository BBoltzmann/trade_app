import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/screens/reports/handler.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/margins.dart';
import 'package:trade_app/widgets/text_widget.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key key}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: back_arrow_grey,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: CustomText("REPORT",
            fontSize: 24,
            fontStyle: FontStyle.normal,
            weight: FontWeight.w600,
            textColor: black),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 190.h,
              width: double.infinity,
              child: Column(
                children: [
                  verticalSpace(44),
                  CustomText("Why are you reporting this post?",
                      fontSize: 20,
                      weight: FontWeight.w600,
                      fontStyle: FontStyle.normal),
                  // verticalSpace(24),
                  Container(
                    width: 291.w,
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.w, vertical: height(24)),
                    child: Center(
                      child: CustomText(
                        "Your report remains anonymous except for intellectual property reports. If any of these reports concerns life threatening events, Please contact your local security.",
                        fontSize: 12,
                        weight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        textColor: back_arrow_grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 480.h,
              width: double.infinity,
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    reportHandler(context, reports[index]);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, bottom: 24.h),
                    child: CustomText(
                      reports[index],
                      weight: FontWeight.w400,
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      textColor: black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> reports = [
    "It's Spam",
    "Scam or Fraudulent",
    "Sale of illegal or regulated goods",
    "Hate speech or symbol",
    "Intellectual property violation",
    "Nudity or Sexual activity",
    "False Information",
    "Violence",
    "Bullying or harassment",
    "Other reports"
  ];
}
