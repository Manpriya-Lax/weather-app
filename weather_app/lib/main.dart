import 'package:flutter/material.dart';
import 'package:weather_app/weatherAPI/weatherAPI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
    const MyApp({super.key});

  @override
 
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final weatherAPI =  WeatherAPI ("9f87037ccfc82dffc4548f6ad4328934");
  @override
 void initState() {
  super.initState();

  final res = weatherAPI.getweather(lat: 35.6895, lon: 139.6917);
  res.then((value) {
    print("init $value");
  });
}



  @override


  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final weatherAPI =  WeatherAPI ("9f87037ccfc82dffc4548f6ad4328934");


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
        future: weatherAPI.getweather(lat: 52.52, lon: 13.41),

     builder: (context, snapshot) 
     {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (snapshot.hasData) {
        return Center(child: Text('Weather Data: ${snapshot.data}'));
      } else {
        return const Center(child: Text('No data available'));
      }

     }
      ),
    );
  }
}
