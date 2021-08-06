
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneytrans/domain/helpers/theme_helper.dart';

class HeadBox extends StatelessWidget {
  const HeadBox({Key key,@required this.label, this.onTap}) : super(key: key);
  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(8), border: Border.all()),
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(Icons.euro_symbol),
              SizedBox(width: 8),
              Text("BASE   =  "+
                this.label,
                style: ThemeHelper.paragraph(isBold: true, color: Colors.black),
              )
            ],
          )),
    );
  }
}