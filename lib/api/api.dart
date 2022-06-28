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

  Future<WeatherCityData?> weatherForecast(CityData cityData) async {
    try {
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
      }
      return null;
    } catch (e) {
      return null;
    }
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
      return null;
    } catch (e) {
      return null;
    }
  }
}
