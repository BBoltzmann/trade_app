import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/helpers/locator.dart';
import 'package:trade_app/screens/auth/email_verification.dart';
import 'package:trade_app/screens/auth/forgot_password.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/auth/onboarding.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/screens/auth/reset_password.dart';
import 'package:trade_app/screens/reports/report_homepage.dart';

void main() async {
  setupLocator();
  runApp(
    MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: LoginScreen.route,
        home: ReportsPage(),
        // routes: {
        //   OnboardingScreen.route: (context) => OnboardingScreen(),
        //   LoginScreen.route: (context) => LoginScreen(),
        //   RegisterScreen.route: (context) => RegisterScreen(),
        //   ForgotPassword.route: (context) => ForgotPassword(),
        //   ResetPassword.route: (context) => ResetPassword(),
        //   EmailVerification.route: (context) => EmailVerification(),
        // },
      ),
    );
  }
}
