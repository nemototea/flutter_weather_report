// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$WeatherService extends WeatherService {
  _$WeatherService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = WeatherService;

  @override
  Future<Response<dynamic>> getCurrentWeatherApi(
      {String type, String id, String units, String lang, String apiKey}) {
    final $url = '/$type';
    final $params = <String, dynamic>{
      'id': id,
      'units': units,
      'lang': lang,
      'appid': apiKey
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getWeeklyWeatherApi(
      {String type,
      String lat,
      String lon,
      String units,
      String lang,
      String apiKey}) {
    final $url = '/$type';
    final $params = <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'units': units,
      'lang': lang,
      'appid': apiKey
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
