import 'package:f_weather_report/bloc/daily_weather_bloc.dart';
import 'package:f_weather_report/domain/city_info.dart';
import 'package:f_weather_report/domain/entity/extracted_daily_weather.dart';
import 'package:flutter/material.dart';
import 'package:f_weather_report/util/disposable_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DailyWeatherPage extends StatelessWidget {
  const DailyWeatherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cityID = ModalRoute.of(context).settings.arguments.toString();
    var _cityName = '';
    if (cityID == CityInfo.sapporoID) {
      _cityName = '札幌';
    } else {
      _cityName = '東京';
    }

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('$_cityName の予報'),
        backgroundColor: const Color(0xFF333366),
      ),
      body: DisposableProvider<DailyWeatherBloc>(
        create: (context) => DailyWeatherBloc(),
        child: _Container(
          cityID: cityID,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({Key key, this.cityID}) : super(key: key);

  final String cityID;

  @override
  Widget build(BuildContext context) {
    final weatherBloc = DisposableProvider.of<DailyWeatherBloc>(context);
    weatherBloc.getDailyWeather.add(cityID);

    return Center(
      child: Column(
        children: [
          StreamBuilder<ExtractedDailyWeather>(
            initialData: weatherBloc.dailyWeather.value,
            stream: weatherBloc.dailyWeather,
            builder: (context, snapshot) {
              if (snapshot.data.cityName != null ||
                  snapshot.data.weathers != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.weathers.length,
                    itemBuilder: (context, int index) {
                      final item = snapshot.data.weathers[index];
                      return Container(
                        height: 160,
                        margin: const EdgeInsets.only(
                            top: 16, bottom: 16, left: 0, right: 16),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 160,
                              margin: const EdgeInsets.only(left: 50),
                              decoration: BoxDecoration(
                                color: const Color(0xFF333366),
                                borderRadius: BorderRadius.circular(8),
                                shape: BoxShape.rectangle,
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 10),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data.weathers[index].date ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data.weathers[index]
                                                .description ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        // ignore: lines_longer_than_80_chars
                                        '${snapshot.data.weathers[index].maxTemperature} ℃' ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        // ignore: lines_longer_than_80_chars
                                        '${snapshot.data.weathers[index].minTemperature} ℃' ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        // ignore: lines_longer_than_80_chars
                                        '湿度 ${snapshot.data.weathers[index].humidity} %' ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        // ignore: lines_longer_than_80_chars
                                        'UV指数 ${snapshot.data.weathers[index].uvi}' ??
                                            '-',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 160,
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              alignment: FractionalOffset.centerLeft,
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: snapshot.data.weathers[index].iconUrl ??
                                    '-',
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
