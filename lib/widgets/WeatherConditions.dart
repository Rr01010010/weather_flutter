import 'package:flutter/material.dart';
import 'package:flutter_weather/models/weather_data.dart';
import 'package:flutter_weather/models/weather_models.dart';

class WeatherConditions extends StatelessWidget {
  final Description condition;

  const WeatherConditions({Key? key, required this.condition})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Widget _mapConditionToImage(Description condition) {
    Widget icon;
    switch (condition) {
      case Description.BROKEN_CLOUDS:
        icon = Icon(Icons.cloud, color: Colors.white);//Image.asset('assets/cloudy.png');
        break;
      case Description.FEW_CLOUDS:
        icon = Icon(Icons.cloud, color: Colors.white);//Image.asset('assets/cloudy.png');
        break;
      case Description.OVERCAST_CLOUDS:
        icon = Icon(Icons.cloud, color: Colors.white);//Image.asset('assets/cloudy.png');
        break;
      case Description.SCATTERED_CLOUDS:
        icon = Icon(Icons.cloud, color: Colors.white);//Image.asset('assets/cloudy.png');
        break;
      case Description.LIGHT_RAIN:
        icon = Icon(Icons.grain, color: Colors.white);// Image.asset('assets/rainy.png');
        break;
      case Description.MODERATE_RAIN:
        icon = Icon(Icons.thunderstorm, color: Colors.white);// Image.asset('assets/thunderstorm.png');
        break;
      case Description.NONE:
        icon = Icon(Icons.sunny, color: Colors.white,);// Image.asset('assets/thunderstorm.png');
        break;
    }
    return icon;
  }
}