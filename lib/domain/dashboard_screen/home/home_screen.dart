
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:moneytrans/domain/model/latest.dart';
import 'package:moneytrans/domain/model/latest_item.dart';
import 'package:moneytrans/domain/widget/latest_item_card.dart';
import 'package:moneytrans/domain/widget/layout/head_box.dart';
import 'package:moneytrans/infrastructure/api/api_client.dart';
import 'package:moneytrans/infrastructure/api/request/find_all_latest_request.dart';

class HomeAcceuiScreen extends StatefulWidget{

  HomeAcceuiScreen({Key key}):super(key:key);
  static const ROUTE = "/";

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();

}

class _HomeDetailScreenState extends State<HomeAcceuiScreen>{
  Latest latest;
  bool inAsyncoll = false;
  List<LatestItem> list = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLatest();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ModalProgressHUD(
      inAsyncCall: inAsyncoll,
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
                  Text("Money Transaction",style: TextStyle(color: Colors.blue,fontSize: 27,fontWeight: FontWeight.w900,fontStyle: FontStyle.italic)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: HeadBox(
                label: (latest != null)?latest.base:"Recherche en Cour...",
                onTap: () {

                },
              ),
            ),
            (list.length != 0)?Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context,index){
                        LatestItem lastItem = list[index];
                        return LatestItemCard(latestItem: lastItem,);
                      }),
                )):Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notification_important,color: Colors.red,size: 25,),
                      Text("Pas de Money Trouver",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }


  Future<void> findLatest() async {
    LatestItem latestItem ;
    setState(() {
      inAsyncoll = true;
    });
    FindAllLatestRequest findAllLatestRequest = FindAllLatestRequest();
    Latest resp  = await findAllLatestRequest.parseResult(await ApiClient.execOrFail(findAllLatestRequest));
    print(resp.toJson());

    setState(() {
      inAsyncoll = false;
      latest = resp;
      if(resp != null){
        resp.rates.forEach((key, value) {
          double taux = double.parse(value.toString());
          latestItem = LatestItem(symbol: key,taux:taux,date: resp.date);
          list.add(latestItem);

        });
      }
    });
  }





}
