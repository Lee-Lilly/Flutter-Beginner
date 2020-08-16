import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldWeather {

  String location; // location name for UI
  String time; // the time in that location
  String weather; // the weather in that location
  String temperature; // the temperature actual
  String feelsLike; // the temperature feels
  String iconPath; // the weather icon end point
  String country; // country
  bool isDayTime; // know if it is still day

  //constructor with name parameters
  WorldWeather({this.location});

  final url = 'http://api.openweathermap.org/data/2.5/weather?q=';
  final apiKey = '7e2bf3935574fb15eed6c0b9a072ebdc';
  final imagePath = 'http://openweathermap.org/img/wn/';

  Future <void> getWeather() async {

    //get Request
    Response response = await get('$url'+'$location'+'&units=metric&APPID='+'$apiKey');
    // dart: convert use jsonDecode to transform the string into Map structure
    Map data= jsonDecode(response.body);

    //get time from json
    int timestamp = data['dt'];
    //create DateTime object
    DateTime now = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    // set the time property, using intl date format
    time = DateFormat.yMMMd().add_jm().format(now);

    //get sunrise from json
    int timestampSunrise = data['sys']['sunrise'];
    //create DateTime object
    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(timestampSunrise * 1000);

    //get sunrise from json
    int timestampSunset = data['sys']['sunset'];
    //create DateTime object
    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(timestampSunset * 1000);

    //set isDaytime value
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

    //get weather from json
    weather = data['weather'][0]['main'];

    //get temperatures from json
    double temp = data['main']['temp'];
    double tempFeel = data['main']['feels_like'];

    //set temperatures
    temperature = temp.toString() + '°C';
    feelsLike = tempFeel.toString() + '°C';

    //get country from json
    country = data['sys']['country'];

    //set icon path
    iconPath = imagePath + data['weather'][0]['icon'] + '@2x.png';

  }


}