import 'package:flood_alert_app/pages/river_basin_menu.dart';
import 'package:flood_alert_app/pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flood_alert_app/pages/map.dart';
import 'package:flood_alert_app/widgets/drawer.dart';
import 'package:toast/toast.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select an Option"),
        backgroundColor: Colors.blueGrey[600],
      ),
      drawer: DrawerUI(),
      body: Container(
    decoration: BoxDecoration(
    color: Colors.blueGrey[100],
    ),child:Center(
        child:SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
          ),
          margin: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    'assets/images/floodpng.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5.0),
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey[700],
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapClass()),
                      );
                    },
                    child: Text("Flood Prediction in my area",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        )),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey[600],
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Toast.show("This feature will be available soon", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    },
                    child: Text("Rainfall in past 24 hours",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        )),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Toast.show("This feature will be available soon", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    },
                    child: Text("Real time water level in guaging stations",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        )),
                  ),
                ),
              ]),
        ),
        ),),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.blueGrey[600],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }),
    );
  }
}
