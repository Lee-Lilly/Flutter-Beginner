import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //initialize a Map structure
  Map res ={};

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add_location),
                      SizedBox(width: 10),
                      Container(
                          width: 150.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter a place name',
                              hintStyle: TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  width: 3,
                                  style: BorderStyle.none,
                                  color: Colors.teal[900],
                                ),
                              ),
                              contentPadding: EdgeInsets.all(16),
                            ),
                          )
                      )
                    ],
                  ),
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
                ],
              ),
            ),
          )),
    );
  }
}
