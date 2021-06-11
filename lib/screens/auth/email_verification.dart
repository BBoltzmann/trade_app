import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/screens/auth/register.dart';
import 'package:trade_app/screens/widgets/appbar_widget.dart';
import 'package:trade_app/screens/widgets/button_widget.dart';
import 'package:trade_app/screens/widgets/constants.dart';
import 'package:trade_app/screens/widgets/textformfield_widget.dart';

class EmailVerification extends StatefulWidget {
  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBarWidget(
              leading: true,
              title: '',
            )),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: SvgPicture.asset("assets/images/email_verify.svg")),
                  SizedBox(height: 30),
                  Text('Email Verification',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 10),
                  Text(
                    ' Please confirm the Email address with a code sent to the email used in the previous stage',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Confirmation Code',
                          style: TextStyle(color: appColor))),
                  SizedBox(height: 10),
                  TextFormFieldWidget(borderColor: appColor),
                  SizedBox(height: 30),
                  ButtonWidget(
                      title: 'Verify',
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
          ),
        ));
  }
}
