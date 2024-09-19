import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/service/api_services.dart';
import 'package:weather/utlis/text_style.dart';
import 'package:weather/views/widgets/todays_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServices apiServices=ApiServices();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: HeadingTwo(data: 'Weather App',color: Colors.white,),
      ),
      body: SafeArea(child: FutureBuilder(
        future: apiServices.getWeather('Dhaka'),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          WeatherModel? weatherModel=snapshot.data;
          return TodaysWeather(weatherModel: WeatherModel(),);


        }
        if(snapshot.hasError){
          return Center(child: HeadingTwo(data: 'Error Has Occurred'));
        }
        return Center(child: CircularProgressIndicator());
      },)),
    );
  }
}
