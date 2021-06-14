import 'package:flutter/material.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';

class HomeScreen extends StatefulWidget {
  static const String route = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Trade App', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ButtonWidget(
                title: 'Logout',
                bgColor: appColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                })
          ],
        )),
      ),
    );
  }
}
