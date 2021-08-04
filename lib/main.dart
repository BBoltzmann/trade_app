import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/helpers/locator.dart';
import 'package:trade_app/screens/auth/email_verification.dart';
import 'package:trade_app/screens/auth/forgot_password.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/auth/onboarding.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/screens/auth/reset_password.dart';

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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        // debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.route,
        routes: {
          OnboardingScreen.route: (context) => OnboardingScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          RegisterScreen.route: (context) => RegisterScreen(),
          ForgotPassword.route: (context) => ForgotPassword(),
          ResetPassword.route: (context) => ResetPassword(),
          EmailVerification.route: (context) => EmailVerification(),
        },
      ),
    );
  }
}

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:trade_app/utils%20/locator.dart';
// import 'package:trade_app/utils%20/navigator.dart';
// import 'package:trade_app/utils%20/router.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   locatorSetup();

//   runApp(
//     // Material App providing MediaQuery as an ancestor.
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TradeApp(),
//     ),
//   );
// }

// class TradeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(MediaQuery.of(context).size.height,
//           MediaQuery.of(context).size.height),
//       builder: () => MaterialApp(
//         navigatorKey: locator<NavigationService>().navigationKey,
//         onGenerateRoute: generateRoute,
//       ),
