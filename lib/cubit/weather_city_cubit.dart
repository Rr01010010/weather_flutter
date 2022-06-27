import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/api/api.dart';
import 'package:flutter_weather/models/city_data.dart';
import 'package:flutter_weather/models/weather_data.dart';

part 'weather_city_state.dart';

class WeatherCityCubit extends Cubit<WeatherCityState> {
  WeatherCityCubit() : super(WeatherCityInitial());

  Future<void> searchCity(String nameCity) async {
    emit(WeatherCityInitial());
    try {
      var city = await API().searchCity(nameCity);
      if (city != null) {
        WeatherCityData? weather = await API().weatherForecast(city);
        if (weather != null) {
          emit(WeatherOfCity(weatherCityData: weather, cityData: city));
        } else {
          emit(CityFounded(weatherCityData: weather, cityData: city));
        }
      }
    } catch (e, trace) {
      //emit(ErrorState());
      rethrow;
    }

  }
}
