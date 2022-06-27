part of 'weather_city_cubit.dart';

abstract class WeatherCityState extends Equatable {
  const WeatherCityState();
}

class WeatherCityInitial extends WeatherCityState {
  WeatherCityInitial() {
    //(await SharedPreferences.getInstance()).
  }
  @override
  List<Object> get props => [];
}
class NonCity extends WeatherCityState {
  @override
  List<Object> get props => [];
}
class CityFounded extends WeatherCityState {
  CityFounded({this.weatherCityData,this.cityData});
  WeatherCityData? weatherCityData;
  CityData? cityData;

  @override
  List<Object?> get props => [cityData, weatherCityData];
}
class WeatherOfCity extends WeatherCityState {
  WeatherOfCity({this.weatherCityData,this.cityData});
  WeatherCityData? weatherCityData;
  CityData? cityData;


  @override
  List<Object?> get props => [cityData, weatherCityData];
}
