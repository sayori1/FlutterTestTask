
import 'package:t/data/api/request/get_cities_body.dart';
import 'package:t/data/api/service/amadeus_city_service.dart';
import 'package:t/domain/model/city.dart';
import 'package:t/domain/repository/city_repository.dart';
import 'package:t/data/mapper/city_mapper.dart';

class CityDataRepository extends CityRepository {
  var service = AmadeusCityService();

  @override
  Future<List<City>?> getCities({required String keyword}) async {
    var cities = await service.fetchCities(GetCitiesBody(keyword: keyword));

    //Некоторые города не имеют геокода, поэтому мы их фильтруем
    cities = cities?.where((element) => element.geoCode != null).toList();

    return cities?.map((e) => CityMapper.fromApi(e)).toList();
  }
}
