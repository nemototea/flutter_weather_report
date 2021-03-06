import 'dart:async';
import 'package:f_weather_report/data/current_weather_cache.dart';
import 'package:f_weather_report/data/database_provider.dart';
import 'package:f_weather_report/domain/api/weather_api.dart';
import 'package:f_weather_report/domain/city_info.dart';
import 'package:f_weather_report/domain/entity/current_weather.dart';
import 'package:f_weather_report/domain/entity/daily_weathers.dart';
import 'package:f_weather_report/domain/entity/extracted_current_weather.dart';
import 'package:f_weather_report/domain/entity/extracted_daily_weather.dart';
import 'package:f_weather_report/util/chopper_client_creator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class WeatherRepository {
  // DIしたい
  final WeatherApi _weatherApi =
      WeatherApi.create(ChopperClientCreator.create());

  /// 現在の天気取得
  Future<ExtractedCurrentWeather> getCurrentWeather() async {
    CurrentWeather sapporoCurrentWeather;
    CurrentWeather tokyoCurrentWeather;

    // APIコール(札幌)
    final sapporoResponse = await _weatherApi.getWeather(
      lat: CityInfo.sapporoLat,
      lon: CityInfo.sapporoLon,
      apiKey: ChopperClientCreator.apiKey,
      exclude: 'minutely,hourly,alerts',
      units: ChopperClientCreator.units,
      lang: ChopperClientCreator.lang,
    );

    // APIコール(東京)
    final tokyoResponse = await _weatherApi.getWeather(
      lat: CityInfo.tokyoLat,
      lon: CityInfo.tokyoLon,
      apiKey: ChopperClientCreator.apiKey,
      exclude: 'minutely,hourly,alerts',
      units: ChopperClientCreator.units,
      lang: ChopperClientCreator.lang,
    );

    if (tokyoResponse.isSuccessful && sapporoResponse.isSuccessful) {
      // 取得できたJSONファイルをデータクラスに展開
      final sapporoJson =
          sapporoResponse.body['current'] as Map<String, dynamic>;
      sapporoCurrentWeather = CurrentWeather.fromJson(sapporoJson);
      final tokyoJson = tokyoResponse.body['current'] as Map<String, dynamic>;
      tokyoCurrentWeather = CurrentWeather.fromJson(tokyoJson);

      // Viewで扱う形のクラスに抽出して返す
      return _extractCurrentWeatherData(
          sapporoCurrentWeather, tokyoCurrentWeather);
    } else {
      print(tokyoResponse.error);
      print(sapporoResponse.error);
      return ExtractedCurrentWeather();
    }
  }

  /// 指定した地域の日毎の天気を取得する
  Future<ExtractedDailyWeather> getDailyWeather(
      {String cityID, String lat, String lon}) async {
    DailyWeathers dailyWeathers;

    final response = await _weatherApi.getWeather(
      lat: lat,
      lon: lon,
      apiKey: ChopperClientCreator.apiKey,
      exclude: 'minutely,hourly,alerts',
      units: ChopperClientCreator.units,
      lang: ChopperClientCreator.lang,
    );
    if (response.isSuccessful) {
      final responseJson = response.body as Map<String, dynamic>;
      dailyWeathers = DailyWeathers.fromJson(responseJson);

      // Viewで扱う形のクラスに抽出して返す
      return _extractDailyWeathersData(dailyWeathers, cityID);
    } else {
      print(response.error);
      return ExtractedDailyWeather();
    }
  }

  /// DBにデータを保存する
  Future<void> saveToDatabase(ExtractedCurrentWeather data) async {
    await DBProvider.db.createWeather(_extractedDataToCache(data));
  }

  /// DBからの読み出しを行う
  Future<ExtractedCurrentWeather> readFromDatabase() async {
    final result = await DBProvider.db.readWeather();
    return _cacheToExtractedData(result.first);
  }

  // region privateメソッド

  /// 現在の天気データをView用に抽出
  ExtractedCurrentWeather _extractCurrentWeatherData(
      CurrentWeather sapporo, CurrentWeather tokyo) {
    final diff = sapporo.temp - tokyo.temp;

    return ExtractedCurrentWeather(
      cityName: '札幌',
      iconUrl:
          'http://openweathermap.org/img/wn/${sapporo.weathers.first.icon}@2x.png',
      description: sapporo.weathers.first.description,
      temperature: sapporo.temp.toString(),
      diffFromTokyo: diff.toStringAsFixed(2),
    );
  }

  /// 都市の日毎の天気データをView用に抽出
  ExtractedDailyWeather _extractDailyWeathersData(
      DailyWeathers weathersData, String cityID) {
    final cityName = (cityID == CityInfo.tokyoID) ? '東京' : '札幌';

    // 日毎のデータを作成
    final extractedWeather = <ExtractedWeather>[];
    for (final weather in weathersData.dailyData) {
      final date = DateTime.fromMillisecondsSinceEpoch(weather.dt * 1000);

      initializeDateFormatting('ja_JP');

      extractedWeather.add(ExtractedWeather(
        date: DateFormat('MM/dd(E)', 'ja_JP').format(date),
        maxTemperature: weather.temp.max.toString(),
        minTemperature: weather.temp.min.toString(),
        description: weather.weathers[0].description,
        iconUrl:
            'http://openweathermap.org/img/wn/${weather.weathers[0].icon}@2x.png',
        humidity: weather.humidity.toString(),
        uvi: weather.uvi.toString(),
      ));
    }

    return ExtractedDailyWeather(
      cityName: cityName,
      weathers: extractedWeather,
    );
  }

  /// 表示用の天気データをDB用のデータクラスに変換する
  CurrentWeatherCache _extractedDataToCache(ExtractedCurrentWeather data) {
    return CurrentWeatherCache(
      cityName: data.cityName,
      iconUrl: data.iconUrl,
      description: data.description,
      temperature: data.temperature,
      diffFromTokyo: data.diffFromTokyo,
    );
  }

  ExtractedCurrentWeather _cacheToExtractedData(CurrentWeatherCache data) {
    return ExtractedCurrentWeather(
      cityName: data.cityName,
      iconUrl: data.iconUrl,
      description: data.description,
      temperature: data.temperature,
      diffFromTokyo: data.diffFromTokyo,
    );
  }

  // endregion

}
