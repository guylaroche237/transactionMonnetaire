class Latest{
  bool success;
  int timestamp;
  String base;
  String date;
  Map<String,dynamic> rates;

  Latest({this.success,this.timestamp,this.date,this.base,this.rates});

  Latest.fromJson(Map<String, dynamic> json){
    success = json["success"];
    timestamp = json["timestamp"];
    base = json["base"];
    date = json["date"];
    rates = json["rates"];
  }

  @override
  toJson() {
    // TODO: implement toJson
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    data["timestamp"] = this.timestamp;
    data["base"] = this.base;
    data["rates"] = this.rates;
    return data;
  }
}