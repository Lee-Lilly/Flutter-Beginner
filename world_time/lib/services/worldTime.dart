import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location string for api url endpoint

  //constructor with name parameters
  WorldTime({this.location, this.flag, this.url});

  Future <void> getTime() async {
    //get Request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    // dart: convert use jsonDecode to transform the string into Map structure
    Map data= jsonDecode(response.body);
    //print(data);

    //get data properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print (datetime);
    //print (offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    //print(now);

    // set the time property
    time = now.toString();
  }
}