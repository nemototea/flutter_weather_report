import 'package:f_weather_report/domain/entity/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  CurrentWeather({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.clouds,
    this.uvi,
    this.visibility,
    this.windSpeed,
    this.windGust,
    this.windDeg,
    this.weather,
  });

  ​@JsonKey(name: 'dt')
  ​int dt;
  ​@JsonKey(name: 'sunrise')
  ​int sunrise;
  ​@JsonKey(name: 'sunset')
  ​int sunset;
  ​@JsonKey(name: 'temp')
  ​int temp;
  ​@JsonKey(name: 'feels_like')
  ​int feelsLike;
  ​@JsonKey(name: 'pressure')
  ​int pressure;
  ​@JsonKey(name: 'humidity')
  ​int humidity;
  ​@JsonKey(name: 'dew_point')
  ​int dewPoint;
  ​@JsonKey(name: 'clouds')
  ​int clouds;
  ​@JsonKey(name: 'uvi')
  ​int uvi;
  ​@JsonKey(name: 'visibility')
  ​int visibility;
  ​@JsonKey(name: 'wind_speed')
  ​int windSpeed;
  ​@JsonKey(name: 'wind_gust')
  ​int windGust;
  ​@JsonKey(name: 'wind_deg')
  ​int windDeg;
  ​@JsonKey(name: 'weather')
  ​Weather weather;

  // ignore: lines_longer_than_80_chars
  factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}