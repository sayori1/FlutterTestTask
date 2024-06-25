

import 'package:dio/dio.dart';
import 'package:t/data/api/model/api_city.dart';
import 'package:t/data/api/request/get_cities_body.dart';
import 'package:t/internal/di.dart';

class AmadeusCityService {
  String? token;
  String baseURL = "https://test.api.amadeus.com/v1";

  Future<String?> generateAccessToken() async {
    var dio = sl.get<Dio>();

    String clientId = const String.fromEnvironment("AMADEUS_CLIENT_ID");
    String clientSecret = const String.fromEnvironment("AMADEUS_CLIENT_SECRET");
    String url = "$baseURL/security/oauth2/token";

    var response = await dio.post(url,
        options: Options(
          headers: {"Content-type": "application/x-www-form-urlencoded"},
        ),
        data: "grant_type=client_credentials&client_id=$clientId&client_secret=$clientSecret");

    token = response.data['access_token'];
    return token;
  }

  Future<List<ApiCity>?> fetchCities(GetCitiesBody body) async {
    var dio = sl.get<Dio>();

    String url = "$baseURL/reference-data/locations/cities";

    if (token == null) {
      await generateAccessToken();
    }

    try {
      var response = await dio.get(url,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
          queryParameters: body.toApi());

      return ApiCityData.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }
}
