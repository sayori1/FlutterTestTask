import 'package:t/domain/model/city.dart';

abstract class WeatherEvent {}

class CitySelected extends WeatherEvent {
  final City city;

  CitySelected(this.city);
}
