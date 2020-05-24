import 'package:flood_alert_app/pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flood_alert_app/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Result extends StatefulWidget {
  final double longitude;
  final double latitude;

  const Result({@required this.longitude, @required this.latitude});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String height = "Height";
  String warningMessage = "Custom Warning Message";

  @override
  Widget build(BuildContext context) {
    this.fetchPrediction();
    return Scaffold(
      appBar: AppBar(
        title: Text("Prediction"),
        backgroundColor: Colors.indigo,
      ),
      drawer: DrawerUI(),
      body: Center(
        child: Container(
          color: Colors.blue[50],
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Expected flood height ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "within the next 24 hours is",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  this.height,
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
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.home,
          ),
          backgroundColor: Colors.indigo,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }),
    );
  }

  void fetchPrediction() async {
    debugPrint("hello");
    String url =
        'http://ec2-100-25-180-74.compute-1.amazonaws.com:3000/api/prediction/' +
            widget.latitude.toString() +
            '&' +
            widget.longitude.toString();
    final response = await http.get(url);
    Map<String, dynamic> prediction = json.decode(response.body);

    debugPrint(prediction.toString());
  }
}
