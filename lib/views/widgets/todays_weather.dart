import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

import 'package:weather/models/weather_model.dart';
import 'package:weather/utlis/text_style.dart';
import 'package:intl/intl.dart'; // Import the intl package

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;
  const TodaysWeather({super.key, this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;

 WeatherType getWeatherType(Current? current){
   if (current?.isDay == 1) {
     if (current?.condition?.text == "Sunny") {
       return WeatherType.sunny;
     } else if (current?.condition?.text == "Overcast") {
       return WeatherType.overcast;
     } else if (current?.condition?.text == "Partly cloudy") {
       return WeatherType.cloudy;
     } else if (current?.condition?.text == "Cloudy") {
       return WeatherType.cloudy;
     } else if (current?.condition?.text == "Clear") {
       return WeatherType.sunny;
     } else if (current?.condition?.text == "Mist") {
       return WeatherType.lightSnow;
     } else if (current!.condition!.text!.contains("thunder")) {
       return WeatherType.thunder;
     } else if (current.condition!.text!.contains("showers")) {
       return WeatherType.middleSnow;
     } else if (current.condition!.text!.contains("rain")) {
       return WeatherType.heavyRainy;
     }
   } else {
     if (current?.condition?.text == "Sunny") {
       return WeatherType.sunny;
     } else if (current?.condition?.text == "Overcast") {
       return WeatherType.overcast;
     } else if (current?.condition?.text == "Partly cloudy") {
       return WeatherType.cloudyNight;
     } else if (current?.condition?.text == "Cloudy") {
       return WeatherType.cloudyNight;
     } else if (current?.condition?.text == "Clear") {
       return WeatherType.sunnyNight;
     } else if (current?.condition?.text == "Mist") {
       return WeatherType.lightSnow;
     } else if (current!.condition!.text!.contains("thunder")) {
       return WeatherType.thunder;
     } else if (current.condition!.text!.contains("showers")) {
       return WeatherType.middleSnow;
     } else if (current.condition!.text!.contains("rain")) {
       return WeatherType.heavyRainy;
     }
   }
   return WeatherType.middleRainy;
 }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: WeatherBg(
                weatherType:getWeatherType(weatherModel?.current) ,
                width: sizeW,
                height: sizeH * .38),
          ),
          SizedBox(
            height: sizeH * .37,
            width: double.infinity,
            child: Column(
              children: [
                Card(
                  color: Colors.white.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        HeadingTwo(
                          data: weatherModel?.location?.name ?? "",
                        ),
                        Text(
                            DateFormat.yMMMMEEEEd().format(DateTime.parse(
                                weatherModel?.current?.lastUpdated.toString() ??
                                    "")),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white

                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius:sizeH*.04,

                          backgroundColor: Colors.white.withOpacity(0.05),
                          child: Image.network(
                              "https:${weatherModel?.current?.condition?.icon ?? ""}",height: sizeH*.2,width: sizeW*.2,)),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: HeadingTwo(
                                  data:
                                      "${weatherModel?.current?.tempC?.round().toString() ?? ""}c",
                                  fontSize: sizeH*.04,
                                  color: Colors.pink,
                                ),
                              ),
                              const HeadingThree(
                                data: "o",
                                color: Colors.pink,
                              ),
                            ],
                          ),
                          HeadingThree(
                              data: weatherModel?.current?.condition?.text ?? "")
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: Colors.white.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const HeadingThree(data: "Feel Likes"),
                                  HeadingThree(
                                      data:
                                          '${weatherModel?.current?.feelslikeC?.round().toString() ?? ""} c'),
                                ],
                              ),
                              Column(
                                children: [
                                  const HeadingThree(data: "Wind"),
                                  HeadingThree(
                                      data:
                                          '${weatherModel?.current?.windKph?.round().toString() ?? ""} Km/h'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: sizeH * .015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const HeadingThree(data: "Humidity"),
                                  HeadingThree(
                                      data:
                                          '${weatherModel?.current?.humidity.toString() ?? ""} %'),
                                ],
                              ),
                              Column(
                                children: [
                                  const HeadingThree(data: "Visibility"),
                                  HeadingThree(
                                      data:
                                          '${weatherModel?.current?.visKm?.round().toString() ?? ""} Km'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
