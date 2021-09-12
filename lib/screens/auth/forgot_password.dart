import 'package:flutter/material.dart';
import 'package:trade_app/screens/auth/email_verification.dart';
import 'package:trade_app/utils/constants.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class ForgotPassword extends StatefulWidget {
  static const String route = 'ForgotPassword';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBarWidget(
              leading: true,
              title: '',
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Forgot Password',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                    'Enter the email associated with your account to receive instructions on how to reset password'),
                SizedBox(height: 50),
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
                              builder: (context) => EmailVerification()));
                    }),
              ],
            ),
          ),
        ));
  }
}
