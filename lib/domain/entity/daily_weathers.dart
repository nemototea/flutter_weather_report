import 'package:f_weather_report/domain/entity/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_weathers.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyWeathers {
  DailyWeathers(this.dailyData);

  factory DailyWeathers.fromJson(Map<String, dynamic> json) =>
      _$DailyWeathersFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeathersToJson(this);

  List<DailyWeather> dailyData;
}

@JsonSerializable(explicitToJson: true)
class DailyWeather {
  DailyWeather({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.clouds,
    this.uvi,
    this.weathers,
  });

  // ignore: lines_longer_than_80_chars
  factory DailyWeather.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherToJson(this);

  @JsonKey(name: 'dt')
  int dt;
  @JsonKey(name: 'sunrise')
  int sunrise;
  @JsonKey(name: 'sunset')
  int sunset;
  @JsonKey(name: 'temp')
  Temperature temp;
  @JsonKey(name: 'pressure')
  int pressure;
  @JsonKey(name: 'humidity')
  int humidity;
  @JsonKey(name: 'dew_point')
  double dewPoint;
  @JsonKey(name: 'clouds')
  int clouds;
  @JsonKey(name: 'uvi')
  double uvi;
  @JsonKey(name: 'weather')
  List<Weather> weathers;
}

@JsonSerializable()
class Temperature {
  Temperature({
    this.morn,
    this.day,
    this.eve,
    this.night,
    this.min,
    this.max,
  });

  // ignore: lines_longer_than_80_chars
  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

  @JsonKey(name: 'morn')
  double morn;
  @JsonKey(name: 'day')
  double day;
  @JsonKey(name: 'eve')
  double eve;
  @JsonKey(name: 'night')
  double night;
  @JsonKey(name: 'min')
  double min;
  @JsonKey(name: 'max')
  double max;
}
