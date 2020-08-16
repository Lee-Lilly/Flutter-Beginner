import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {  //routes has Map data structure, expects {key, value} pairs
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    } ,
  ));
}

