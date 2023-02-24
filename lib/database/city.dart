class City {
  int? id;
  String? cityName;
  double? temp;
  int? humidity;
  int? pressure;
  String? description;

  
  City({
    this.id,
    this.cityName,
    this.temp,
    this.humidity,
    this.pressure,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cityName': cityName,
      'temp': temp,
      'humidity': humidity,
      'pressure': pressure,
      'description': description
    };
  }
}
