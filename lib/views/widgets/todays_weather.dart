import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weather/models/weather_model.dart';

class TodaysWeather extends StatelessWidget {
 final WeatherModel? weatherModel;
   const TodaysWeather({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final sizeH=MediaQuery.sizeOf(context).height;
    final sizeW=MediaQuery.sizeOf(context).width;
    return  Stack(
      children: [
        WeatherBg(weatherType: WeatherType.heavyRainy, width: double.infinity, height: sizeH*.2)
      ],
    );
  }
}
