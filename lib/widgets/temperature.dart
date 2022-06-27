import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final double temperature;

  const Temperature({
    Key? key,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${_formattedTemperature(temperature)}°',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  int _formattedTemperature(double t) => t.round();
}