//https://www.metaweather.com/api/location/search/?query=chicago

import 'package:dio/dio.dart';
import 'package:flutter_weather/models/city_data.dart';
import 'package:flutter_weather/models/weather_data.dart';

class API {
  static final API _api = API._();

  API._();

  factory API() => _api;

  final Dio dio = Dio();

  //final String path = "https://www.metaweather.com/api/location";
  final String path = "https://api.openweathermap.org/data/2.5";

  //Future<void> weatherForecast(int woeid) async {
  //  var result = await dio.get("$path/$woeid/");
  //  print("STATUs CODE : ${result.statusCode}");
  //  return;
  //}

  Future<WeatherCityData?> weatherForecast(CityData cityData) async {
    var result = await dio.get("$path/onecall", queryParameters: {
      'appid': "9d3fc8f5207bebd31d456937534abae6",
      'lat': '${cityData.coord.lat}',
      'lon': '${cityData.coord.lon}',
      'units': 'metric'
    });

    if (result.statusCode == 200) {
      //print("DATA : ${result.data}");
      return WeatherCityData.fromJson(result.data);
    } else {
      print("STATUS CODE : ${result.statusCode}");
      return null;
    }
  }

  //Future<void> search(String city) async {
  //  var result = await dio.get("$path/search/?query=$city");
  //  print("STATUs CODE : ${result.statusCode}");
  //  return;
  //}

  Future<void> weatherArchive(int woeid, DateTime date) async {
    var result =
        await dio.get("$path/$woeid/${date.year}/${date.month}/${date.day}/");
    print("STATUs CODE : ${result.statusCode}");
    return;
  }

  Future<CityData?> searchCity(String city) async {
    try {
      var result = await dio.get("$path/weather", queryParameters: {
        'appid': "9d3fc8f5207bebd31d456937534abae6",
        'q': city
      });

      if (result.statusCode == 200) {
        // print("DATA : ${result.data}");
        return CityData.fromJson(result.data);
      } else {
        print("STATUS CODE : ${result.statusCode}");
      }
    } catch (e, st) {}
    return null;
  }
}
//9d3fc8f5207bebd31d456937534abae6
//https://api.openweathermap.org/data/2.5/
//https://api.openweathermap.org/data/2.5/weather
