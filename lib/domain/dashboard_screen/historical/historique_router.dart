
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/dashboard_screen/historical/historical_screen.dart';
import 'package:moneytrans/domain/dashboard_screen/home/home_screen.dart';

import '../../bottom_navigation.dart';

class HistoricalRouterScreen extends StatelessWidget{

  HistoricalRouterScreen({Key key, this.navigatorKey, this.selectTab}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: HistoricalScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name){
          case HistoricalScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> HistoricalScreen(),
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