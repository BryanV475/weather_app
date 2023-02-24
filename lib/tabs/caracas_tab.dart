// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:weather_app/database/city.dart';
import 'package:weather_app/database/db.dart';
import 'package:weather_app/model/services/weather_api.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/views/current_weather.dart';

class CaracasTab extends StatefulWidget {
  const CaracasTab({Key? key}) : super(key: key);

  @override
  _CaracasTabState createState() => _CaracasTabState();
}

class _CaracasTabState extends State<CaracasTab> {
  WeatherApi apiClient = WeatherApi();
  Weather? data;
  Widget? icon;
  @override
  void initState() {
    super.initState();
  }

  Future<void> getData() async {
    data = await apiClient.getCurrentWeather("10.48801", "-66.87919");
    icon = apiClient.getImage("${data!.iconId}");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: [
                    Colors.black54,
                    Colors.black45,
                    Colors.black12,
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: currentWeather(
                        icon!,
                        "${data!.temp}",
                        "${data!.cityName}",
                        data!.humidity as int,
                        data!.pressure as int,
                        "${data!.description}",
                        "caracas1.jpg"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        City city = City(
                            cityName: data!.cityName,
                            temp: data!.temp,
                            humidity: data!.humidity,
                            pressure: data!.pressure,
                            description: data!.description);

                        print(await DB.insert(city));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                      child: Text('Guardar'),)
                ],
              ),
            );
          }
          return Container();
        });
  }
}
