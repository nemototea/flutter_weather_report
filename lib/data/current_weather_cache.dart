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

  factory CurrentWeatherCache.fromMap(Map<String, String> json) =>
      CurrentWeatherCache(
        id: json['id'],
        cityName: json['cityName'],
        iconUrl: json['iconUrl'],
        description: json['description'],
        temperature: json['temperature'],
        diffFromTokyo: json['diffFromTokyo'],
      );

  Map<String, String> toMap() => {
        'id': id,
        'cityName': cityName,
        'iconUrl': iconUrl,
        'description': description,
        'temperature': temperature,
        'diffFromTokyo': diffFromTokyo,
      };

  String id;
  String cityName;
  String iconUrl;
  String description;
  String temperature;
  String diffFromTokyo;
}
