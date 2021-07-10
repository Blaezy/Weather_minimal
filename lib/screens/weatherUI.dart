import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/DataService.dart';
import 'package:weather_app/models.dart';

class WeatherUI extends StatefulWidget {
  const WeatherUI({Key? key}) : super(key: key);

  @override
  _WeatherUIState createState() => _WeatherUIState();
}

class _WeatherUIState extends State<WeatherUI> {
  final cityTextController = TextEditingController();
  final _dataservice = DataService();
  WeatherResponse? _weatherResponse;

  void _search() async {
    final response = await _dataservice.getWeather(cityTextController.text);
    // final anotherResponse =
    //     await _dataservice.getcountPrediction(cityTextController.text);
    // print(anotherResponse.count);
    print(response.cityName);
    print(response.temp.temperature);
    setState(() {
      _weatherResponse = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              style: GoogleFonts.encodeSansSemiExpanded(),
              controller: cityTextController,
              decoration: InputDecoration(
                labelText: 'City',
                labelStyle: GoogleFonts.encodeSansSemiExpanded(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.blueAccent,
                      style: BorderStyle.solid),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.blueAccent,
                      style: BorderStyle.solid),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 190),
            child: ElevatedButton(
                onPressed: _search,
                child: Text(
                  "Search",
                  style: GoogleFonts.encodeSansSemiExpanded(),
                )),
          ),
          SizedBox(
            height: 50,
          ),
          if (_weatherResponse != null)
            Container(
              child: Text(
                '${_weatherResponse!.temp.temperature}°',
                style: GoogleFonts.encodeSansSemiExpanded(fontSize: 20),
              ),
            ),
          if (_weatherResponse != null)
            Container(
              child: Text(
                _weatherResponse!.cityName,
                style: GoogleFonts.encodeSansSemiExpanded(fontSize: 20),
              ),
            ),
          if (_weatherResponse != null)
            Container(
              child: ListTile(
                title: Text(
                  _weatherResponse!.weather.description,
                  style: GoogleFonts.encodeSansSemiExpanded(),
                ),
                leading: Image.network(_weatherResponse!.iconUrl),
              ),
            ),
        ],
      )),
    );
  }
}
