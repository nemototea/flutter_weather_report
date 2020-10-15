import 'dart:async';
import 'package:f_weather_report/domain/service/weather_service.dart';
import 'package:f_weather_report/util/chopper_client_creator.dart';
import 'package:rxdart/rxdart.dart';

class WeatherRepository {
  // DIしたい
  final WeatherService service =
      WeatherService.create(ChopperClientCreator.create());

  Future<List<dynamic>> getCurrentWeatherApi({String id}) async {
    final response = await service.getCurrentWeatherApi(
      type: 'weather',
      id: id,
      units: ChopperClientCreator.units,
      lang: ChopperClientCreator.lang,
      apiKey: ChopperClientCreator.apiKey,
    );
    if (response.isSuccessful) {
      final json = response.body as Map<String, dynamic>;
//      return response.body['items'];
    } else {
      print(response.error);
    }
  }

  Future<List<dynamic>> getWeeklyWeatherApi({String lat, String lon}) async {
    final response = await service.getWeeklyWeatherApi(
      type: 'onecall',
      lat: lat,
      lon: lon,
      units: ChopperClientCreator.units,
      lang: ChopperClientCreator.lang,
      apiKey: ChopperClientCreator.apiKey,
    );
    if (response.isSuccessful) {
//      return response.body['items'];
    } else {
      print(response.error);
    }
  }
}
