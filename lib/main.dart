import 'package:flutter/material.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/auth/email_verification.dart';
import 'package:trade_app/screens/auth/forgot_password.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/auth/onboarding.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/screens/auth/reset_password.dart';
import 'package:trade_app/screens/home.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.route,
      routes: {
        OnboardingScreen.route: (context) => OnboardingScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        RegisterScreen.route: (context) => RegisterScreen(),
        ForgotPassword.route: (context) => ForgotPassword(),
        ResetPassword.route: (context) => ResetPassword(),
        EmailVerification.route: (context) => EmailVerification(),
        HomeScreen.route: (context) => HomeScreen(),
      },
    );
  }
}
