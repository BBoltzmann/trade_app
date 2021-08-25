import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/tabs/market.dart';
import 'package:trade_app/screens/tabs/notification.dart';
import 'package:trade_app/screens/tabs/trade.dart';
import 'package:trade_app/screens/wallet/wallet_page_view.dart';
import 'package:trade_app/utils/colors.dart';
import 'package:trade_app/utils/constants.dart';
import 'package:trade_app/widgets/app_text.dart';
import 'package:trade_app/widgets/size_config.dart';

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
    SizeConfig.init(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.appWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.appBlack.withOpacity(0.25),
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(4),
              ),
              height: SizeConfig.height(68),
              child: Column(
                children: [
                  SimpleText(
                    'Hello Celine',
                    size: 18,
                    weight: FontWeight.w700,
                    color: AppColors.appBlackVariant2,
                  ),
                  SimpleText(
                    'View Profile',
                    size: 12,
                    weight: FontWeight.w400,
                    color: AppColors.primaryMain50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          MarketScreen(),
          TradeScreen(),
          WalletPageView(),
          NotificationScreen(),
          // NetworkScreen()
        ],
      ),
    );
  }
}

class DrawerMenuRow extends StatelessWidget {
  const DrawerMenuRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
