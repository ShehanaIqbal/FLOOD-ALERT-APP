import 'package:flood_alert_app/pages/main_menu.dart';
import 'package:flood_alert_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flood Alert Warning Application"),
          backgroundColor: Colors.indigo,
        ),
        drawer: DrawerUI(),
        body: SafeArea(
          child: Center(
              child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/logo.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5.0),
              ),
              Text(
                "Welcome to the",
                style: TextStyle(fontSize: 23.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              ),
              Text(
                "flood alert mobile application",
                style: TextStyle(fontSize: 23.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5.0),
              ),
              FloatingActionButton(
                  child: Icon(Icons.navigate_next),
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu()),
                    );
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 5.0),
              ),
              Text("Copyright : This application"),
              Text(
                "should not be used for any commercial purpose",
              ),
              Text("")
            ],
          )),
        ));
  }
}
