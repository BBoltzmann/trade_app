import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle style(
  {double fontSize = 12,
  final FontWeight weight,
  final FontStyle fontStyle,
  final Color textColor,
}) {
  return GoogleFonts.nunito(
    color: textColor,
    fontSize: fontSize.h,
    fontWeight: weight,
    fontStyle: fontStyle,
  );
}
