import 'package:f_weather_report/domain/entity/weather.dart';
import 'package:f_weather_report/domain/repository/weather_repository.dart';
import 'package:f_weather_report/util/disposable.dart';
import 'package:rxdart/rxdart.dart';

class CurrentWeatherBloc extends Disposable {
  CurrentWeatherBloc() {
    // DIしたい
    var repository = WeatherRepository();

    _actionController.stream.listen((event) {
      repository.getCurrentWeatherApi();
    });
  }

  // 天気情報を取得するactionを公開
  final _actionController = PublishSubject<void>();
  Sink<void> get getWeather => _actionController.sink;

  // 天気データを提供するSubject
  final _currentWeatherController = BehaviorSubject<Weather>.seeded(Weather());
  ValueStream<Weather> get currentWeather => _currentWeatherController;

  @override
  Future<void> dispose() async {
    await _actionController.close();
    await _currentWeatherController.close();
  }
}
