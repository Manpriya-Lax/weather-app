import 'package:http/http.dart' as http;
class WeatherAPI {
  

final String apiKey;
WeatherAPI(this.apiKey);

Future <String> getweather(
  {required double lat, required double lon }) async{
  // Implementation to fetch weather data using the provided latitude and longitude

  var url = "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";

var response = await http.get(Uri.parse(url));

print(response.body);
return response.body;

}
}