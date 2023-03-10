import 'dart:core';
import 'dart:io';
import 'dart:async';
import 'package:sem4/Database.dart';
import 'package:flutter/material.dart';
import 'package:sem4/ClientModel.dart';
import 'package:sem4/Questions/Question1.dart';


class Tasks extends StatefulWidget{
  Tasks(this.id);
final int id;
@override
TasksState createState()=> TasksState(id);
}
Client client;

class TasksState extends State<Tasks>{
  TasksState(this.id);
  final int id;
  bool timeUp=false;

  void getClient()async{
    client= await DBProvider.db.getClient(id);
    setState(() { 
    });
  }

@override 
void initState(){
  getClient();
  super.initState();
  updateTime();
}

  bool isDepressed(){
    if(client.q1==null) return false;
    if(client.q1<4)
    return true;
    return false;
  }
  bool isDepressed2(){
    if(client.q2==null) return false;
    if(client.q2<4)
    return true;
    return false;
  }
  bool isDepressed3(){
    if(client.q3==null) return false;
    if(client.q3<6)
    return true;
    return false;
  }
  bool isDepressed4(){
    if(client.q4==null) return false;
    if(client.q4>=6)
    return true;
    return false;
  }
  bool isDepressed5(){
    if(client.q5==null) return false;
    if(client.q5<5)
    return true;
    return false;
  }

  void updateTime()async{
    if(client==null) return;
    var now =DateTime.now().day;
    if( now- client.hour >=1){
      setState(() {
        timeUp=true;
      });
      
    }
        
  }

  void update(Client newClient) async{
    await DBProvider.db.updateClient(newClient);
    getClient();
    // setState(() { 
    // });
  }
  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || 
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      final snackBar = SnackBar(content: Text('Press it twice to exit'));
      Scaffold.of(context).showSnackBar(snackBar);
      return Future.value(false);
    }
    exit(0);
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context){
    return WillPopScope(
    onWillPop: onWillPop,  
    child:
    Material(
    
      
    child:(client==null)?Container(child: Text("Loading...",textAlign: TextAlign.center,),):
    Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        (!client.answered && !timeUp) ? askQuestion() : Container(),
        Flexible(child:ListView(
          children: <Widget>[
            (!isDepressed() && !isDepressed2() && !isDepressed3() && !isDepressed4()
            && !isDepressed5() && client.answered)?
            ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Image.asset("assets/celebrate.png", fit: BoxFit.cover) ,
                subtitle: Text.rich(TextSpan(text:"You're doing great!"),
                        style: TextStyle(fontWeight:FontWeight.bold ),
                        textAlign: TextAlign.center,),
              ): Container(),

            (isDepressed() && client.notDone1)? 
            GestureDetector(
              onDoubleTap: () {
                client.notDone1=false;
                update(client);
              },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Image.asset("assets/outdoors2.jpg",fit: BoxFit.cover) ,
                subtitle: Text.rich(TextSpan(text:"Go out! Meet a few people today"),
                        style: TextStyle(fontWeight:FontWeight.bold ),),
              )
            )

            :Container(),
            (isDepressed2() && client.notDone2)? 
            GestureDetector(
              onDoubleTap: (){
              client.notDone2=false;
                update(client);
                },
              child:ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal:10.0),
              title: Image.asset("assets/music2.jpg",fit: BoxFit.cover) ,
              subtitle: Text.rich(TextSpan(text:"Listen to your favourite tracks"),
                        style: TextStyle(fontWeight:FontWeight.bold ),),
              )
              )

              :Container(),
              (isDepressed3() && client.notDone3)?
              GestureDetector(
              onDoubleTap: (){
              client.notDone3=false;
                update(client);
                },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Image.asset("assets/work2.jpg",fit: BoxFit.cover) ,
                subtitle: Text.rich(TextSpan(text:"Take up some job!"),
                        style: TextStyle(fontWeight:FontWeight.bold ),),
                )
            )

            :Container(),
            (isDepressed4() && client.notDone4)?
              GestureDetector(
              onDoubleTap: (){
              client.notDone4=false;
                update(client);
                },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Image.asset("assets/stress.png",fit: BoxFit.cover) ,
                subtitle: Text.rich(TextSpan(text:"Make time to unwind. Take breaks from work"),
                        style: TextStyle(fontWeight:FontWeight.bold ),),
                ),
            )

            :Container(),
            (isDepressed5() && client.notDone5)?
              GestureDetector(
              onDoubleTap: (){
              client.notDone5=false;
                update(client);
                },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: Image.asset("assets/meditate.png",fit: BoxFit.cover) ,
                subtitle: Padding(child:Text.rich(TextSpan(text:"Try meditating few times a day"),
                
                        style: TextStyle(fontWeight:FontWeight.bold ),),
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                ),
              )
            )
            
            :Container(),
            ((isDepressed() && !client.notDone1) || (isDepressed2() && !client.notDone2)
             || (isDepressed3() && !client.notDone3) || (isDepressed4() && !client.notDone4) 
             || (isDepressed5() && !client.notDone5))?
              ListTile(
                  title: Image.asset("assets/keepgoing.png",fit: BoxFit.cover),
                  subtitle: Padding(child:Text.rich(TextSpan(text:"Yay! You did good today"),
                
                        style: TextStyle(fontWeight:FontWeight.bold ),),
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                ), ) 
              
              :Container()
          ],
        ),
        
      )
      ],
      )
      )
    );
      
  }

  Widget askQuestion(){
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Ready to answer a few questions?'),
            subtitle: Text('It will only take a minute'),
          ),
          ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Yes!'),
                  onPressed: () { 
                    // Client newClient = Client.fromMap(client.toMap());
                    // newClient.answered = true;
                    // update(newClient);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>Question1(id:id))
                    );
                   },
                ),
                FlatButton(
                  child: const Text('Not now'),
                  onPressed: () { 
                    client.answered=true;
                update(client);
                   },
                ),
              ],
            ),
          ),
        ],
      ),
      elevation: 2.0,
      margin: EdgeInsets.all(12.0),
    );
  }
  
}