import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/patron_dashboad_screen.dart';
import 'package:moneytrans/domain/screen/splash_screen.dart';

import 'domain/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        navigatorObservers: [
          BotToastNavigatorObserver()
        ], //2.registered route observer
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white
        ),
        navigatorKey: MainNavigatorKey.key,
        initialRoute: SplashScreen.ROUTE,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

