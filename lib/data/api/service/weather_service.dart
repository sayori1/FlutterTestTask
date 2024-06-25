
import 'package:dio/dio.dart';
import 'package:t/data/api/model/api_weather.dart';
import 'package:t/data/api/request/get_weather_body.dart';
import 'package:t/internal/di.dart';

class WeatherService {
  Future<ApiWeatherData?> getWeather(GetWeatherBody body) async {
    var dio = sl.get<Dio>();

    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters:
            body.copyWith(appId: const String.fromEnvironment("WEATHER_API_KEY")).toApi(),
      );
      return ApiWeatherData.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
