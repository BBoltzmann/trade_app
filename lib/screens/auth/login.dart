import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/auth/forgot_password.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/screens/widgets/button_widget.dart';
import 'package:trade_app/screens/widgets/constants.dart';
import 'package:trade_app/screens/widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset("assets/images/login.svg")),
          SizedBox(height: 20),
          Text('Welcome!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 30),
          Align(alignment: Alignment.bottomLeft, child: Text('Email')),
          SizedBox(height: 10),
          TextFormFieldWidget(borderColor: appColor),
          SizedBox(height: 20),
          Align(alignment: Alignment.bottomLeft, child: Text('Password')),
          SizedBox(height: 10),
          TextFormFieldWidget(borderColor: appColor),
          SizedBox(height: 10),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));
              },
              child:
                  Text('Forgot Password?', style: TextStyle(color: appColor))),
          SizedBox(height: 30),
          ButtonWidget(title: 'Login', bgColor: appColor, onPressed: () {}),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account yet? '),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text(' Sign up', style: TextStyle(color: appColor))),
            ],
          ),
        ],
      ),
    ));
  }
}
