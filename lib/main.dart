import 'package:flutter/material.dart';

import 'package:weather_app/models/location.dart';
import 'package:weather_app/pages/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Location> loc = [
      Location(
        city: "karachi",
        country: "pakistan",
        lat: "24.860966",
        long: '66.990501',
      )
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Demo',
      home: CurrentWeatherPage(loc, context),
    );
  }
}
