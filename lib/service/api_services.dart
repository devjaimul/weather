import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather/constant/constant.dart';
import 'package:weather/models/weather_model.dart';

class ApiServices {
  Future<WeatherModel> getWeather(String searchText) async {
    String url = "$baseUrl&q=$searchText&days=7";
    try {
      Response response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherModel weatherModel = WeatherModel.fromJson(json);
        return weatherModel;
      } else {
        throw ('Nothing Found');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
