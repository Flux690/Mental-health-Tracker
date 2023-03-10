import 'package:flutter/material.dart';
import 'package:sem4/main.dart';
import 'package:sem4/ClientModel.dart';
import 'package:sem4/Database.dart';
import 'dart:io';
class Login extends StatefulWidget{
  
  
@override 
LoginState createState()=>LoginState();
}
class LoginState extends State<Login>{
  static Client pehla=Client(firstName: "CHOOSE AN EXISTING USER");
  List<Client> clients=[pehla]; String name;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState(){
    getClients();
    super.initState();
  }
  void getClients() async{
    clients=await DBProvider.db.getAllClients();
    setState(() { 
    });
  }
  final controller=TextEditingController();


  @override
  Widget build(BuildContext context){
    
    return Material(
      color: Colors.white,
      child: Form (
         key: _formkey,
      child:Column(
      children:<Widget>[ 
        Image.asset("assets/login.png", fit: BoxFit.cover),
        SizedBox(height: 20),
        Text("Welcome", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold
        )
        ),

        SizedBox(height: 3.0),

        Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
        child:TextFormField(
          
          onEditingComplete: (){name=controller.text;},
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter User Name",
            hintStyle: TextStyle(fontSize: 13),
            labelText: "User Name",
            labelStyle: TextStyle()
            ),


            validator: (value) {
              if (value==null || value.isEmpty) {
                return "Enter a valid User Name";
              }
            },
        ),
        ),


        RaisedButton(
          padding: EdgeInsets.all(4.0),
          color: Colors.deepPurple,
          
          child: Text("Login", style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold, fontSize: 14
            )
            ),
          onPressed:() 
          async{ 
            if(_formkey.currentState.validate()) {
          Client newClient=Client(firstName: controller.text);
          int id=await DBProvider.db.newClient(newClient);
          while(newClient.id!=null) sleep(const Duration(seconds: 2));
          
          Navigator.of(context).push(
            MaterialPageRoute(builder:(context)=>MyHomePage(title:"Mental Health Tracker",id:id)));}}
        ),

        SizedBox(
          height: 20.0,
        ),

        Flexible(child:ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context,index)=> GestureDetector(child:Padding(
                child:Text(clients[index].firstName) ,
                padding: EdgeInsets.all(10.0),),
                onTap:(){ 
                Navigator.of(context).push(
                MaterialPageRoute(builder:(context)=>MyHomePage(title:"Mental Health Tracker",id:clients[index].id)));},
              ),
         itemCount: clients.length,)
        ),
      ]
    )
    )
    );
  }
}