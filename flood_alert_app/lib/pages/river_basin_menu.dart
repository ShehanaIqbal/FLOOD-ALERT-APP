import 'package:flood_alert_app/pages/homeScreen.dart';
import 'package:flood_alert_app/pages/guaging_station_menu.dart';
import 'package:flutter/material.dart';
import 'package:flood_alert_app/widgets/drawer.dart';

class BasinMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a basin"),
      ),
      drawer: DrawerUI(),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.indigoAccent,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StationMenu()),
                    );
                  },
                  child: Text("Kelani River Basin",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 18.0,
                      )
                ),
                ),
              ),
              Padding(padding:EdgeInsets.symmetric(vertical: 50.0,horizontal: 5.0) ,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.indigoAccent,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {},
                  child: Text("Kalu River Basin",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 18.0,
                      )
                ),
                ),
              ),
              Padding(padding:EdgeInsets.symmetric(vertical: 50.0,horizontal: 5.0) ,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.indigoAccent,
                child: MaterialButton(
                  onPressed: null,
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Text("Mahaweli River Basin",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 18.0,
                      )
                ),
                ),
              ),
              Padding(padding:EdgeInsets.symmetric(vertical: 50.0,horizontal: 5.0) ,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.indigoAccent,
                child: MaterialButton(
                  onPressed: null,
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  child: Text("Nilwala River Basin",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 18.0,
                      )
                ),
                ),
              ),
            ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }),
      );
  }
}