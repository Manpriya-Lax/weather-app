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
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: weatherAPI.getweather(lat: 52.52, lon: 13.41),
          
               builder: (context, snapshot) 
               {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return   CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return  Text('Error: ${snapshot.error}');
          } 
          
          var data = snapshot.data;
          
          
          return Column( 
          
            children: [
              const SizedBox(height: 20),
              Text(style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), " ${data!['name']}"),
              const SizedBox(height: 12),

              Text(style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold ,), " ${data['main']['temp']} °C"),
              const SizedBox(height: 12),

              Image.network(weatherAPI.getWeatherIcon(data['weather'][0]['icon'])),
              Text( style: TextStyle(fontSize: 20), "${data['weather'][0]['description']}"),

              const SizedBox(height: 20),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                Text(style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), "Maximum"),  
                const SizedBox(height: 12),

                Text(style: TextStyle(fontSize: 18), "${data['main']['temp_max']} °C"),
                    ],
                  ),
                  SizedBox(width: 40),

                  Column(
                    children: [
                Text(style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), "Minimum"),  
                const SizedBox(height: 12),
                Text(style: TextStyle(fontSize: 18), "${data['main']['temp_min']} °C"),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 40),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                Text(style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), "Sun rise"),  
                const SizedBox(height: 12),

                Icon(Icons.wb_sunny, color: Colors.orangeAccent,),

                const SizedBox(height: 12),

                Text(style: TextStyle(fontSize: 18), "${data['sys']['sunrise']}"),
                    ],
                  ),
                  SizedBox(width: 40),

                  Column(
                    children: [
                Text(style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), "Sun set"),  
                const SizedBox(height: 12),

                Icon(Icons.nights_stay,  color: Colors.orangeAccent,),
                const SizedBox(height: 12),
                Text(style: TextStyle(fontSize: 18), "${data['sys']['sunset']}"),
                    ],
                  ),

                ],
              )


            ],
          
          );
          
               }
          
          ),
        ),
      ),
    );
  }
}
