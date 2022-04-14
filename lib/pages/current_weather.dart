import 'package:flutter/material.dart';

import 'package:weather_app/widgets/weather_details.dart';

import '../models/forecast.dart';
import '../models/location.dart';
import '../models/weather_model.dart';
import '../services/getWeather.dart';
import '../widgets/daily_boxes.dart';
import '../widgets/hourly_box.dart';
import '../widgets/weather_box.dart';

class CurrentWeatherPage extends StatefulWidget {
  final List<Location> locations;
  final BuildContext context;
  // ignore: use_key_in_widget_constructors
  const CurrentWeatherPage(this.locations, this.context);

  @override
  _CurrentWeatherPageState createState() =>
      // ignore: no_logic_in_create_state
      _CurrentWeatherPageState(locations, context);
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final List<Location> locations;
  final Location location;
  final BuildContext context;
  _CurrentWeatherPageState(this.locations, this.context)
      : location = locations[0];

  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 20, top: 15, bottom: 15, right: 20),
              margin: const EdgeInsets.only(
                  top: 35, left: 15.0, bottom: 15.0, right: 15.0),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    width: 250,
                    height: 30,
                    child: TextField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Karachi, Pakistan",
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // cityController.clear();
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24.0,
                      semanticLabel: 'Tap to change location',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            currentWeatherViews(
              locations,
              location,
              context,
              cityController.text.isEmpty ? "karachi" : cityController.text,
            ),
            // forcastViewsDaily(location),
          ],
        ),
      ),
      // forcastViewsHourly(location),
      // ],)
    );
  }
}

Widget currentWeatherViews(List<Location> locations, Location location,
    BuildContext context, String city) {
  Weather? _weather;
  // String city = MyAppBar.city;
  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        _weather = snapshot.data as Weather?;
        if (_weather == null) {
          return const Text("Error getting weather");
        } else {
          return Column(
            children: [
              // MyAppBar(
              //     locations: locations, location: location, context: context),
              // SizedBox(height: 150),
              WeatherBox(weather: _weather!),
              WeatherDetailBox(weather: _weather!),
            ],
          );
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: WeatherService.getCurrentWeather(city),
  );
}

Widget forcastViewsHourly(Location location) {
  Forecast? _forcast;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        _forcast = snapshot.data as Forecast?;
        if (_forcast == null) {
          return const Text("Error getting weather");
        } else {
          return HourlyBox(forecast: _forcast!);
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: WeatherService.getForecast(location),
  );
}

Widget forcastViewsDaily(Location location) {
  Forecast? _forcast;

  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        _forcast = snapshot.data as Forecast?;
        return DailyBox(forcast: _forcast!);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: WeatherService.getForecast(location),
  );
}
