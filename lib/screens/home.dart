import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/tabs/market.dart';
import 'package:trade_app/screens/tabs/network.dart';
import 'package:trade_app/screens/tabs/notification.dart';
import 'package:trade_app/screens/tabs/profile.dart';
import 'package:trade_app/screens/tabs/trade.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController tabController = new PageController(initialPage: 1);
  int currentPage;

  FlutterSecureStorage storage = getIt<FlutterSecureStorage>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  getToken() async {
    print(await storage.read(key: 'token'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.person_outline),
            TabItem(icon: Icons.bookmark_outline),
            TabItem(icon: Icons.add),
            TabItem(icon: Icons.notifications_outlined),
            TabItem(icon: Icons.chat_outlined)
          ],
          initialActiveIndex: 2, //optional, default as 0
          onTap: (position) {
            setState(() {
              currentPage = position;
              tabController.jumpToPage(position);
            });
          },
          style: TabStyle.fixedCircle,
          backgroundColor: appColor,
        ),
        body: PageView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ProfileScreen(),
              TradeScreen(),
              MarketScreen(),
              NotificationScreen(),
              NetworkScreen()
            ]));
  }
}
