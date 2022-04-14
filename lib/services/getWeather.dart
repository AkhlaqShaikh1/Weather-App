// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/forecast.dart';
import '../models/location.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String _apiKey = "87aec31cf1e9fd61b69ddc7bcf848c5a";

  static Future getCurrentWeather(String city) async {
    Weather weather;
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(url));
      weather = Weather.fromJson(jsonDecode(response.body));
      return weather;
    } on SocketException {
      return "NO INTERNET CONNECTION";
    } on Exception catch (e) {
      return "$e";
    }
  }

  static Future getForecast(Location location) async {
    Forecast forecast;
    String lat = location.lat;
    String lon = location.long;
    var url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$_apiKey&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      forecast = Forecast.fromJson(jsonDecode(response.body));
      return forecast;
    }
  }
}
