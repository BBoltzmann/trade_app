import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/outline_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  static const String route = 'OnboardingScreen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _numPages = 3;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage
          ? indicator(true, appColor)
          : indicator(false, appColor));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView(
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Image.asset("assets/images/onboarding1.png"),
                      SizedBox(height: 60),
                      Text('Upload a picture of your product',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Image.asset("assets/images/onboarding2.png"),
                      SizedBox(height: 60),
                      Text('View pictures of products around you',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Image.asset("assets/images/onboarding3.png"),
                      SizedBox(height: 60),
                      Text('Interact with a trader to secure a deal',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OultineButtonWidget(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen())),
                              title: 'Login',
                              textColor: appColor),
                          ButtonWidget( onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen())),
                              bgColor: appColor,
                              title: 'Sign up',
                              textColor: Colors.white),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              // visible: _currentPage == _numPages - 1 ? false : true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget indicator(bool isActive, Color color) {
  return AnimatedContainer(
    duration: Duration(microseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    height: 9.0,
    width: 17,
    decoration: BoxDecoration(
      color: isActive ? color : appColor.withOpacity(0.2),
      borderRadius: BorderRadius.all(Radius.circular((25))),
    ),
    // decoration: BoxDecoration(
    //   color: isActive ? Colors.white : Colors.black,
    //   borderRadius: BorderRadius.all(Radius.circular(50)),

    // ),
  );
}
