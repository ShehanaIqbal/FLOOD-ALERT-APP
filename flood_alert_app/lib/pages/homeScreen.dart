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
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Flood Alert Warning Application"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: DrawerUI(),
        body: SafeArea(
          child: Center(
              child:SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5.0),
              ),
              SizedBox(
                height: 155.0,
                child: Image.asset(
                  'assets/images/irrigation.png',
                  fit: BoxFit.contain,
                ),
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
                  backgroundColor: Colors.blueGrey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu()),
                    );
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 5.0),
              ),
              Text("Copyright : This application"),
              Text(
                "should not be used for any commercial purpose",
              ),
              Text("")
            ],
          ))),
        ));
  }
}
