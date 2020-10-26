import 'package:chopper/chopper.dart';

part 'weather_api.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class WeatherApi extends ChopperService {
  static WeatherApi create([ChopperClient client]) => _$WeatherApi(client);

  @Get(path: '')
  Future<Response> getWeather({
    @Query('lat') String lat,
    @Query('lon') String lon,
    @Query('appid') String apiKey,
    @Query('exclude') String exclude,
    @Query('units') String units,
    @Query('lang') String lang,
  });
}
