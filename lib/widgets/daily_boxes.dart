import 'package:flutter/material.dart';

import 'package:weather_app/models/forecast.dart';

import '../utils/utils.dart';

class DailyBox extends StatelessWidget {
  const DailyBox({
    Key? key,
    required this.forcast,
  }) : super(key: key);
  final Forecast forcast;

  @override
  Widget build(BuildContext context) {
    print(forcast.daily?.length);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
        itemCount: forcast.daily!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
            margin: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    getDateFromTimestamp(forcast.daily![index].dt),
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                Expanded(
                    child: getWeatherIconSmall(forcast.daily![index].icon)),
                Expanded(
                  child: Text(
                    "${forcast.daily![index].high.toInt()}/${forcast.daily![index].low.toInt()}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
