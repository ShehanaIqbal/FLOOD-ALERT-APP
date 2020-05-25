import 'package:flood_alert_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'homeScreen.dart';

class Result extends StatefulWidget {
  final double longitude;
  final double latitude;
  const Result({@required this.longitude, @required this.latitude});


  @override
  _ResultState createState() => _ResultState(this.latitude,this.longitude);
}

class _ResultState extends State<Result> {
  final double longitude;
  final double latitude;
  _ResultState(this.latitude,this.longitude);

  String getLongitude(){
    return (longitude.toString());
  }

  String getLatitude(){
    return (latitude.toString());
  }
  Future <List<String>> getList(Map<String, dynamic> prediction) async{

  }

  Future <List<String>> fetchPrediction() async {
    print("hello");
    List<String> pred_list=[];
    String url =
        'http://ec2-100-25-180-74.compute-1.amazonaws.com:3000/api/prediction/' +
            this.getLatitude()+
            '&' +
            this.getLongitude();
    final response = await http.get(url);
    if (response.statusCode==200) {
      Map<String, dynamic> prediction = json.decode(response.body);
      pred_list.add(prediction['result'][0]['1'].toString());
      pred_list.add(prediction['result'][0]['2'].toString());
      pred_list.add(prediction['result'][0]['3'].toString());
      pred_list.add(prediction['result'][0]['4'].toString());
      pred_list.add(prediction['result'][0]['5'].toString());
      pred_list.add(prediction['result'][0]['6'].toString());
      pred_list.add(prediction['result'][0]['7'].toString());
      pred_list.add(prediction['result'][0]['8'].toString());
      pred_list.add(prediction['result'][0]['9'].toString());
      pred_list.add(prediction['result'][0]['10'].toString());
      pred_list.add(prediction['result'][0]['11'].toString());
      pred_list.add(prediction['result'][0]['12'].toString());
      pred_list.add(prediction['result'][0]['13'].toString());
      pred_list.add(prediction['result'][0]['14'].toString());
      pred_list.add(prediction['result'][0]['15'].toString());
      pred_list.add(prediction['result'][0]['16'].toString());
      pred_list.add(prediction['result'][0]['17'].toString());
      pred_list.add(prediction['result'][0]['18'].toString());
      pred_list.add(prediction['result'][0]['19'].toString());
      pred_list.add(prediction['result'][0]['20'].toString());
      pred_list.add(prediction['result'][0]['21'].toString());
      pred_list.add(prediction['result'][0]['22'].toString());
      pred_list.add(prediction['result'][0]['23'].toString());
      pred_list.add(prediction['result'][0]['24'].toString());
      return pred_list;
    }else if(response.statusCode==201){
        print ("different");
      return(null);
    }
  }


  
  String warningMessage = "Custom Warning Message";
  @override
  Widget build(context) {
    return FutureBuilder(
      future: fetchPrediction(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var height=snapshot.data;
          return Scaffold(
        appBar: AppBar(
          title: Text("Flood Alert Warning Application"),
          backgroundColor: Colors.indigo,
        ),
        drawer: DrawerUI(),
        body:ListView(
        children: <Widget>[
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "12:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[0],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "01:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                 height[1],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "02:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[2],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "03:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[3],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "04:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[4],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "05:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[5],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "06:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[6],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
          new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "07:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[7],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "08:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[8],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "09:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[9],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "10:00 a.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[10],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "12:00 noon",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[11],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "01:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[12],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "02:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[13],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "03:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[14],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "04:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[15],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "05:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[16],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "06:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[17],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "07:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[18],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "08:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[19],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "09:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[20],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "10:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[21],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "11:00 p.m",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  height[22],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
              new Card(
                child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                    children: <Widget>[
                      Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "12:00 midnight",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                 height[23],
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.warningMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                )
                    ],
                  ),
                ),
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.indigo,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }),
    );
        } else {
          print (snapshot.data);
          print ("failed");
          return Scaffold(
      body: Center(
        child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /// Loader Animation Widget
        CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
              Colors.indigoAccent),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
        ),
      ]
  ) ,
        )
    );
        }
      }
    );
  }
}

      
