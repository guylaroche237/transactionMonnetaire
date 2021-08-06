
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/dashboard_screen/home/home_screen.dart';

import '../../bottom_navigation.dart';

class HomeRouter extends StatelessWidget{

  HomeRouter({Key key, this.navigatorKey, this.selectTab, @required this.role}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;
  final int role;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: HomeAcceuiScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name){
          case HomeAcceuiScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> HomeAcceuiScreen(),
                settings: settings
            );
            break;
          default:
            throw Exception("Invalid route");
        }
      },
    );
  }



}