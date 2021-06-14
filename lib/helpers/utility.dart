import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:trade_app/screens/auth/login.dart';
import 'package:trade_app/widgets/constants.dart';
import 'package:trade_app/widgets/overlay_widget.dart';

class Utility {
  BuildContext context;
  Utility.of(BuildContext _context) {
    this.context = _context;
  }

  static void logout(BuildContext context) async {
    // print("In Log out");
    final loader = Utility.load(context);
    final storage = getIt<FlutterSecureStorage>();
    storage.deleteAll();
    loader.remove();

    Navigator.of(context).pushNamedAndRemoveUntil(
      LoginScreen.route,
      (Route<dynamic> route) => false,
    );
  }

  static OverlayEntry load(BuildContext context) {
    return showOverlay(
      context,
      OverlayWidget(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }

  static showMessage(
    BuildContext context, {
    String message,
    IconData iconData,
    MessageTypes type,
    Duration duration,
  }) {
    Flushbar(
      margin: EdgeInsets.all(10),
      borderRadius: new BorderRadius.circular(10),
      icon: Icon(
          iconData ?? type == MessageTypes.error
              ? Icons.warning
              : Icons.info_outline,
          color: Colors.white),
      message: message ??
          (type == MessageTypes.error ? 'An Error occurred.' : 'Loading...'),
      duration: duration ?? Duration(seconds: 2),
    )..show(context);
  }

  static OverlayEntry showOverlay(BuildContext context, Widget child) {
    OverlayEntry entry = OverlayEntry(builder: (BuildContext context) => child);
    Overlay.of(context).insert(entry);
    return entry;
  }

  // RegExp Patterns
  static const PhoneRegExp = r'^(?:[+0][1-9])?[0-9]{10,12}$';
}

GetIt getIt = GetIt.instance;

Future setupLocator() async {
  getIt.registerLazySingleton(() => FlutterSecureStorage());
}
