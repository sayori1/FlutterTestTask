import 'package:t/data/api/model/api_weather.dart' hide ApiWeather;
import 'package:t/domain/model/weather.dart';

class WeatherMapper {
  static Weather fromApi(ApiWeatherData weather) {
    return Weather(temperature: weather.main.temp.toString());
  }
}
