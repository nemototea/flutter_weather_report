import 'package:chopper/chopper.dart';

part 'weather_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class WeatherService extends ChopperService {
  static WeatherService create([ChopperClient client]) =>
      _$WeatherService(client);

  @Get(path: '')
  Future<Response> getWeatherApi({
    @Query('lat') String lat,
    @Query('lon') String lon,
    @Query('appid') String apiKey,
    @Query('exclude') String exclude,
    @Query('units') String units,
    @Query('lang') String lang,
  });
}
