part of 'weather_city_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class InitialState extends WeatherState {
  @override
  List<Object> get props => [];
}
class ErrorState extends WeatherState {
  final Object error;
  const ErrorState({required this.error});

  @override
  List<Object> get props => [];
}
class LoadingState extends WeatherState {
  @override
  List<Object> get props => [];
}
class WeatherOfCity extends WeatherState {
  const WeatherOfCity({this.weatherData,this.cityData});
  final WeatherCityData? weatherData;
  final CityData? cityData;


  @override
  List<Object?> get props => [cityData, weatherData];
}
