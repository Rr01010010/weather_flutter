import 'package:flutter/material.dart';
import 'package:flutter_weather/cubit/weather_city_cubit.dart';
import 'package:flutter_weather/models/weather_data.dart';
import 'package:flutter_weather/widgets/temperature.dart';
import 'package:flutter_weather/widgets/weather_conditions.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  final WeatherOfCity weather;

  const CombinedWeatherTemperature({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Temperature(
              temperature: weather.weatherData!.current.temp,
            ),
            const SizedBox(width: 10),
            WeatherConditions(
                condition:
                    weather.weatherData?.current.weather[0].description ??
                        Description.NONE),
          ],
        ),
        Center(
          child: Text(
            descriptionValues.reverseMap?[
                    weather.weatherData?.current.weather[0].description ??
                        Description.NONE] ??
                (weather.weatherData?.current.weather[0].description.name ??
                    ""),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
