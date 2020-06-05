import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather_modal.dart';

class WeatherRepo {
  Future<WeatherModal> getWeather(String city) async {
    final result = await http.Client().get(
        "api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2");
    if (result.statusCode != 200) throw Exception();
    return parsedJson(result.body);
  }

  WeatherModal parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];

    return WeatherModal.formJson(jsonWeather);
  }
}
