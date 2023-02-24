// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:weather_app/infopage.dart';
import 'package:weather_app/tabs/caracas_tab.dart';
import 'package:weather_app/tabs/images_tab.dart';
import 'package:weather_app/tabs/latacunga_tab.dart';
import 'package:weather_app/tabs/list_tab.dart';
import 'package:weather_app/tabs/quito_tab.dart';

class HomePage extends StatelessWidget {
  static const TextStyle optionstyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text("Weather App"),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.info,
                            size: 28.0,
                            color: Colors.black45,
                          ),
                        ),
                        Text('Contacto')
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.thermostat,
                            size: 28.0,
                            color: Colors.black45,
                          ),
                        ),
                        Text('Datos del Clima')
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                if (value == 1) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InfoPage()));
                }
                if (value == 2) {
                  //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>HomePage()));
                }
              },
              ),
            ),
          ],
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TabBar(
              labelColor: Colors.black45,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                Tab(
                  text: "Latacunga",
                  icon: Icon(
                    Icons.location_city_rounded,
                    color: Colors.black45,
                  ),
                ),
                Tab(
                  text: "Quito",
                  icon: Icon(
                    Icons.location_city_rounded,
                    color: Colors.black45,
                  ),
                ),
                Tab(
                  text: "Caracas",
                  icon: Icon(
                    Icons.location_city_rounded,
                    color: Colors.black45,
                  ),
                ),
                Tab(
                  text: "Fotos",
                  icon: Icon(
                    Icons.image,
                    color: Colors.black45,
                  ),
                ),
                Tab(
                  text: "Lista",
                  icon: Icon(
                    Icons.list,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  LatacungaTab(),
                  QuitoTab(),
                  CaracasTab(),
                  ImagesTab(),
                  ListTab()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
