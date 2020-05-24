import 'package:flood_alert_app/pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flood_alert_app/widgets/drawer.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Prediction"),
        backgroundColor: Colors.indigo,
      ),
      drawer: DrawerUI(),
      body: Center(
        ListView(
        children: <Widget>[
          ListTile(
            title: Text('Sun'),
          ),
          ListTile(
            title: Text('Moon'),
          ),
          ListTile(
            title: Text('Star'),
          ),
        ],
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
}
