import 'package:flutter/material.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/wallet/wallet_page_view.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: LoginScreen.route,
      //  routes: {
      //    OnboardingScreen.route: (context) => OnboardingScreen(),
      //    LoginScreen.route: (context) => LoginScreen(),
      //    RegisterScreen.route: (context) => RegisterScreen(),
      //    ForgotPassword.route: (context) => ForgotPassword(),
      //    ResetPassword.route: (context) => ResetPassword(),
      //    EmailVerification.route: (context) => EmailVerification(),
      //    HomeScreen.route: (context) => HomeScreen(),
      //  },
      home: WalletPageView(),
    );
  }
}
