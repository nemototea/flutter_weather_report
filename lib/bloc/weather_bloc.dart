import 'package:f_weather_report/domain/city_info.dart';
import 'package:f_weather_report/domain/entity/extracted_current_weather.dart';
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
class WeatherBloc extends Disposable {
  WeatherBloc() {
    // DIしたい
    final repository = WeatherRepository();

    _getCurrentWeatherController.stream.listen((_) {
      repository
          .getCurrentWeather()
          .then((value) => _currentWeatherDataController.sink.add(value));
    });

    _getForecastController.stream.listen((event) {
      if (event == CityInfo.tokyoID) {
        repository.getDailyWeather(
            cityID: event, lat: CityInfo.tokyoLat, lon: CityInfo.tokyoLon);
        // getできた後の画面遷移のやり方を調査
      } else if (event == CityInfo.sapporoID) {
        repository.getDailyWeather(
            cityID: event, lat: CityInfo.sapporoLat, lon: CityInfo.sapporoLon);
      }
    });
  }

  // region Sink
  final _getCurrentWeatherController = PublishSubject<void>();
  Sink<void> get getCurrentWeather => _getCurrentWeatherController.sink;

  final _getForecastController = PublishSubject<String>();
  Sink<String> get getDailyWeather => _getForecastController.sink;
  // endregion

  // region Stream
  final _currentWeatherDataController =
      BehaviorSubject<ExtractedCurrentWeather>.seeded(
          ExtractedCurrentWeather());
  ValueStream<ExtractedCurrentWeather> get currentWeather =>
      _currentWeatherDataController;
  // endregion

  @override
  Future<void> dispose() async {
    await _getCurrentWeatherController.close();
    await _getForecastController.close();
    await _currentWeatherDataController.close();
  }
}
