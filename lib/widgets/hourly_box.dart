import 'package:flutter/material.dart';

import 'package:weather_app/models/forecast.dart';

import '../utils/utils.dart';

class HourlyBox extends StatelessWidget {
  const HourlyBox({
    Key? key,
    required this.forecast,
  }) : super(key: key);
  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      height: 150.0,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
        scrollDirection: Axis.horizontal,
        itemCount: forecast.hourly!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 1), // changes position of shadow
                  )
                ]),
            child: Column(
              children: [
                Text(
                  "${forecast.hourly![index].temp}°",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Colors.black),
                ),
                getWeatherIcon(forecast.hourly![index].icon),
                Text(
                  getTimeFromTimestamp(forecast.hourly![index].dt),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
