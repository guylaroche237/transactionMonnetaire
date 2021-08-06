
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HistoricalScreen extends StatefulWidget{

  HistoricalScreen({Key key}):super(key:key);
  static const ROUTE = "historical";

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();

}

class _HomeDetailScreenState extends State<HistoricalScreen>{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            //  SizedBox(height: 8),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("MoneyTrans",style: TextStyle(color: Colors.blue,fontSize: 27,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic)),

                ],
              ),
            ),

            SingleChildScrollView(

              child: Column(
                children: [
                  Text("Historical")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }





}
