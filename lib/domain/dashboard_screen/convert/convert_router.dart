import 'package:flutter/material.dart';
import 'package:moneytrans/domain/dashboard_screen/convert/convert_screen.dart';
import 'package:moneytrans/domain/dashboard_screen/home/home_screen.dart';

import '../../bottom_navigation.dart';

class ConvertRouterScreen extends StatelessWidget{

  ConvertRouterScreen({Key key, this.navigatorKey, this.selectTab}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final Function(TabItem tabItem) selectTab;


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: ConvertScreen.ROUTE,
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name){
          case ConvertScreen.ROUTE:
            return MaterialPageRoute(
                builder: (context)=> ConvertScreen(),
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