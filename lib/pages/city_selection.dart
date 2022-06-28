import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/cubit/weather_city_cubit.dart';

class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  CitySelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City'),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Chicago/London/New York',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                BlocProvider.of<WeatherCubit>(context)
                    .searchCity(_textController.text);
                // if (await BlocProvider.of<WeatherCityCubit>(context)
                //     .searchCity(_textController.text)) {//return true, if query success
                  Navigator.pop(context, _textController.text);
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}
