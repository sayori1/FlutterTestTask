import 'package:t/data/api/request/get_weather_body.dart';
import 'package:t/data/api/service/weather_service.dart';
import 'package:t/data/mapper/weather_mapper.dart';
import 'package:t/domain/model/weather.dart';
import 'package:t/domain/repository/weather_repository.dart';

class WeatherDataRepository extends WeatherRepository {
  var service = WeatherService();

  @override
  Future<Weather?> getWeather({required double latitude, required double longitude}) async {
    var apiWeather =
        await service.getWeather(GetWeatherBody(latitude: latitude, longitude: longitude));
    if (apiWeather != null) {
      return WeatherMapper.fromApi(apiWeather);
    }
    return null;
  }
}
