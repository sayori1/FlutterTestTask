import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t/domain/repository/weather_repository.dart';
import 'package:t/internal/di.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherBloc() : super(WeatherInitial()) {
    on<CitySelected>(_onCitySelected);
  }

  Future<void> _onCitySelected(
    CitySelected event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    try {
      final weather = await sl<WeatherRepository>().getWeather(latitude: event.city.lat, longitude: event.city.lon);
      emit(WeatherLoaded(weather!));
    } catch (e) {
      emit(WeatherError("Failed to fetch weather"));
    }
  }
}
