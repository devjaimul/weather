import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/utlis/text_style.dart';

import '../../models/weather_model.dart';

class HourlyLisitemTile extends StatelessWidget {
  final Hour? hour;
  const HourlyLisitemTile({super.key, this.hour});

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;
    final sizeW = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: sizeW * .3,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 1),
        child: Card(
          color: Colors.white.withOpacity(0.24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: HeadingThree(
                        data: "${hour?.tempC?.round().toString() ?? ""}c"),
                  ),
                  SizedBox(
                    width: sizeW * .008,
                  ),
                  HeadingThree(
                    data: 'o',
                    fontSize: 14,
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(.5),
                child: Image(image: NetworkImage("https:${hour?.condition?.icon??""}",),),
              ),
              Text(DateFormat.j().format(DateTime.parse(hour?.time.toString()??""),),style: TextStyle(fontSize: 15,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
