import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/i18n.dart'
    as location_picker;
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flood_alert_app/widgets/drawer.dart';
import 'package:flood_alert_app/pages/homeScreen.dart';
import 'package:flood_alert_app/pages/result.dart';
import '../generated/i18n.dart';

class Map extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Map> {
  // LocationResult _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      title: 'location picker',
      localizationsDelegates: const [
        location_picker.S.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pick Location'),
          backgroundColor: Colors.indigo,
        ),
        drawer: DrawerUI(),
        body: Builder(builder: (context) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.indigoAccent,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        LocationResult result = await showLocationPicker(
                          context,
                          "AIzaSyDnd6vpoAs8bpnAWK1XegaGaSEryjE_Dus",
                          initialCenter: LatLng(7.8731, 80.7718),
//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                          myLocationButtonEnabled: true,
                          layersButtonEnabled: true,
//                      resultCardAlignment: Alignment.bottomCenter,
                        );
                        //print("result = $result");
                        // print(result.latLng.latitude);
                        // print(result.latLng.longitude);
                        // setState(() => _pickedLocation = result);
                        double longitude = result.latLng.longitude;
                        double latitude = result.latLng.latitude;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(
                                  longitude: longitude, latitude: latitude)),
                        );
                        // print(result);
                      },
                      child: Text("Pick Location",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          )),
                    ),
                  ),
                  // Text(_pickedLocation.toString()),
                ],
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.home),
            backgroundColor: Colors.indigo,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }),
      ),
    );
  }
}
