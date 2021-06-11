import 'package:flutter/material.dart';
import 'package:trade_app/screens/auth/reset_password.dart';
import 'package:trade_app/screens/widgets/appbar_widget.dart';
import 'package:trade_app/screens/widgets/button_widget.dart';
import 'package:trade_app/screens/widgets/constants.dart';
import 'package:trade_app/screens/widgets/country_state_city_picker.dart';
import 'package:trade_app/screens/widgets/textformfield_widget.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBarWidget(
              leading: true,
              title: '',
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Forgot Password',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  'We will need your registered email, and a reset code  will be sent to reset your password',
                ),
                SizedBox(height: 30),
                Align(alignment: Alignment.bottomLeft, child: Text('Email')),
                SizedBox(height: 10),
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 30),
                ButtonWidget(
                    title: 'Continue',
                    bgColor: appColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()));
                    }),
              ],
            ),
          ),
        ));
  }
}
