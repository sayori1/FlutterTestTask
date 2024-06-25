import 'package:t/data/api/model/api_city.dart';
import 'package:t/domain/model/city.dart';

class CityMapper {
  static City fromApi(ApiCity city) {
    return City(
      name: city.name,
      lat: city.geoCode!.latitude,
      lon: city.geoCode!.longitude
    );
  }
}
