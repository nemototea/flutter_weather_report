import 'dart:async';
import 'package:f_weather_report/domain/service/weather_service.dart';
import 'package:f_weather_report/util/chopper_client_creator.dart';
import 'package:rxdart/rxdart.dart';

class WeatherRepository {
  // DIしたい
  final WeatherService service =
      WeatherService.create(ChopperClientCreator.create());

  Future<List<dynamic>> getWeather({String lat, String lon}) async {
    final response = await service.getWeatherApi(
      lat: lat,
      lon: lon,
      apiKey: ChopperClientCreator.apiKey,
      exclude: 'minutely,hourly,alerts',
      units: ChopperClientCreator.units,
      lang: ChopperClientCreator.lang,
    );
    if (response.isSuccessful) {
      final json = response.body as Map<String, dynamic>;
//      return response.body['items'];
    } else {
      print(response.error);
    }
  }
}
