class WeatherResponse {
  final String cityName;
  final TemperatureINfo temp;
  final WeatherInfo weather;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weather.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName, required this.temp, required this.weather});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final main = json['main'];
    final tempINfo = TemperatureINfo.fromJson(main);

    final WeatherInfjson = json['weather'][0];
    final WeatherInfoCont = WeatherInfo.fromJson(WeatherInfjson);
    return WeatherResponse(
        cityName: cityName, temp: tempINfo, weather: WeatherInfoCont);
  }
}

class TemperatureINfo {
  final double temperature;
  TemperatureINfo({required this.temperature});
  factory TemperatureINfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureINfo(temperature: temperature);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final String desciption = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: desciption, icon: icon);
  }
}

// class WeatherCount {
//   final int count;
//   WeatherCount({required this.count});

//   factory WeatherCount.fromJson(Map<String, dynamic> json) {
//     final int countOfdays = json['cnt'];
//     return WeatherCount(count: countOfdays);
//   }
// }

/*
{
   "city":{
      "id":2643743,
      "name":"London",
      "coord":{
         "lon":-0.1258,
         "lat":51.5085
      },
      "country":"GB",
      "population":0,
      "timezone":3600
   },
   "cod":"200",
   "message":0.7809187,
   "cnt":7,
   "list":[
      {
         "dt":1568977200,
         "sunrise":1568958164,
         "sunset":1569002733,
         "temp":{
            "day":293.79,
            "min":288.85,
            "max":294.47,
            "night":288.85,
            "eve":290.44,
            "morn":293.79
         },
         "feels_like":{
            "day":278.87,
            "night":282.73,
            "eve":281.92,
            "morn":278.87
         },
         "pressure":1025.04,
         "humidity":42,
         "weather":[
            {
               "id":800,
               "main":"Clear",
               "description":"sky is clear",
               "icon":"01d"
            }
         ],
         "speed":4.66,
         "deg":102,
         "gust": 5.3,
         "clouds":0,
         "pop":0.24
      },
*/
