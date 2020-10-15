import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

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

  ​@JsonKey(name: 'morn')
  ​int morn;
  ​@JsonKey(name: 'day')
  ​int day;
  ​@JsonKey(name: 'eve')
  ​int eve;
  ​@JsonKey(name: 'night')
  ​int night;
  ​@JsonKey(name: 'min')
  ​int min;
  ​@JsonKey(name: 'max')
  ​int max;

  // ignore: lines_longer_than_80_chars
  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
