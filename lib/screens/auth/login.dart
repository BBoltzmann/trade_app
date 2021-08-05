import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/auth/forgot_password.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  UserController _con = new UserController();

  _LoginScreenState() : super(UserController()) {
    _con = controller as UserController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
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
              TextFormFieldWidget(
                  borderColor: appColor,
                  onChanged: (String input) => _con.user.email = input),
              SizedBox(height: 20),
              Align(alignment: Alignment.bottomLeft, child: Text('Password')),
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
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text('Forgot Password?',
                      style: TextStyle(color: appColor))),
              SizedBox(height: 30),
              ButtonWidget(
                  title: 'Login',
                  bgColor: appColor,
                  onPressed: () {
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
                    _con.login();
                  }),
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
                      child:
                          Text(' Sign up', style: TextStyle(color: appColor))),
                ],
              ),
            ],
          ),
        ));
  }
}
