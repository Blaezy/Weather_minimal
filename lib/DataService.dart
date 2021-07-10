import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': 'ecead7e829a5d721950a27b78ba87339',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }

  // Future<WeatherCount> getcountPrediction(String city) async {
  //   //api.openweathermap.org/data/2.5/forecast/daily?q={city name}&cnt={cnt}&appid={API key}
  //   final queryParameters = {
  //     'q': city,
  //     'cnt': 5,
  //     'appid': 'ecead7e829a5d721950a27b78ba87339'
  //   };

  //   final uri = Uri.https(
  //       'api.openweathermap.org', '/data/2.5/forecast/daily', queryParameters);
  //   final responeCount = await http.get(uri);
  //   print(responeCount.body);
  //   final jsonCount = jsonDecode(responeCount.body);
  //   return WeatherCount.fromJson(jsonCount);
  // }
}
