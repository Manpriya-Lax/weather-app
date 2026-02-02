import 'dart:convert';

import 'package:http/http.dart' as http;
class WeatherAPI {
  

final String apiKey;
WeatherAPI(this.apiKey);

Future <Map<String, dynamic>> getweather(
  {required double lat, required double lon }) async{
  // Implementation to fetch weather data using the provided latitude and longitude

  var url = "https://api.openweathermap.org/data/2.5/weather?units=metric&lat=$lat&lon=$lon&appid=$apiKey";

var response = await http.get(Uri.parse(url));

print(response.body);
return jsonDecode(response.body);

  }
  
  String getWeatherIcon (String icon)
{
  return "http://openweathermap.org/img/wn/$icon@2x.png";

}


}