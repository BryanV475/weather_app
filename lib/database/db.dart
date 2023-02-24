// ignore_for_file: depend_on_referenced_packages

import 'city.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'cities.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE cities (id INTEGER PRIMARY KEY AUTOINCREMENT, cityName TEXT, temp DOUBLE, humidity INTEGER, pressure INTEGER, description TEXT)");
    }, version: 1);
  }

  static Future<int> insert(City city) async {
    Database database = await _openDB();

    return database.insert("cities", city.toMap());
  }

  static Future<List<City>> listAll() async {
    Database database = await _openDB();

    List<Map<String, dynamic>> citiesMap = await database.query("cities");

    return List.generate(
        citiesMap.length,
        (i) => City(
            id: citiesMap[i]['id'],
            cityName: citiesMap[i]['cityName'],
            temp: citiesMap[i]['temp'],
            humidity: citiesMap[i]['humidity'],
            pressure: citiesMap[i]['pressure'],
            description: citiesMap[i]['description']));
  }

  static Future<List<City>> listByName(String cityName) async {
    Database database = await _openDB();

    List<Map<String, dynamic>> citiesMap = await database
        .rawQuery('SELECT * FROM cities WHERE cityName = \'$cityName\'');

    return List.generate(
        citiesMap.length,
        (i) => City(
            id: citiesMap[i]['id'],
            cityName: citiesMap[i]['cityName'],
            temp: citiesMap[i]['temp'],
            humidity: citiesMap[i]['humidity'],
            pressure: citiesMap[i]['pressure'],
            description: citiesMap[i]['description']));
  }
}
