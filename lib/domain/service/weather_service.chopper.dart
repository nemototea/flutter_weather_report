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
  Future<Response<dynamic>> getWeatherApi(
      {String lat,
      String lon,
      String apiKey,
      String exclude,
      String units,
      String lang}) {
    final $url = '';
    final $params = <String, dynamic>{
      'lat': lat,
      'lon': lon,
      'appid': apiKey,
      'exclude': exclude,
      'units': units,
      'lang': lang
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
