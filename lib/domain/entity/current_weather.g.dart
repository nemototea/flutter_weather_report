// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  return CurrentWeather(
    dt: json['dt'] as int,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
    temp: json['temp'] as int,
    feelsLike: json['feels_like'] as int,
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    dewPoint: json['dew_point'] as int,
    clouds: json['clouds'] as int,
    uvi: json['uvi'] as int,
    visibility: json['visibility'] as int,
    windSpeed: json['wind_speed'] as int,
    windGust: json['wind_gust'] as int,
    windDeg: json['wind_deg'] as int,
    weather: json['weather'] == null
        ? null
        : Weather.fromJson(json['weather'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'clouds': instance.clouds,
      'uvi': instance.uvi,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_gust': instance.windGust,
      'wind_deg': instance.windDeg,
      'weather': instance.weather,
    };
