# world_time

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

Title: World Weather

Main Function: 
	1. Defined a class of WorldWeather({...}) as networking services;
	2. WorldWeather services includes:
			- HttpRequest to openweatherApi; 
			- Fetch data asynchronously; 
			- Convert repsonse in json form into Dart Map Obj structure;
			- set all properties of class WorldWeather.
	3. Set up Route between two screen: Loading() and Home();
	4. Loading screen Function: 
			- initially call getWeather('local') from services;
			- pass the data and redirect to home screen.
	5. Home screen Function:
			- initially display weather data from Loading screen;
			- pop up dialog with TextField for user input new location;
			- updateWeather by calling services;
			- display weather for new location according to user input. 
			- the background image would alternate between day and night depends on sunset and sunrise time in that location.
	
Main Flutter packages: 
	1. dart:ui; 
	2. dart:convert
	3. Flutter intl package for DateTime
	4. Flutter http package for http request
	5. Flutter Navigator
	
Main components:
	1. main.dart (Define Routes)
	2. services/world_weather.dart (class: WorldWeather, function: getWeather())
	3. pages/home.dart (Home screen)
	4. pages/loading (Loading screen)

Unsolved problem:
	The home is not automatically updating, unless I push hot reload. I have not figure out the reason.