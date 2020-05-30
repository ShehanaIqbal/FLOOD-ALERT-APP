import 'package:flood_alert_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import 'homeScreen.dart';

class Result extends StatefulWidget {
  final double longitude;
  final double latitude;
  const Result({@required this.longitude, @required this.latitude});

  @override
  _ResultState createState() => _ResultState(this.latitude, this.longitude);
}

class _ResultState extends State<Result> {
  bool _isUploading = false;
  double longitude;
  double latitude;
  List<String> height;
  String url;
  final warningMessage = "no content";

  _ResultState(this.latitude, this.longitude);

  String getLongitude() {
    return (longitude.toString());
  }

  String getLatitude() {
    return (latitude.toString());
  }

  String getURL() {
    String url = 'http://192.168.1.10:3000/api/prediction/' +
        getLatitude() +
        '&' +
        getLongitude();
    return url;
  }

  void _resetState() {
    setState(() {
      _isUploading = false;
      latitude = null;
      longitude = null;
    });
  }

  Future<Map<String, dynamic>> _uploadLocation() async {
    setState(() {
      _isUploading = true;
    });
    try {
      final response = await http.get(getURL());
      if (response.statusCode == 200) {
        final Map<String, dynamic> prediction = json.decode(response.body);
        _resetState();
        return prediction;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

    Future<List<String>> _startUploading() async{
      final Map<String, dynamic> prediction = await _uploadLocation();
      if (prediction==null){
        Toast.show("Location Upload Failed!!!", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }else if (prediction.containsKey('result')){
        List<String> height=[];
        height.add(prediction['result'][0]['1'].toString());
        height.add(prediction['result'][0]['2'].toString());
        height.add(prediction['result'][0]['3'].toString());
        height.add(prediction['result'][0]['4'].toString());
        height.add(prediction['result'][0]['5'].toString());
        height.add(prediction['result'][0]['6'].toString());
        height.add(prediction['result'][0]['7'].toString());
        height.add(prediction['result'][0]['8'].toString());
        height.add(prediction['result'][0]['9'].toString());
        height.add(prediction['result'][0]['10'].toString());
        height.add(prediction['result'][0]['11'].toString());
        height.add(prediction['result'][0]['12'].toString());
        height.add(prediction['result'][0]['13'].toString());
        height.add(prediction['result'][0]['14'].toString());
        height.add(prediction['result'][0]['15'].toString());
        height.add(prediction['result'][0]['16'].toString());
        height.add(prediction['result'][0]['17'].toString());
        height.add(prediction['result'][0]['18'].toString());
        height.add(prediction['result'][0]['19'].toString());
        height.add(prediction['result'][0]['20'].toString());
        height.add(prediction['result'][0]['21'].toString());
        height.add(prediction['result'][0]['22'].toString());
        height.add(prediction['result'][0]['23'].toString());
        height.add(prediction['result'][0]['24'].toString());
        return height;
      }else{
        Toast.show("Try again!!!", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        return null;
      }
    }
  }

  Future<Widget> _buildPage() async {
    Widget page = Container();
    List<String> height = await _startUploading();
    if (_isUploading) {
      page = Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
                Colors.grey),
          ),])
        );
      }else if (!_isUploading && height==null){
        page=Container(
            margin: EdgeInsets.only(top:10.0),
            child:Text("System is busy. Please wait...")
        );
      }else{
        page=Container(
            margin: EdgeInsets.only(top:10.0),
            child: ListView(
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
                          color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
                        color: Colors.grey,
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
      );
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Flood Alert Warning Application"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: DrawerUI(),
      body: FutureBuilder<Widget>(
          future: _buildPage(),
          builder: (context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data;
            } else {
              return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.grey),
                    )
                  ]));
            }
          }),
    ));
  }
}
