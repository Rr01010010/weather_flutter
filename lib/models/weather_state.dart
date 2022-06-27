import 'package:flutter_weather/models/weather_models.dart';
import 'package:equatable/equatable.dart';


abstract class WeatherState extends Equatable {
  const WeatherState([List props = const []]);
}

class WeatherEmpty extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({required this.weather}) : super([weather]);

  @override
  List<Object?> get props => [weather];
}

class WeatherError extends WeatherState {
  @override
  List<Object?> get props => [];
}