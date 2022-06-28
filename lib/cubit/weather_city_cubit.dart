import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/api/api.dart';
import 'package:flutter_weather/models/city_data.dart';
import 'package:flutter_weather/models/weather_data.dart';

part 'weather_city_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitialState());

  Future<void> searchCity(String nameCity) async {
    emit(LoadingState());
    try {
      var city = await API().searchCity(nameCity);
      if (city != null) {
        WeatherCityData? weather = await API().weatherForecast(city);
        if (weather != null) {
          emit(WeatherOfCity(weatherData: weather, cityData: city));
        } else {
          throw Exception("Не найдено данных о погоде в городе");
        }
      }
      else {
        throw Exception("Город не найден");
      }
    } catch (e, trace) {
      // print(trace);
      print(e);
      print(e.runtimeType);
      emit(ErrorState(error: e));
      //rethrow;
    }

  }
}
