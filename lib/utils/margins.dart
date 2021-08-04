import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget horizontalSpaceTiny = SizedBox(width: ScreenUtil().setWidth(5.0));
Widget horizontalSpaceSmall = SizedBox(width: ScreenUtil().setWidth(10.0));
Widget horizontalSpaceMedium = SizedBox(width: ScreenUtil().setWidth(25.0));

Widget verticalSpaceTiny = SizedBox(height: ScreenUtil().setWidth(5.0));
Widget verticalSpaceSmall = SizedBox(height: ScreenUtil().setWidth(10.0));
Widget verticalSpaceMedium = SizedBox(height: ScreenUtil().setWidth(25.0));
Widget verticalSpaceSpecial = SizedBox(height: ScreenUtil().setWidth(40.0));
Widget verticalSpaceLarge = SizedBox(height: ScreenUtil().setWidth(50.0));
Widget verticalSpaceMassive = SizedBox(height: ScreenUtil().setWidth(120.0));

Widget spacedDivider = Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: ScreenUtil().setWidth(5.0)),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);


double height(double height){
  return ScreenUtil().setHeight(height);
}

double width(double width){
  return ScreenUtil().setWidth(width);
}