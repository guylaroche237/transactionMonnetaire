
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:moneytrans/domain/helpers/theme_helper.dart';
import 'package:moneytrans/domain/helpers/validator.dart';
import 'package:moneytrans/domain/model/latest.dart';
import 'package:moneytrans/domain/model/latest_item.dart';
import 'package:moneytrans/domain/widget/button/primary_button.dart';
import 'package:moneytrans/domain/widget/form/dropdown_buttons/black_outline_dropdown_button.dart';
import 'package:moneytrans/domain/widget/form/text_fields/black_outline_text_field.dart';
import 'package:moneytrans/infrastructure/api/api_client.dart';
import 'package:moneytrans/infrastructure/api/request/convert_amount_request.dart';
import 'package:moneytrans/infrastructure/api/request/find_all_latest_request.dart';

class ConvertScreen extends StatefulWidget{

  ConvertScreen({Key key}):super(key:key);
  static const ROUTE = "convet";

  @override
  _HomeDetailScreenState createState() => _HomeDetailScreenState();

}

class _HomeDetailScreenState extends State<ConvertScreen>{
  LatestItem symbolFrom;
  LatestItem symbolTo;
  double amount = 1;
  List<String> listCurrent = [];
  List<LatestItem> list = [];
  bool inAsyncoll = false;
  double calcul = 0;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findAllSymbol();

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context);
    return ModalProgressHUD(
      inAsyncCall: inAsyncoll,
      child: Container(
          height: MediaQuery.of(context).size.height - 100,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Convertir",
                            style: ThemeHelper.heading1(color: Colors.black),
                          ),

                          Container(
                            padding: EdgeInsets.all(5),
                            child: BlackOutlineDropdownButton(
                              onChanged: (value) {
                                setState(() {
                                  symbolFrom = value;
                                });
                              },
                              items: List<DropdownMenuItem>.from(
                                  list.map((v) => DropdownMenuItem(
                                      child: Text(
                                        v.symbol,
                                        style: ThemeHelper.paragraph(
                                            color: Colors.black),
                                      ),
                                      value: v))),
                              hint: symbolFrom == null ? "From" : symbolFrom.symbol,
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(5),
                            child: BlackOutlineDropdownButton(
                              onChanged: (value) {
                                setState(() {
                                  symbolTo = value;
                                });
                              },
                              items: List<DropdownMenuItem>.from(
                                  list.map((v) => DropdownMenuItem(
                                      child: Text(
                                        v.symbol,
                                        style: ThemeHelper.paragraph(
                                            color: Colors.black),
                                      ),
                                      value: v))),
                              hint: symbolTo == null ? "To" : symbolTo.symbol,
                            ),
                          ),

                        /*  Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width*0.40,
                                  child: BlackOutlineDropdownButton(
                                    onChanged: (value) {
                                      setState(() {
                                        symbolFrom = value;
                                      });
                                    },
                                    items: List<DropdownMenuItem>.from(
                                        listCurrent.map((v) => DropdownMenuItem(
                                            child: Text(
                                              v,
                                              style: ThemeHelper.paragraph(
                                                  color: Colors.black),
                                            ),
                                            value: v))),
                                    hint: symbolFrom == null ? "From" : symbolFrom,
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width*0.40,
                                  child: BlackOutlineDropdownButton(
                                    onChanged: (value) {
                                      setState(() {
                                        symbolTo = value;
                                      });
                                    },
                                    items: List<DropdownMenuItem>.from(
                                        listCurrent.map((v) => DropdownMenuItem(
                                            child: Text(
                                              v,
                                              style: ThemeHelper.paragraph(
                                                  color: Colors.black),
                                            ),
                                            value: v))),
                                    hint: symbolTo == null ? "To" : symbolTo,
                                  ),
                                ),

                              ],
                            ),
                          ),*/

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: BlackOutlineTextField(
                                onChanged: (v) {
                                  setState(() {
                                    amount = double.parse(v.toString());
                                  });
                                },
                                hintText:"Amount",
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (!Validator.isNotEmpty(value)) {
                                    return "Please enter a valid amount";
                                  }
                                  return null;
                                }),
                          ),
                          SizedBox(height: 3),

                          (symbolTo != null && symbolFrom != null)? Container(
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Formule Calcul',style: TextStyle(fontWeight: FontWeight.bold),)),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text("1 "+symbolFrom.symbol +"= (TauxSymbolFrom/TauxSymbolTo) "+symbolTo.symbol,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),),
                                Divider(height: 4,color: Colors.black,),
                                SizedBox(height: 4,),

                                Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(amount.toString()+" "+symbolFrom.symbol +"= "+calcul.toString() +"  "+symbolTo.symbol,style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          ):SizedBox(height: 2,),






                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: PrimaryButton(
                                  text: "Convertir",
                                  onPressed: () {
                                    convertAmount();

                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

// Laroche : Affiche les boutons Edit et Delete sauf si ce job n a pas encore ete bider

            ],
          )
      ),
    );
  }

  Future<void> findAllSymbol() async {

    setState(() {
      inAsyncoll = true;
    });
    FindAllLatestRequest findAllLatestRequest = FindAllLatestRequest();
    Latest resp  = await findAllLatestRequest.parseResult(await ApiClient.execOrFail(findAllLatestRequest));
    LatestItem latestItem;
    setState(() {
      inAsyncoll = false;

      if(resp != null){
        resp.rates.forEach((key, value) {
          double taux = double.parse(value.toString());
          latestItem = LatestItem(symbol: key,taux:taux,date: resp.date);
          list.add(latestItem);
        //  listCurrent.add(key);
        });
      }
    });
  }

  bool _validate() {
    if (!_formKey.currentState.validate()) {
      return false;
    }
    return true;
  }

  Future<void> convertAmount() async {
     if(!_validate()){
       return;
     }
     setState(() {
       inAsyncoll = true;
     });


    /*
    Api de convertion ne fonctionne pas sur le serveur
    if(Validator.isNotEmpty(symbolFrom)&&Validator.isNotEmpty(symbolTo)){
       ConvertAmountRequest convertAmountRequest = ConvertAmountRequest(symbolFrom,symbolTo,amount);
       dynamic resultat = await convertAmountRequest.parseResult(await ApiClient.execOrFail(convertAmountRequest));
       print(resultat);
     }*/

     setState(() {
       inAsyncoll = false;
       calcul = amount*(symbolFrom.taux/symbolTo.taux);
     });
  }





}
