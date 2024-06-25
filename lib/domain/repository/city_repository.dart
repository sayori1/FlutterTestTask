import 'package:t/domain/model/city.dart';

abstract class CityRepository {
  Future<List<City>?> getCities({
    required String keyword,
  });
}
