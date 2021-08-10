import 'package:code_field/code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/auth/reset_password.dart';
import 'package:trade_app/widgets/appbar_widget.dart';
import 'package:trade_app/widgets/button_widget.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/textformfield_widget.dart';

class EmailVerification extends StatefulWidget {
  static const String route = 'EmailVerification';

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  InputCodeControl codeControl = InputCodeControl(inputRegex: '^[0-9]*\$');

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
              children: [
                Text('Verification Code',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                SizedBox(height: 10),
                Text(
                    'Please enter the verification code sent to your email address'),
                SizedBox(height: 20),
                
                InputCodeField(
                  control: codeControl,
                  count: 6,
                  inputType: TextInputType.number,
                  decoration: InputCodeDecoration(
                    focusColor: appColor,
                    color: Colors.grey,
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Brand-Bold'),
                  ),
                ),
                SizedBox(height: 30),
                ButtonWidget(
                    title: 'Verify',
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
