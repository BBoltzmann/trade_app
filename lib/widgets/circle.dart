import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/utils/colors.dart';

Widget circleVerify() {
  return Container(
    height: 30.h,
    width: 30.h,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(30.r), color: green),
    child: SvgPicture.asset(
      "assets/images/verify.svg",
      color: Colors.white,
      fit: BoxFit.scaleDown,
    ),
  );
}
