import 'dart:convert';

import 'package:aflutterapp/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final quaryParameters = {
      'q': city,
      'appid': 'b4fb9d64529d6e007afaa143d68c84fb',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', quaryParameters);
    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
