import 'package:flutter/material.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherDetailBox extends StatelessWidget {
  const WeatherDetailBox({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 25, bottom: 25, right: 15),
      margin: const EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ]),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              const Text(
                "Wind",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                "${weather!.wind} km/h",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black),
              )
            ],
          )),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Humidity",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                Text(
                  "${weather!.humidity.toInt()}%",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              const Text(
                "Pressure",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.grey),
              ),
              Text(
                "${weather!.pressure} hPa",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.black),
              )
            ],
          ))
        ],
      ),
    );
  }
}
