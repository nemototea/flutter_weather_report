// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return Temperature(
    morn: json['morn'] as int,
    day: json['day'] as int,
    eve: json['eve'] as int,
    night: json['night'] as int,
    min: json['min'] as int,
    max: json['max'] as int,
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
