class ApiWeatherData {
  final Coord coord;
  final List<ApiWeather> weather;
  final String wbase;
  final Main main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  ApiWeatherData({
    required this.coord,
    required this.weather,
    required this.wbase,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory ApiWeatherData.fromJson(Map<String, dynamic> json) {
    return ApiWeatherData(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List).map((i) => ApiWeather.fromJson(i)).toList(),
      wbase: json['base'],
      main: Main.fromJson(json['main']),
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      rain: json.containsKey("rain") ? Rain.fromJson(json['rain']): null,
      clouds: Clouds.fromJson(json['clouds']),
      dt: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}

class Coord {
  final double? lon;
  final double? lat;

  Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon']?.toDouble(),
      lat: json['lat']?.toDouble(),
    );
  }
}

class ApiWeather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  ApiWeather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory ApiWeather.fromJson(Map<String, dynamic> json) {
    return ApiWeather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Main {
  final double temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
    );
  }
}

class Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed']?.toDouble(),
      deg: json['deg'],
      gust: json['gust']?.toDouble(),
    );
  }
}

class Rain {
  final double? oneH;

  Rain({required this.oneH});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneH: json['1h']?.toDouble(),
    );
  }
}

class Clouds {
  final int? all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }
}

class Sys {
  final int? sunrise;
  final int? sunset;

  Sys({required this.sunrise, required this.sunset});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
