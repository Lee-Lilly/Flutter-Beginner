# id_card

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

Title: Ninja ID Card

Main Function: 
	1. HttpRequest to usersApi; 
	2. Fetch data asynchronously; 
	3. Convert repsonse in json form into Dart object;
	4. Looping through all users by incremental of userID,
	5. Display data in Flutter UI Widgets.

Main Flutter UI widgets: 
	1. AppBar;
	2. FutureBuilder for displaying response;
	3. FloatActionButton for looping through all users.
	
Main Dart components:
	1. main.dart (class IDCard, _IDCardState)
	2. ninja.dart (class Ninja, function fetchNinja(id))