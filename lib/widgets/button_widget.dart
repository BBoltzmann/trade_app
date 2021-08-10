import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color textColor, bgColor;

  ButtonWidget({this.title, this.onPressed, this.textColor, this.bgColor});
  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(5))),
            backgroundColor: MaterialStateProperty.all(bgColor)),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Container(
            height: 20,
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
     
      ),
    );
  }
}
