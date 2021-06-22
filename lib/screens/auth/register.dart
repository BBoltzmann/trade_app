import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/auth/email_verification.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/country_state_city_picker.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const String route = 'RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends StateMVC<RegisterScreen> {
  UserController _con = new UserController();

  _RegisterScreenState() : super(UserController()) {
    _con = controller;
  }

  String countryValue;
  String stateValue;
  String cityValue;

  TextEditingController passwordController = new TextEditingController();

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
          key: _con.scaffoldKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign Up',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  'We will need some of your details and location to \ncreate your WOLE account',
                ),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.bottomLeft, child: Text('First Name')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    onChanged: (String input) => _con.user.firstname = input),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.bottomLeft, child: Text('Last Name')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    onChanged: (String input) => _con.user.lastname = input),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomLeft, child: Text('Email')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    onChanged: (String input) => _con.user.email = input),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomLeft, child: Text('Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    controller: passwordController,
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
                SizedBox(height: 10),
                SelectState(
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                    _con.user.country = value;
                    print(countryValue);
                  },
                  onStateChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                    _con.user.city = value;
                    print(cityValue);
                  },
                ),
                SizedBox(height: 30),
                ButtonWidget(
                    title: 'Sign up',
                    bgColor: appColor,
                    onPressed: () {
                      _con.user.phone = "090823463632";
                      _con.user.state = 'California';

                      if ((_con.user.firstname?.length ?? 0) < 3) {
                        Utility.showMessage(_con.scaffoldKey?.currentContext,
                            message: 'Name is too short');
                        return;
                      }
                      if ((_con.user.lastname?.length ?? 0) < 3) {
                        Utility.showMessage(_con.scaffoldKey?.currentContext,
                            message: 'Name is too short');
                        return;
                      }
                      if (!_con.user.email.contains('@')) {
                        Utility.showMessage(_con.scaffoldKey?.currentContext,
                            message: 'Please enter a valid email address');
                        return;
                      }
                      if (_con.user.password.length < 8) {
                        Utility.showMessage(_con.scaffoldKey?.currentContext,
                            message: 'Password is too short');
                        return;
                      }
                      if (passwordController.text != _con.user.password) {
                        Utility.showMessage(_con.scaffoldKey?.currentContext,
                            message: 'Passwords do not match');
                        return;
                      }
                      if (_con.user.country == null) {
                        Utility.showMessage(_con.scaffoldKey?.currentContext,
                            message: 'Please select your country');
                        return;
                      }
                      if (_con.user.city == null) {
                        Utility.showMessage(_con.scaffoldKey?.currentContext,
                            message: 'Please select your city');
                        return;
                      }
                      _con.register();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EmailVerification()));
                    }),
              ],
            ),
          ),
        ));
  }
}
