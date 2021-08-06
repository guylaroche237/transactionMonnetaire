
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/model/latest_item.dart';

class LatestItemCard extends StatelessWidget{
  final LatestItem latestItem;
  final Function onPressed;

  const LatestItemCard({Key key, this.latestItem, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      shadowColor: Colors.indigo,
      child: InkWell(
        onTap: () {
          this.onPressed();

        },
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  contentPadding: EdgeInsets.all(4),
                  title: Text(latestItem.date,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 15),),
                  subtitle: Container(
                      child: Text(latestItem.symbol,style: TextStyle(fontWeight: FontWeight.bold,),)),
                  trailing: Icon(Icons.monetization_on)
                  // leading: Icon(Icons.local_bar),
                ),
              ),
              Divider(height: 6,color: Colors.black,),
              Container(
                padding: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Taux:"),
                    Text(latestItem.taux.toString(),style: TextStyle(color: Colors.indigo),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}