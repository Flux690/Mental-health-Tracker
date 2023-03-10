import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DoctorPage extends StatelessWidget{

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.white,
      child:ListView( 
      
      children: <Widget>[

        Image.asset("assets/doctor.png",fit: BoxFit.cover),

        Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(5.0),
            leading: Image.asset("assets/guptaji.jpg",fit: BoxFit.cover),
            title: Text("Dr. Gorav Gupta"),
            subtitle:
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                  child: const Text('Contact', style: TextStyle(fontFamily: 'Laila-Bold',
                    fontSize: 15, color: Colors.deepPurple)
                    ),
                  onPressed: () { 
                    const url = "https://www.goravgupta.com/contactus.php";
                    launchURL(url);
                   },
                ),
                ],
              ),
            ) 
          ),
          elevation: 0.0,
        ),
        Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(5.0),
            leading: Image.asset("assets/jayaramanji.jpg",fit:BoxFit.cover),
            title: Text("Dr. Vasantha Jayaraman"),
            subtitle: ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Contact', style: TextStyle(fontFamily: 'Laila-Bold',
                    fontSize: 15, color: Colors.deepPurple)),
                  onPressed: () { 
                    const url = "https://www.practo.com/chennai/doctor/dr-vasantha-jayaram-1";
                    launchURL(url);
                   },
                ),
              ],
            ),
          ),
          ),
          elevation: 0.0,
        ),
        Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(5.0),
            leading: Image.asset("assets/samirji.jpg",fit:BoxFit.cover),
            title: Text("Dr. Samir Parikh"),
            subtitle: ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Contact', style: TextStyle(fontFamily: 'Laila-Bold',
                    fontSize: 15, color: Colors.deepPurple)),
                  onPressed: () { 
                    const url = "https://www.logintohealth.com/psychiatrist/samir-parikh";
                    launchURL(url);
                   },
                ),
              ],
            ),
          ),
          ),
          elevation: 0.0,
        ),
        Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(5.0),
            leading: Image.asset("assets/vishalji.jpg",fit:BoxFit.cover),
            title: Text("Dr. Vishal Chhabra"),
            subtitle: ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Contact', style: TextStyle(fontFamily: 'Laila-Bold',
                    fontSize: 15, color: Colors.deepPurple)),
                  onPressed: () { 
                    const url = "https://www.practo.com/delhi/doctor/dr-vishal-chhabra-psychiatrist";
                    launchURL(url);
                   },
                ),
              ],
            ),
          ),
          ),
          elevation: 0.0,
        ),
        Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(5.0),
            leading: Image.asset("assets/dasji.jpg",fit:BoxFit.cover),
            title: Text("Dr. Mrinmay Kumar Das"),
            subtitle: ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Contact', style: TextStyle(fontFamily: 'Laila-Bold',
                    fontSize: 15, color: Colors.deepPurple)),
                  onPressed: () { 
                    const url = "https://mymedtrip.com/listing/dr-mrinmay-kumar-das/";
                    launchURL(url);
                   },
                ),
              ],
            ),
          ),
          ),
          elevation: 0.0,
        ),
        Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(5.0),
            leading: Image.asset("assets/rastogiji.jpg",fit:BoxFit.cover),
            title: Text("Dr. Vipul Rastogi"),
            subtitle: ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Contact', style: TextStyle(fontFamily: 'Laila-Bold',
                    fontSize: 15, color: Colors.deepPurple)),
                  onPressed: () { 
                    const url = "https://www.logintohealth.com/neurologist/vipul-rastogi";
                    launchURL(url);
                   },
                ),
              ],
            ),
          ),
          ),
          elevation: 0.0,
        ),
      ],
    )
    );
  }
}