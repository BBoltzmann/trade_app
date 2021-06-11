import 'package:flutter/material.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/widgets/appbar_widget.dart';
import 'package:trade_app/screens/widgets/button_widget.dart';
import 'package:trade_app/screens/widgets/constants.dart';
import 'package:trade_app/screens/widgets/textformfield_widget.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                Text('Reset Password',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  'Set a new and safe password',
                ),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('New Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Confirm Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 30),
                ButtonWidget(
                    title: 'Done',
                    bgColor: appColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
              ],
            ),
          ),
        ));
  }
}
