import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;
  // Go back
  void popBack() => _navigationKey.currentState.pop();

  // Push Route 
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  // Navigate and Replace 
  Future<dynamic> navigateToReplacing(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState.pushReplacementNamed(routeName, arguments: arguments);
  }

    ///Exits application
  popOut() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  
}