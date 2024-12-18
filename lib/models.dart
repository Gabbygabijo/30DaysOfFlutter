//{    
//"weather": [
//       {
//          "id": 501,
//          "main": "Rain",
//          "description": "moderate rain",
//          "icon": "10d"
//       }
//    ],
//    "main": {
//       "temp": 284.2,
//       "feels_like": 282.93,
//       "temp_min": 283.06,
//       "temp_max": 286.82,
//       "pressure": 1021,
//       "humidity": 60,
//       "sea_level": 1021,
//       "grnd_level": 910
//    },
//    
//    "timezone": 7200,
//    "id": 3165523,
//    "name": "Province of Turin",
//    "cod": 200
// }    

class WeatherInfo {
  final String? description;
  final String? icon;

  WeatherInfo({this.description, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double? temperature;

  TemperatureInfo({this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature is int ? temperature.toDouble() : temperature as double);
  }
}

class WeatherResponse {
  final String? cityName;
  final TemperatureInfo? tempInfo;
  final WeatherInfo? weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo?.icon}@2x.png';
  }

  WeatherResponse({this.cityName, this.tempInfo, this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);
    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}                
                        