
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/patron_dashboad_screen.dart';
import 'package:moneytrans/domain/screen/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case PatronDashboardScreen.ROUTE:
        return MaterialPageRoute(builder: (_) => PatronDashboardScreen());


      default:
        throw 'Route not found';
    }
  }
}

class MainNavigatorKey {
  static GlobalKey<NavigatorState> _navigatorKey;
  static GlobalKey<NavigatorState> get key {
    if (_navigatorKey == null) {
      _navigatorKey = GlobalKey<NavigatorState>();
    }
    return _navigatorKey;
  }
}