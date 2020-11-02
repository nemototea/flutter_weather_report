import 'package:flutter/cupertino.dart';

class CurrentWeatherCache {
  CurrentWeatherCache({
    this.id,
    @required this.cityName,
    @required this.iconUrl,
    @required this.description,
    @required this.temperature,
    @required this.diffFromTokyo,
  });

  CurrentWeatherCache.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    cityName = map['cityName'] as String;
    iconUrl = map['iconUrl'] as String;
    description = map['description'] as String;
    temperature = map['temperature'] as String;
    diffFromTokyo = map['diffFromTokyo'] as String;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'cityName': cityName,
      'iconUrl': iconUrl,
      'description': description,
      'temperature': temperature,
      'diffFromTokyo': diffFromTokyo,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }

  int id = 0;
  String cityName;
  String iconUrl;
  String description;
  String temperature;
  String diffFromTokyo;
}
