// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

Widget additionalInfo(int humidity, int pressure, String description) {
  return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Humedad: $humidity %",
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Presion: $pressure mmHg",
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Descripcion: $description",
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
}