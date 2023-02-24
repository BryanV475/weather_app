// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/views/additional_info.dart';

Widget currentWeather(Widget icon, String temp, String location, int humidity,
    int pressure, String description, String iconName) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                location,
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image(
                    image: AssetImage('assets/$iconName'),
                    width: 100,
                    height: 100,
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp°C",
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        additionalInfo(humidity, pressure, description)
      ],
    ),
  );
}
