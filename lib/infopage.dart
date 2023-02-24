// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>InfoPage()));
                }
                if (value == 2) {
                  Navigator.of(context)
                      .pop(MaterialPageRoute(builder: (context) => InfoPage()));
                }
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
              Colors.black54,
              Colors.black45,
              Colors.black12,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text('Datos de Contacto',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.0,
            ),
            Image(
              image: AssetImage('assets/body.png'),
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('Bryan Andres Vega Saltos',
                style: TextStyle(fontSize: 20.0,)),
            SizedBox(
              height: 10.0,
            ),
            Text('Correo: bavega6@espe.edu.ec',
                style: TextStyle(fontSize: 20.0)),
            SizedBox(
              height: 10.0,
            ),
            Text('Telefono: 0984003977',
                style: TextStyle(fontSize: 20.0)),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
