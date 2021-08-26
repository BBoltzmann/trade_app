import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/tabs/market.dart';
import 'package:trade_app/screens/tabs/notification.dart';
import 'package:trade_app/screens/tabs/profile.dart';
import 'package:trade_app/screens/tabs/trade.dart';
import 'package:trade_app/widgets/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // PageController tabController = new PageController(initialPage: 1);
  int currentPage = 0;
  late TabController tabController;
  int selectedIndex = 0;
  bool isSelected1 = true,
      isSelected2 = false,
      isSelected3 = false,
      isSelected4 = false,
      isSelected5 = false;

  FlutterSecureStorage storage = getIt<FlutterSecureStorage>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
    tabController = TabController(length: 4, vsync: this);
  }

  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController..index = selectedIndex;
      print(selectedIndex);

      switch (index) {
        case 0:
          isSelected1 = true;
          isSelected2 = false;
          isSelected3 = false;
          isSelected4 = false;
          break;
        case 1:
          isSelected1 = false;
          isSelected2 = true;
          isSelected3 = false;
          isSelected4 = false;
          break;
        case 2:
          isSelected1 = false;
          isSelected2 = false;
          isSelected3 = true;
          isSelected4 = false;
          break;
        case 3:
          isSelected1 = false;
          isSelected2 = false;
          isSelected3 = false;
          isSelected4 = true;
          break;

        default:
      }
    });
  }

  getToken() async {
    print(await storage.read(key: 'token'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/market.svg',
                    color: isSelected1 ? appColor : Colors.grey),
                title:
                    Text(isSelected1 ? '' : '', style: TextStyle(fontSize: 0))),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/trade.svg',
                    color: isSelected2 ? appColor : Colors.grey),
                title:
                    Text(isSelected2 ? '' : '', style: TextStyle(fontSize: 0))),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/wallet.svg',
                    color: isSelected3 ? appColor : Colors.grey),
                title:
                    Text(isSelected3 ? '' : '', style: TextStyle(fontSize: 0))),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/images/notifications.svg',
                    color: isSelected4 ? appColor : Colors.grey),
                title:
                    Text(isSelected4 ? '' : '', style: TextStyle(fontSize: 0))),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: appColor,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          onTap: onItemClicked,
        ),
        body: TabBarView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ProfileScreen(),
              TradeScreen(),
              MarketScreen(),
              NotificationScreen(),
              // NetworkScreen()
            ]));
  }
}
