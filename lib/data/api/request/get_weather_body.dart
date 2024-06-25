// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetWeatherBody {
  final double latitude;
  final double longitude;
  String? appId;

  GetWeatherBody({
    required this.latitude,
    required this.longitude,
    this.appId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'appid': appId,
    };
  }

  Map<String, dynamic> toApi() {
    return <String, dynamic>{"lat": latitude, "lon": longitude, "appid": appId};
  }

  String toJson() => json.encode(toMap());

  GetWeatherBody copyWith({
    double? latitude,
    double? longitude,
    String? appId,
  }) {
    return GetWeatherBody(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      appId: appId ?? this.appId,
    );
  }
}
