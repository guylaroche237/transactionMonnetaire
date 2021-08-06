import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/dashboard_screen/home/home_screen.dart';

import '../patron_dashboad_screen.dart';
import '../router.dart';

class SplashScreen extends StatefulWidget {
  static const ROUTE = "/";
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _loadWidget();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.only(top: 1),
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Container(
                padding: EdgeInsets.all(40),
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height*0.20,
                      left: 50,
                      right: 50,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text("Transaction Monetaire",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child:  Container(
                        width: 75,
                        height: 75,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue
                        ),
                        child: ClipOval(child: Image.asset("assets/images/transcap.png",width: 65,height: 65,fit: BoxFit.cover,)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height*0.70,
                      left: 50,
                      right: 50,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2,
                        ),
                      ),
                    )
                  ],
                )
            ),
          ),
        ),
      ),
    );

  }

  _loadWidget() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
   Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => PatronDashboardScreen()));
    //MainNavigatorKey.key.currentState.pushReplacementNamed(PatronDashboardScreen.ROUTE);
   // return null;
  }


  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/transcap.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text("Mashop Application",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}