import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils%20/locator.dart';
import 'package:trade_app/utils%20/navigator.dart';
import 'package:trade_app/utils%20/router.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locatorSetup();

  runApp(
    // Material App providing MediaQuery as an ancestor.
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TradeApp(),
    ),
  );
}

class TradeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.height,
          MediaQuery.of(context).size.height),
      builder: () => MaterialApp(
        navigatorKey: locator<NavigationService>().navigationKey,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
