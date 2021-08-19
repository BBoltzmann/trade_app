import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/helpers/utility.dart';
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
    _con = controller as UserController;
  }

  String? countryValue;
  String? stateValue;
  String? cityValue;

  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });

  TextEditingController passwordController = new TextEditingController();

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
          key: _con.scaffoldKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create Account', style: TextStyle(fontSize: 25)),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.bottomLeft, child: Text('First Name')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    onChanged: (String? input) => _con.user.firstname = input),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.bottomLeft, child: Text('Last Name')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    onChanged: (String? input) => _con.user.lastname = input),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomLeft, child: Text('Email')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    onChanged: (String? input) => _con.user.email = input),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomLeft, child: Text('Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(
                    borderColor: appColor,
                    controller: passwordController,
                    obscureText: _con.hidePassword,
                    //     onIconTap: () => _con.togglePasswordVisibility(),
                    // iconData: true,
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
                    onChanged: (String? input) => _con.user.password = input,
                    obscureText: _con.hidePassword,
                    //       onIconTap: () => _con.togglePasswordVisibility(),
                    //     iconData: true,
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
                  onCityChanged: (String value) {},
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                        value: rememberMe, onChanged: _onRememberMeChanged),
                    Expanded(
                      child: Container(
                        child: Text(
                            'I consent to the Privacy Policy and Terms and conditions and understand that I am opting in to be contacted by Wole, including until such time that I may choose to opt out',
                            style: TextStyle(
                              fontSize: 11
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ButtonWidget(
                    title: 'Sign up',
                    bgColor: appColor,
                    onPressed: () {
                      _con.user.phone = "090823463632";
                      _con.user.state = 'California';

                      if ((_con.user.firstname?.length ?? 0) < 3) {
                        Utility.showMessage(_con.scaffoldKey.currentContext!,
                            message: 'Name is too short');
                        return;
                      }
                      if ((_con.user.lastname?.length ?? 0) < 3) {
                        Utility.showMessage(_con.scaffoldKey.currentContext!,
                            message: 'Name is too short');
                        return;
                      }
                      if (!(_con.user.email?.contains('@') ?? false)) {
                        Utility.showMessage(_con.scaffoldKey.currentContext!,
                            message: 'Please enter a valid email address');
                        return;
                      }
                      if ((_con.user.password?.length ?? 0) < 8) {
                        Utility.showMessage(_con.scaffoldKey.currentContext!,
                            message: 'Password is too short');
                        return;
                      }
                      if (passwordController.text != _con.user.password) {
                        Utility.showMessage(_con.scaffoldKey.currentContext!,
                            message: 'Passwords do not match');
                        return;
                      }
                      if (_con.user.country == null) {
                        Utility.showMessage(_con.scaffoldKey.currentContext!,
                            message: 'Please select your country');
                        return;
                      }
                      if (_con.user.city == null) {
                        Utility.showMessage(_con.scaffoldKey.currentContext!,
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
