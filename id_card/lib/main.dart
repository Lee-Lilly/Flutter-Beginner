import 'dart:ui';
import 'dart:async';
//dart:convert package convert http response to Dart object
import 'dart:convert';
// http package is added to dependencies in pubspec.yaml
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class Ninja {
  //create a Ninja class that contains the data from the network request.
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String imgUrl;

  // constructor with named parameters
  // & automatically assigns named arguments to class properties
  Ninja({this.id, this.firstName, this.lastName, this.email, this.imgUrl});

  // factory constructor creates a Ninja from JSON.
  factory Ninja.fromJson(Map<String, dynamic> json) {
    return Ninja(
      id: json['data']['id'],
      firstName: json['data']['first_name'],
      lastName: json['data']['last_name'],
      email: json['data']['email'],
      imgUrl: json['data']['avatar'],
    );
  }
}

// Future is a core Dart class for working with async operations.
Future<Ninja> fetchNinja(id) async {
  // make a http request to a userApi, with parameter 'id'.
  final response = await http.get('https://reqres.in/api/users/'+'$id');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Ninja.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Flutter Future Demo',
    theme: ThemeData(
      // This is the theme of your application.
      primarySwatch: Colors.blue,
      // This makes the visual density adapt to the platform in use
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: IdCard(),
  ));
}

class IdCard extends StatefulWidget {
  
  @override
  _IdCardState createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[200],
        appBar: AppBar(
          title: Text('Ninja ID Card'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (id < 12) {
              setState(() {
                id ++;
              });
            }
            else{ //Dialog to get back to beginning
              showDialog(
                  context: context,
                  builder: (_) =>  AlertDialog(
                    title: Text ("This is the last card.",
                                  style: TextStyle(
                                    color: Colors.amber[200],
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            setState(() { //call back original state
                              id = 1;
                            });
                            Navigator.pop(context);
                            },
                          child: Text("Go Back",
                                    style: TextStyle(
                                      color: Colors.deepPurple[300],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 1.0,
                                    )
                          )
                      ),
                    ],
                    backgroundColor: Colors.black12,
                  ),
                  barrierDismissible: true,
              );
            }
          },
          child: Text ('NEXT'),
        ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: FutureBuilder<Ninja>( //use the FutureBuilder widget to render data
                  future: fetchNinja(id),
                  builder: (context, snapshot) { //AsyncSnapshot
                    if(snapshot.hasData){ //snapshot.hasData returns true if contains a non-null data value.
                        return
                          Column (
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                      Center(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(snapshot.data.imgUrl),
                                          radius: 60,
                                        ),
                                      ),
                                      Divider(
                                        height: 60,
                                        color: Colors.grey[100],
                                      ),
                                      SizedBox(height: 10),
                                      Text ('FIRST NAME',
                                      style: TextStyle(
                                          color: Colors.grey[900],
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text (snapshot.data.firstName,
                                        style: TextStyle(
                                          color: Colors.deepPurple[600],
                                          letterSpacing: 2.0,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 30),
                                      Text ('LAST NAME',
                                        style: TextStyle(
                                          color: Colors.grey[900],
                                          letterSpacing: 2.0,
                                          fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text (snapshot.data.lastName,
                                        style: TextStyle(
                                          color: Colors.deepPurple[600],
                                          letterSpacing: 2.0,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.email,
                                            color: Colors.deepPurple,
                                          ),
                                          SizedBox(width: 10),
                                          Text(snapshot.data.email,
                                              style: TextStyle(
                                                color: Colors.grey[900],
                                                fontSize: 18,
                                                letterSpacing: 1.0,
                                              )
                                          )
                                        ],
                                      )
                                ],
                          );
                    }
                    else {
                          return Center(child: CircularProgressIndicator());
                    }
                  })
      )
    );
  }
}


