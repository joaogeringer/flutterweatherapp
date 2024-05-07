import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_weatherapi/services/weather_services.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService =  WeatherService(apiKey);
  Weather? _weather;

  // fetch weather
_fetchWeather() async {
  // get the current city
   String cityName = await _weatherService.getCurrentCity();

  // get weather for city
  try {
    final weather = await _weatherService.getWeather(cityName);
    setState(() {
      _weather = weather;
    });
  }

  // any errors
  catch (e) {
    print(e);
  }
}

  // weather animations

  // initial state
@override initState() {
  super.initState();

  // TODO: implement initState
  _fetchWeather();
}

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather.cityName ?? "Loading city..."),
      
            // temperature 
            Text('${_weather?.temperature.round()} + °C')
          ],
        ),
      ),
    );
  }
}
