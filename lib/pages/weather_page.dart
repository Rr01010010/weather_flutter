import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/cubit/weather_city_cubit.dart';
import 'package:flutter_weather/pages/city_selection.dart';
import 'package:flutter_weather/widgets/combined_temperature.dart';
import 'package:flutter_weather/widgets/location.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //Navigator.of(context).push<void>(SettingsPage.route(
              //context.read<WeatherCubit>(),
              //));
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherCityCubit, WeatherCityState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case NonCity:
                return const Text('Please Select a Location');
              case WeatherCityInitial:
                return const CircularProgressIndicator();
              case WeatherOfCity:
                var data = (state as WeatherOfCity);
                return Container(
                  color: Colors.purpleAccent.shade200,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Center(
                          child: Location(location: data.cityData?.name),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50.0),
                        child: Center(
                          child: CombinedWeatherTemperature(
                            weather: data,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              case CityFounded:
                break;
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                value: BlocProvider.of<WeatherCityCubit>(context),
                child: CitySelection()),
          ));
          //await context.read<WeatherCubit>().fetchWeather(city);
        },
      ),
    );
  }
}
