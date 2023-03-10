import 'dart:convert';

Client clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Client.fromMap(jsonData);
}

String clientToJson(Client data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Client {
  int id,hour=0;
  String firstName;
  
  bool show1 = true,show2 = true,notDone1 = true,notDone2 = true,notDone3 = true,notDone4 = true,
  notDone5 = true,value,answered;
  double q1=0.0,q2=0.0,q3=0.0,q4=0.0,q5=0.0,q1old=0.0,q2old=0.0,q3old=0.0,q4old=0.0,q5old=0.0,
  progress1=0.0,progress2=0.0;
  

  Client({
    this.id,
    this.firstName,
    this.answered:false,
    this.notDone1:true,
    this.notDone2:true,
    this.notDone3:true,
    this.notDone4:true,
    this.notDone5:true,
    this.hour:-1,
    this.progress1:0.0,
    this.progress2:0.0,
    this.q1:0.0,this.q1old:0.0,this.q2:0.0,this.q2old:0.0,this.q3:0.0,this.q3old:0.0,this.q4:0.0,
    this.q4old:0.0,this.q5:0.0,this.q5old:0.0,this.show1:true,this.show2:true,this.value:true
  });

  factory Client.fromMap(Map<String, dynamic> json) => new Client(
        id: json["id"],
        firstName: json["first_name"],
        answered: json["answered"] == 1,
        notDone1: json["notDone1"] == 1,
        notDone2: json["notDone2"] == 1,
        notDone3: json["notDone3"] == 1,
        notDone4: json["notDone4"] == 1,
        notDone5: json["notDone5"] == 1,
        hour: json["hour"],
        progress1: json["progress1"],
        progress2: json["progress2"],
        q1: json["q1"],
        q1old: json["q1old"],
        q2: json["q2"],
        q2old: json["q2old"],
        q3: json["q3"],
        q3old: json["q3old"],
        q4: json["q4"],
        q4old: json["q4old"],
        q5: json["q5"],
        q5old: json["q5old"],
        show1:json["show1"] == 1,
        show2: json["show2"] == 1,
        value: json["value"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "answered":answered,
        "notDone1":notDone1,
        "notDone2":notDone2,
        "notDone3":notDone3,
        "notDone4":notDone4,
        "notDone5":notDone5,
        "hour":hour,
        "progress1":progress1,
        "progress2":progress2,
        "q1":q1,
        "q1old":q1old,
        "q2":q2,
        "q2old":q2old,
        "q3":q3,
        "q3old":q3old,
        "q4":q4,
        "q4old":q4old,
        "q5":q5,
        "q5old":q5old,
        "show1":show1,
        "show2":show2,
        "value":value
      };
}