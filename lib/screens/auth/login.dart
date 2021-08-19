import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:trade_app/controllers/user_controller.dart';
import 'package:trade_app/helpers/utility.dart';
import 'package:trade_app/screens/auth/forgot_password.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/screens/home.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/size_config.dart';
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
    SizeConfig.init(context);
    return Scaffold(
        key: _con.scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBarWidget(
              leading: false,
              title: '',
            )),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back!', style: TextStyle(fontSize: 25)),
              SizedBox(height: 60),
              Align(alignment: Alignment.bottomLeft, child: Text('Email')),
              SizedBox(height: 10),
              TextFormFieldWidget(
                  borderColor: appColor,
                  onChanged: (String? input) => _con.user.email = input),
              SizedBox(height: 20),
              Align(alignment: Alignment.bottomLeft, child: Text('Password')),
              SizedBox(height: 10),
              TextFormFieldWidget(
                  borderColor: appColor,
                  onChanged: (String? input) => _con.user.password = input,
                  obscureText: _con.hidePassword,
                  //onIconTap: () => _con.togglePasswordVisibility(),
                  //iconData: true,
                  prefixIconData: _con.hidePassword
                      ? Icons.visibility
                      : Icons.visibility_off),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Center(
                    child: Text('Forgot Password?',
                        style: TextStyle(color: appColor)),
                  )),
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
                    // _con.login();
                    Navigator.of(context).pushReplacementNamed(
                      HomeScreen.route,
                      arguments: 0,
                    );
                  }),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(' Sign up',
                          style: TextStyle(
                              color: appColor, fontWeight: FontWeight.bold))),
                ],
              ),
            ],
          ),
        ));
  }
}
