class Weather {
  String? cityName;
  double? temp;
  int? humidity;
  int? pressure;
  String? description;
  String? iconId;

  Weather(
      {this.cityName,
      this.temp,
      this.humidity,
      this.pressure,
      this.description,
      this.iconId});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    description = json["weather"][0]["description"];
    iconId = json["weather"][0]["icon"];
  }
}
