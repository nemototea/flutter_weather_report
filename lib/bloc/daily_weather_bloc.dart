import 'package:f_weather_report/domain/city_info.dart';
import 'package:f_weather_report/domain/entity/extracted_current_weather.dart';
import 'package:f_weather_report/domain/entity/extracted_daily_weather.dart';
import 'package:f_weather_report/domain/entity/weather.dart';
import 'package:f_weather_report/domain/repository/weather_repository.dart';
import 'package:f_weather_report/util/disposable.dart';
import 'package:rxdart/rxdart.dart';

/// BLoC のガイドライン
///
/// 状態を管理する BLoC に以下の制約を課す。
/// 1. インプットとアウトプットは、単純な Stream と Sink に限定する。
/// (Inputs and outputs are simple Streams/Sinks only.)
/// 2. 依存性は、必ず注入可能でプラットフォームに依存しないものとする。
/// (Dependencies must be injectable and platform agnostic.)
/// 3. プラットフォームごとの条件分岐は、許可しない。
/// (No platform branching allowed.)
///
/// 上記の制約を守れば、どのような実装でも構わない。
/// ただし、reactive programming を推奨したい。
/// (Implementation can be whatever you want if you follow the previous rules.)
/// (But may I suggest reactive programming?).
class DailyWeatherBloc extends Disposable {
  DailyWeatherBloc() {
    // DIしたい
    final repository = WeatherRepository();

    _getForecastController.stream.listen((event) {
      if (event == CityInfo.tokyoID) {
        repository
            .getDailyWeather(
              cityID: event,
              lat: CityInfo.tokyoLat,
              lon: CityInfo.tokyoLon,
            )
            .then((value) => _dailyWeatherDataController.sink.add(value));
      } else if (event == CityInfo.sapporoID) {
        repository
            .getDailyWeather(
              cityID: event,
              lat: CityInfo.sapporoLat,
              lon: CityInfo.sapporoLon,
            )
            .then((value) => _dailyWeatherDataController.sink.add(value));
      }
    });
  }

  // region Sink
  final _getForecastController = PublishSubject<String>();
  Sink<String> get getDailyWeather => _getForecastController.sink;
  // endregion

  // region Stream
  final _dailyWeatherDataController =
      BehaviorSubject<ExtractedDailyWeather>.seeded(ExtractedDailyWeather());
  ValueStream<ExtractedDailyWeather> get dailyWeather =>
      _dailyWeatherDataController;
  // endregion

  @override
  Future<void> dispose() async {
    await _getForecastController.close();
    await _dailyWeatherDataController.close();
  }
}
