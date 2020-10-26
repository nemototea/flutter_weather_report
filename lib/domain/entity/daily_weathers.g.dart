// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weathers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyWeathers _$DailyWeathersFromJson(Map<String, dynamic> json) {
  return DailyWeathers(
    (json['daily'] as List)
        ?.map((dynamic e) =>
            e == null ? null : DailyWeather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DailyWeathersToJson(DailyWeathers instance) =>
    <String, dynamic>{
      'daily': instance.dailyData?.map((e) => e?.toJson())?.toList(),
    };

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
    dewPoint: (json['dew_point'] as num)?.toDouble(),
    clouds: json['clouds'] as int,
    uvi: (json['uvi'] as num)?.toDouble(),
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
      'temp': instance.temp?.toJson(),
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'clouds': instance.clouds,
      'uvi': instance.uvi,
      'weather': instance.weathers?.map((e) => e?.toJson())?.toList(),
    };

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return Temperature(
    morn: (json['morn'] as num)?.toDouble(),
    day: (json['day'] as num)?.toDouble(),
    eve: (json['eve'] as num)?.toDouble(),
    night: (json['night'] as num)?.toDouble(),
    min: (json['min'] as num)?.toDouble(),
    max: (json['max'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'morn': instance.morn,
      'day': instance.day,
      'eve': instance.eve,
      'night': instance.night,
      'min': instance.min,
      'max': instance.max,
    };
