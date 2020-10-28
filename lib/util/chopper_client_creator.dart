import 'package:chopper/chopper.dart';

// ignore: avoid_classes_with_only_static_members
class ChopperClientCreator {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String units = 'metric';
  static const String lang = 'ja';
  static const String apiKey = '83a38f73544834d1dc602453025a5edb';

  static ChopperClient create() {
    return ChopperClient(
      baseUrl: ChopperClientCreator.baseUrl,
      converter: const JsonConverter(),
    );
  }
}
