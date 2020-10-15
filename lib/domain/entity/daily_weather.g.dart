// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeather _$DailyWeatherFromJson(Map<String, dynamic> json) {
  return DailyWeather(
    dt: json['dt'] as int,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
    temp: json['temp'] == null
        ? null
        : Temperature.fromJson(json['temp'] as Map<String, dynamic>),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    dewPoint: json['dew_point'] as int,
    clouds: json['clouds'] as int,
    uvi: json['uvi'] as int,
    visibility: json['visibility'] as int,
    windSpeed: json['wind_speed'] as int,
    windGust: json['wind_gust'] as int,
    windDeg: json['wind_deg'] as int,
    weathers: (json['weather'] as List)
        ?.map((dynamic e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DailyWeatherToJson(DailyWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'clouds': instance.clouds,
      'uvi': instance.uvi,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_gust': instance.windGust,
      'wind_deg': instance.windDeg,
      'weather': instance.weathers,
    };
