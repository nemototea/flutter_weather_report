import 'package:chopper/chopper.dart';

part 'weather_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class WeatherService extends ChopperService {
  static WeatherService create([ChopperClient client]) =>
      _$WeatherService(client);

  @Get(path: '/{type}')
  Future<Response> getCurrentWeatherApi({
    @Path('type') String type,
    @Query('id') String id,
    @Query('units') String units,
    @Query('lang') String lang,
    @Query('appid') String apiKey,
  });

  @Get(path: '/{type}')
  Future<Response> getWeeklyWeatherApi({
    @Path('type') String type,
    @Query('lat') String lat,
    @Query('lon') String lon,
    @Query('units') String units,
    @Query('lang') String lang,
    @Query('appid') String apiKey,
  });
}
//
//abstract class WeatherRepositoryContract {
//  Weather getWeatherInfo(String city);
//  int saveToDatabase(Weather data);
//  Weather loadFromDatabase();
//}
//
//class WeatherRepository extends WeatherRepositoryContract {
//  @override
//  Weather getWeatherInfo(String city) {
//    // 非同期で天気API
//    return Weather();
//  }
//
//  @override
//  int saveToDatabase(Weather data) {
//    // DB保存処理作成
//    return 0;
//  }
//
//  @override
//  Weather loadFromDatabase() {
//    // DB読み取り処理作成
//    return Weather();
//  }
//}
