import 'package:flood_alert_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'homeScreen.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instructions"),
        backgroundColor: Colors.blueGrey[600],
      ),
      drawer: DrawerUI(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
        ),
        child: ListView(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(
                  top: 20.0,bottom: 30.0
                ),
              child:Center(
                child:Text("HOW TO USE THE APP",
                  style:TextStyle(
                      color: Colors.grey[800],
                    fontSize: 18.0,
                    fontWeight:FontWeight.bold
                  ),),
              ),),

        new Container(
          margin: EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
              color: Colors.grey[400],
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                bottomLeft: const Radius.circular(20.0),
                bottomRight: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0),
              )
          ),
        padding: new EdgeInsets.all(20.0),
        child: Center(
          child:Text(
              "Make sure you have given all the permissions to the app",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
            ),),
                new Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      )
                  ),
                  padding: new EdgeInsets.all(20.0),
                  child: Center(
                    child:Text(
                      "Turn on GPS service of your mobile before you use any service",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),),
              new Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      )
                  ),
                  margin: EdgeInsets.all(10.0),
                  padding: new EdgeInsets.all(20.0),
                  child: Center(
                    child:Text(
                      "Visit the main menu to select the service you want",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),),
                  new Container(
                    margin: EdgeInsets.all(10.0),

                    decoration: new BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0),
                        bottomLeft: const Radius.circular(20.0),
                        bottomRight: const Radius.circular(20.0),
                      )
                  ),
                  padding: new EdgeInsets.all(20.0),
                  child: Center(
                    child:Text(
                      "Take the pointer to the location you want if you use FLOOD PREDICTION OF MY AREA service and click on the arrow button at the bottom",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                  ),),

    ],
    ),
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
