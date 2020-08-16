import 'package:flutter/material.dart';
import 'package:world_time/services/world_weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// loading defines a instance of WorldTime and call getTime() asynchronously
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldWeather() async {

    WorldWeather instance = WorldWeather(location: 'Helsinki');
    await instance.getWeather();

    //redirect to home screen, also passing the data.
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'country': instance.country,
      'time': instance.time,
      'weather': instance.weather,
      'temperature': instance.temperature,
      'iconPath': instance.iconPath,
      'feelsLike': instance.feelsLike,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
              child: SpinKitWave(
                color: Colors.purpleAccent,
                size: 50.0,
              ),
            ),
        ),
      );
  }
}


