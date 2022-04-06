import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationApp(),
    );
  }
}

class LocationApp extends StatefulWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  State<LocationApp> createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  var _location = 'Unknown';

  void getCurrentLocation() async {
    var location = await Geolocator().getCurrentPosition();

    setState(() {
      _location = location.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 46.0,
                color: Colors.blue,
              ),
              SizedBox(height: 16.0),
              Text(
                "GPS location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 26.0),
              Text(
                _location,
                style: TextStyle(fontSize: 16.0),
              ),
              TextButton(
                onPressed: (() {
                  getCurrentLocation();
                }),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  backgroundColor: Colors.blue[600],
                ),
                child: Text(
                  "Get location",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
      ),
    );
  }
}
