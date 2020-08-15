import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:world_time/services/worldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading ...';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Helsinki', flag: 'finland.png', url: 'Europe/Helsinki');
    await instance.getTime();
    print(instance.time);

    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Text(time,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
          ),
        ),
      ),
    );
  }
}


