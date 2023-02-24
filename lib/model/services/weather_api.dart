// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherApi {
  Future<Weather>? getCurrentWeather(String? lat, String? lon) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=17f98b80613ad4464b1a451f0f832559&lang=es&units=metric");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }

  Widget getImage(String iconId) {
    if (iconId == null) {
      return Image(image: AssetImage('assets/exclamation.png'));
    }
    return FadeInImage(
        image:
            NetworkImage("https://openweathermap.org/img/wn/$iconId@2x.png"),
        placeholder: AssetImage('assets/exclamation.png'));
  }
}
