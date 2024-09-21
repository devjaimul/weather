import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/service/api_services.dart';
import 'package:weather/utlis/text_style.dart';
import 'package:weather/views/widgets/forecast_list_item.dart';
import 'package:weather/views/widgets/hourly_lisitem_tile.dart';
import 'package:weather/views/widgets/todays_weather.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  final TextEditingController searchTextEditingController =
      TextEditingController();
  String searchText = "auto:ip";

  showTextInputDialog(BuildContext context) async {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const HeadingTwo(data: "Search Loaction",color: Colors.black,),
        content: TextField(
          controller: searchTextEditingController,
          decoration: const InputDecoration(
            hintText: "Search by City, zip, lat, lang",

          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const HeadingThree(data: "Cancel",)),
          ElevatedButton(
              onPressed: () {
                if (searchTextEditingController.text.isEmpty) {
                  return;
                }
                Navigator.pop(context, searchTextEditingController.text);
              },
              child: const HeadingThree(data: "Ok"))
        ],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    final sizeH = MediaQuery.sizeOf(context).height;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.withOpacity(0.4),
        title: HeadingTwo(
          data: 'Weather App',
          fontSize: sizeH * .025,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                searchTextEditingController.clear();
                String text = await showTextInputDialog(context);
                setState(() {
                  searchText = text;
                });
              },
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                searchText="auto:ip";
                setState(() {

                });
              },
              icon: const Icon(
                Icons.my_location,
                color: Colors.white,
              )),
        ],
      ),
        body: SafeArea(
          child: FutureBuilder(
            future: apiServices.getWeather(searchText),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                WeatherModel? weatherModel = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TodaysWeather(
                        weatherModel: weatherModel,
                      ),
                      SizedBox(
                        height: sizeH * .01,
                      ),
                      const HeadingTwo(data: 'Weather by Hours'),
                      SizedBox(
                        height: sizeH * .01,
                      ),
                      SizedBox(
                        height: sizeH * .18,
                        child: ListView.builder(
                          shrinkWrap: true,
                         // physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length,
                          itemBuilder: (context, index) {
                            final hour = weatherModel
                                ?.forecast?.forecastday?[0].hour?[index];
                            return HourlyLisitemTile(
                              hour: hour,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: sizeH * .01,
                      ),
                      const HeadingTwo(data: 'Next 7 Days Weather'),
                      SizedBox(
                        height: sizeH * .01,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: weatherModel?.forecast?.forecastday?.length,
                        itemBuilder: (context, index) {
                          Forecastday? forecastDay =
                          weatherModel?.forecast?.forecastday?[index];
                          return ForecastListItem(forecastday: forecastDay);
                        },
                      )
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Center(child: HeadingTwo(data: 'Error Has Occurred'));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
    );
  }
}
