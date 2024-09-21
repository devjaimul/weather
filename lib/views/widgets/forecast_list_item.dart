import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/utlis/text_style.dart';

class ForecastListItem extends StatelessWidget {
  final Forecastday? forecastday;
  const ForecastListItem({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    return Card(
      color: Colors.white.withOpacity(0.24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
        child: Row(
          children: [
            Image.network(
              "https:${forecastday?.day?.condition?.icon ?? ""}",
            ),
            Expanded(
              child: Text(
                  DateFormat.MMMEd()
                      .format(DateTime.parse(forecastday?.date.toString() ?? "")),
                  style: TextStyle(fontSize: sizeH * .016, color: Colors.white)),
            ),
            Expanded(child: HeadingThree(data:forecastday?.day?.condition?.text.toString() ?? "" ,fontSize: sizeH * .016)),
            Expanded(child: HeadingThree(data:"^${forecastday?.day?.maxtempC?.round()}/${forecastday?.day?.mintempC?.round()}" ,fontSize: sizeH * .018)),




          ],
        ),
      ),
    );
  }
}
