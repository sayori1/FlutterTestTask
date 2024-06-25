

class ApiCityData {
  final Meta meta;
  final List<ApiCity> data;

  ApiCityData({
    required this.meta,
    required this.data,
  });

  factory ApiCityData.fromJson(Map<String, dynamic> json) {
    return ApiCityData(
      meta: Meta.fromJson(json['meta']),
      data: (json['data'] as List).map((i) => ApiCity.fromJson(i)).toList(),
    );
  }
}

class Meta {
  final int count;
  final Links links;

  Meta({
    required this.count,
    required this.links,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      count: json['count'],
      links: Links.fromJson(json['links']),
    );
  }
}

class Links {
  final String self;

  Links({required this.self});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'],
    );
  }
}

class ApiCity {
  final String type;
  final String? subType;
  final String name;
  final String? iataCode;
  final Address? address;
  final GeoCode? geoCode;

  ApiCity({
    required this.type,
    required this.subType,
    required this.name,
    this.iataCode,
    required this.address,
    required this.geoCode,
  });

  factory ApiCity.fromJson(Map<String, dynamic> json) {
    return ApiCity(
      type: json['type'],
      subType: json['subType'],
      name: json['name'],
      iataCode: json['iataCode'],
      address: Address.fromJson(json['address']),
      geoCode: 
      (json['geoCode'] as Map).isNotEmpty?
      GeoCode.fromJson(json['geoCode']): null,
    );
  }
}

class Address {
  final String? countryCode;
  final String? stateCode;

  Address({
    required this.countryCode,
    required this.stateCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      countryCode: json['countryCode'],
      stateCode: json['stateCode'],
    );
  }
}

class GeoCode {
  final double latitude;
  final double longitude;

  GeoCode({
    required this.latitude,
    required this.longitude,
  });

  factory GeoCode.fromJson(Map<String, dynamic> json) {
    return GeoCode(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}
