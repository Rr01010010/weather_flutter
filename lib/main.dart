import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/cubit/weather_city_cubit.dart';
import 'package:flutter_weather/pages/weather_page.dart';

void main() {
  runApp(const WeatherAppView());
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(),
        child: const WeatherPage(),
      ),
    );
  }
}
