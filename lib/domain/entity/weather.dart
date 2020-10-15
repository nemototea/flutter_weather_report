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

  // APIで取得してきた天気情報を格納するデータクラス
  ​@JsonKey(name: 'id')
  ​int id; // 気象条件ID
  ​@JsonKey(name: 'main')
  ​String main; // 気象パラメータのグループ（雨、雪、極端など）
  ​@JsonKey(name: 'description')
  ​bool description; // グループ内の気象条件
  ​@JsonKey(name: 'icon')
  ​String icon; // 天気アイコンID

  // JSONマップからWeatherインスタンスを生成するメソッド
  // ignore: lines_longer_than_80_chars
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  // JSONマップを返すメソッド
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
