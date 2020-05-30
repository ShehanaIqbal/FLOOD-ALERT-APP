import 'package:flood_alert_app/pages/main_menu.dart';
import 'package:flutter/material.dart';

class DrawerUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
    child: ListView(
      children: <Widget>[
        SizedBox(
          height: 155.0,
          child: Image.asset(
            'assets/images/irrigation.png',
            fit: BoxFit.contain,
          ),
        ),
      Padding(padding:EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0) ,),
      ListTile(
        title: Text("Main Menu"),
        trailing: Icon(Icons.arrow_forward),
        onTap:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainMenu()),
          );
        },
      ),
      ListTile(
        title: Text("Instructions"),
        trailing: Icon(Icons.info),
      ),
      ListTile(
        title: Text("My Location"),
        trailing: Icon(Icons.location_on),
      ),
      Padding(padding:EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0) ,),
      Divider(),
      Padding(padding:EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0) ,),
      ListTile(
        title: Text("Settings"),
        trailing: Icon(Icons.settings),
      ),
      ListTile(
        title: Text("Share"),
        trailing: Icon(Icons.share),
      ),
    ],
  ),
);
  }
}