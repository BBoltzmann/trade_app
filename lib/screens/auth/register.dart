import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/auth/email_verification.dart';
import 'package:trade_app/screens/widgets/appbar_widget.dart';
import 'package:trade_app/screens/widgets/button_widget.dart';
import 'package:trade_app/screens/widgets/constants.dart';
import 'package:trade_app/screens/widgets/country_state_city_picker.dart';
import 'package:trade_app/screens/widgets/textformfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String countryValue;
  String stateValue;
  String cityValue;

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
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 20),
                Align(
                    alignment: Alignment.bottomLeft, child: Text('Last Name')),
                SizedBox(height: 10),
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomLeft, child: Text('Email')),
                SizedBox(height: 10),
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomLeft, child: Text('Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Confirm Password')),
                SizedBox(height: 10),
                TextFormFieldWidget(borderColor: appColor),
                SizedBox(height: 10),
                SelectState(
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                    print(countryValue);
                  },
                  onStateChanged: (value) {
                    setState(() {
                      cityValue = value;
                    });
                    print(cityValue);
                  },
                ),
                SizedBox(height: 30),
                ButtonWidget(
                    title: 'Sign up',
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
