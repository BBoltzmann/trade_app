import 'package:flutter/material.dart';
import 'package:trade_app/screens/reports/report_wrapper.dart';
import 'package:trade_app/widgets/reports_widget.dart';

reportHandler(BuildContext context, String reportType) {
  if (reportType.contains("Spam")) {
    return reportWrapper(
      context,
      spamScam(reportType),
    );
  } else if (reportType.contains("Scam")) {
    return reportWrapper(
      context,
      spamScam(reportType),
    );
  } else if (reportType.contains("Other")) {
    return reportWrapper(
      context,
      submitReport(reportType,
          hintText: "What do you want to report about this post?"),
    );
  } else {
    reportWrapper(
      context,
      submitReport(reportType),
    );
  }
}
