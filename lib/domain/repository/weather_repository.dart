
import 'package:t/domain/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather?> getWeather({
    required double latitude,
    required double longitude,
  });
}
