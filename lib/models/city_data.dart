// To parse this JSON data, do
//
//     final cityData = cityDataFromJson(jsonString);

import 'dart:convert';

CityData cityDataFromJson(String str) => CityData.fromJson(json.decode(str));

String cityDataToJson(CityData data) => json.encode(data.toJson());

class CityData {
  CityData({
    required this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Coord coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
    coord: json["coord"] == null ? Coord(lon: 0, lat: 0) : Coord.fromJson(json["coord"]),
    weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    base: json["base"],
    main: json["main"] == null ? null : Main.fromJson(json["main"]),
    visibility: json["visibility"],
    wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
    clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
    dt: json["dt"],
    sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
    timezone: json["timezone"],
    id: json["id"],
    name: json["name"],
    cod: json["cod"],
  );

  Map<String, dynamic> toJson() => {
    "coord": coord == null ? null : coord.toJson(),
    "weather": weather == null ? null : List<dynamic>.from(weather!.map((x) => x.toJson())),
    "base": base,
    "main": main == null ? null : main!.toJson(),
    "visibility": visibility,
    "wind": wind == null ? null : wind!.toJson(),
    "clouds": clouds == null ? null : clouds!.toJson(),
    "dt": dt,
    "sys": sys == null ? null : sys!.toJson(),
    "timezone": timezone,
    "id": id,
    "name": name,
    "cod": cod,
  };
}

class Clouds {
  Clouds({
    this.all,
  });

  int? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"] == null ? null : json["temp"].toDouble(),
    feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
    tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
    tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
  };
}

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json["type"],
    id: json["id"],
    country: json["country"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  double? speed;
  int? deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"] == null ? null : double.tryParse(json["speed"]),
    deg: json["deg"],
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
  };
}