import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_weather.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //initialize a Map structure
  Map res ={};
  //user input
  String input;

  void updateWeather(input) async {
    WorldWeather instance = WorldWeather(location: input);
    await instance.getWeather();
    Navigator.pop(context, {
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
  Widget build(BuildContext context) {
    // receive data from routes
    res = ModalRoute.of(context).settings.arguments;
    print(res);
    // set background image
    String bgImage = res['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = res['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/$bgImage'),
                  fit: BoxFit.cover,
                )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        res['location'] + ',',
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        res['country'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  Text(
                      res['time'],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic
                      )
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(
                          res['weather'],
                          style: TextStyle(
                            fontSize: 20.0,
                          )
                      ),
                      Image.network(res['iconPath'])
                    ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Temperature:  ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic
                            )
                        ),
                        Text(res['temperature'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic
                            )
                        ),
                      ]
                  ),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Feels like:  ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic
                            )
                        ),
                        Text(res['feelsLike'],
                            style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic
                            )
                        ),
                      ]
                  ),
                  SizedBox(height: 169),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.edit_location,
                          size: 69,
                          color: Colors.amber[300]),
                      SizedBox(width: 5),
                      Container(
                        width: 210,
                        height: 45,
                        child: RaisedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) =>  AlertDialog(
                                title: Text ("Enter a place name.",
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                content: TextField(
                                  onChanged: (val) {
                                    setState(() => input = val);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        width: 6,
                                        style: BorderStyle.none
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        updateWeather(input);
                                      },
                                      child: Text("Add",
                                          style: TextStyle(
                                            color: Colors.purpleAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            letterSpacing: 1.0,
                                          )
                                      )
                                  ),
                                  FlatButton(
                                    child: new Text('CANCEL'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                                backgroundColor: Colors.white60,
                              ),
                              barrierDismissible: true,
                            );
                          },
                          color: Colors.pink[300],
                          elevation: 30,
                          child: Text('Click to edit Location'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
