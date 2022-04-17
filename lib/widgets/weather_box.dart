import 'package:flutter/material.dart';
import 'package:weather_app/extensions/string_extensions.dart';

import 'package:weather_app/models/weather_model.dart';

import '../clippers/my_Clipper.dart';
import '../utils/utils.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.all(15.0),
        height: 160.0,
        decoration: const BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      ClipPath(
        clipper: Clipper(),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 160.0,
          decoration: BoxDecoration(
            color: Colors.indigoAccent[400],
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
      Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 160.0,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    getWeatherIcon(weather!.icon),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Text(
                        weather!.description.capitalizeFirstOfEach,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Text(
                        "H:${weather!.high.toInt()}° L:${weather!.low.toInt()}°",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Column(children: [
                Text(
                  "${weather!.temp.toInt()}°",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.white),
                ),
                Container(
                    margin: const EdgeInsets.all(0),
                    child: Text(
                      "Feels like ${weather!.feelsLike.toInt()}°",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.white),
                    )),
              ])
            ],
          ))
    ]);
  }
}
