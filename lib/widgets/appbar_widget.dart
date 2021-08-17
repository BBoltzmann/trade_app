import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool leading;

  AppBarWidget({required this.title,required this.leading});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: Text(title,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600)),
      automaticallyImplyLeading: leading,
      centerTitle: false,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      brightness: Brightness.light,
      elevation: 5,
    );
  }
}
