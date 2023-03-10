import 'package:sem4/ClientModel.dart';
import 'package:sem4/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:flutter_villains/villain.dart';
import 'package:sem4/main.dart';


class Question5 extends StatefulWidget{
Question5({this.values,this.id});
final Map<String,double> values;
final int id;
@override
Question5State createState()=> Question5State(values,id);
}

class Question5State extends State<Question5>{
  Client client;
  String question="How do you describe your energy levels?";
  double valueSlider=1,oldValue=0;
  Question5State(this.values,this.id);
  final Map<String,double> values;
  final int id;
  void getClient()async{
    client= await DBProvider.db.getClient(id);
    setState(() { 
    });
  }

  @override 
  void initState(){
  getClient();
  super.initState();
  
  }

  void update(Client newClient) async{
    await DBProvider.db.updateClient(newClient);
    setState(() { 
    });
  }

  @override
  Widget build(BuildContext context){
    return Material(
      type: MaterialType.transparency,
      child: Villain(
      villainAnimation: VillainAnimation.fromBottom(
        curve: Curves.easeInCubic,
        relativeOffset:0.4,
        from:Duration(milliseconds:500),
        to:Duration(seconds:1),
      ),
      //animateExit:false
      secondaryVillainAnimation:VillainAnimation.fade(),
      child:Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo.shade200,
            Colors.green.shade200
          ],
        )
      ),
      child: Stack(
        children: <Widget>[
          Padding(
           padding: EdgeInsets.symmetric(vertical: 100.0,horizontal: 20.0),
           child:Align(child: Text.rich(TextSpan(text: question),
           style:TextStyle(fontStyle: FontStyle.normal,fontSize: 30.0,fontWeight: FontWeight.bold)
           
           ),
           alignment: Alignment.topCenter,
          )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child:Align(child:FluidSlider(
            value:valueSlider,
            onChanged: (newValue){
                setState(() {
                  oldValue=valueSlider;
                 valueSlider=newValue; 
                });
                Client newClient = Client.fromMap(client.toMap());
                newClient.q5old = oldValue;
                newClient.q5 = valueSlider;
                newClient.notDone5 = true;
                newClient.notDone4 = true;
                newClient.notDone3 = true;
                newClient.notDone2 = true;
                newClient.notDone1 = true;
                newClient.answered = true;
                update(newClient);
              }
            ,
            // start: Image.asset("less people"),
            //end: Image.asset("more people"),
            min: 1, max: 10,
          ),
          alignment: Alignment.center,
         )
         ),
        Padding(
          padding: EdgeInsets.all(50.0),
          child:Align(child:FlatButton(
              child: Text("N E X T",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              onPressed:(){ 
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context)=>MyHomePage(title:"Mental Health Tracker",id:id) ));},
            ),
            alignment: Alignment.bottomCenter,
         )
         )
        ],
      )  ,
      )
    )
    );
}}