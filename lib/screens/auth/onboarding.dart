import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/widgets/constants.dart';

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
          ? indicator(true, Colors.orangeAccent)
          : indicator(false, Colors.orangeAccent));
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
                      SvgPicture.asset("assets/images/onboarding1.svg"),
                      SizedBox(height: 60),
                      Text('Etiam lobortis a sit pretium proin cras.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus.',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                      SizedBox(height: 40),
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: appColor,
                        child: Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      SvgPicture.asset("assets/images/onboarding3.svg"),
                      SizedBox(height: 60),
                      Text('Etiam lobortis a sit pretium proin cras.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus.',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                      SizedBox(height: 40),
                      FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: appColor,
                        child: Icon(Icons.chevron_right),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      SvgPicture.asset("assets/images/onboarding2.svg"),
                      SizedBox(height: 60),
                      Text('Etiam lobortis a sit pretium proin cras.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Netus.',
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                      SizedBox(height: 40),
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        backgroundColor: appColor,
                        child: Icon(Icons.chevron_right),
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
    width: 9.0,
    decoration: BoxDecoration(
      color: isActive ? color : Colors.grey[400],
      borderRadius: BorderRadius.all(Radius.circular((25))),
    ),
    // decoration: BoxDecoration(
    //   color: isActive ? Colors.white : Colors.black,
    //   borderRadius: BorderRadius.all(Radius.circular(50)),

    // ),
  );
}
