import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  // JSONマップからWeatherインスタンスを生成するメソッド
  // ignore: lines_longer_than_80_chars
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  // JSONマップを返すメソッド
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  // APIで取得してきた天気情報を格納するデータクラス
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'main')
  String main;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'icon')
  String icon;
}
