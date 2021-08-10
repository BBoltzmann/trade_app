import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

reportWrapper(BuildContext context, Widget child) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        height: 500.h,
        width: double.infinity,
        child: child),
  );
}
