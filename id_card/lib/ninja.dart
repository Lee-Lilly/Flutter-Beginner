//dart:convert package convert http response to Dart object
import 'dart:convert';
// http package is added to dependencies in pubspec.yaml
import 'package:http/http.dart' as http;

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

