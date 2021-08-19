import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class ResetPassword extends StatefulWidget {
  static const String route = 'ResetPassword';

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends StateMVC<ResetPassword> {
  UserController _con = new UserController();

  _ResetPasswordState() : super(UserController()) {
    _con = controller;
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create New Password',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  'New password must be different from previous password',
                ),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('New Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    // controller: passwordController,
                    obscureText: _con.hidePassword,
                    onIconTap: () => _con.togglePasswordVisibility(),
                    iconData: true,
                    prefixIconData: _con.hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Confirm Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    onChanged: (String input) => _con.user.password = input,
                    obscureText: _con.hidePassword,
                    onIconTap: () => _con.togglePasswordVisibility(),
                    iconData: true,
                    prefixIconData: _con.hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
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
