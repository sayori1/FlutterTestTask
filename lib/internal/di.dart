import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:t/data/repository/city_repository.dart';
import 'package:t/data/repository/weather_repository.dart';
import 'package:t/domain/repository/city_repository.dart';
import 'package:t/domain/repository/weather_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerSingleton<Dio>(Dio(BaseOptions()));
  sl.registerSingleton<CityRepository>(CityDataRepository());
  sl.registerSingleton<WeatherRepository>(WeatherDataRepository()); 
}
