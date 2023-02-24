// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:weather_app/database/city.dart';
import 'package:weather_app/database/db.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  List<City> _cities = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
              Colors.black54,
              Colors.black45,
              Colors.black12,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          List<City> cities = await DB.listByName('Latacunga');
                          setState(() {
                            _cities = cities;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                        child: Text('Latacunga')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          List<City> cities = await DB.listByName('Quito');
                          setState(() {
                            _cities = cities;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                        child: Text('Quito')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          List<City> cities = await DB.listByName('Caracas');
                          setState(() {
                            _cities = cities;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                        child: Text('Caracas')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        List<City> cities = await DB.listAll();
                        setState(() {
                          _cities = cities;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                      ),
                      child: Text('Todas'),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<City>>(
              future:
                  Future.value(_cities), // use _cities instead of DB.listAll()
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Expanded(
                        child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text("${snapshot.data![index].cityName}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Temperatura: ${snapshot.data![index].temp}'),
                                  Text(
                                      'Presion: ${snapshot.data![index].pressure}'),
                                  Text(
                                      'Humedad: ${snapshot.data![index].humidity}'),
                                  Text(
                                      'Descripcion: ${snapshot.data![index].description}'),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text('No data found');
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ));
  }
}
