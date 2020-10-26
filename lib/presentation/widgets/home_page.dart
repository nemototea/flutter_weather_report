import 'package:f_weather_report/domain/city_info.dart';
import 'package:f_weather_report/domain/entity/extracted_current_weather.dart';
import 'package:flutter/material.dart';
import 'package:f_weather_report/util/disposable_provider.dart';
import 'package:f_weather_report/bloc/weather_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DisposableProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
        child: _Container(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = DisposableProvider.of<WeatherBloc>(context);
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: StreamBuilder<ExtractedCurrentWeather>(
            initialData: weatherBloc.currentWeather.value,
            stream: weatherBloc.currentWeather,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    snapshot.data.cityName ?? '-',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: snapshot.data.iconUrl ?? '-',
                    imageScale: 5,
                    repeat: ImageRepeat.noRepeat,
                  ),
                  Image.asset(
                    'assets/images/jaco_pastorius.jpg',
                    scale: 5,
                  ),
                  Text(
                    snapshot.data.description ?? '-',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  RichText(
                    text: TextSpan(
                      text: snapshot.data.temperature ?? '-',
                      style: Theme.of(context).textTheme.headline5,
                      children: <TextSpan>[
                        TextSpan(
                          text: '℃',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '東京との気温差',
                      style: Theme.of(context).textTheme.headline5,
                      children: <TextSpan>[
                        TextSpan(
                          text: snapshot.data.diffFromTokyo ?? '-',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextSpan(
                          text: '℃',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          weatherBloc.getDailyWeather.add(CityInfo.sapporoID);
                          // TODO 画面遷移
                        },
                        elevation: 10,
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.green[300],
                                Colors.lightGreen[500],
                                Colors.lightGreen[700],
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text('札幌の予報'),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          weatherBloc.getDailyWeather.add(CityInfo.tokyoID);
                          // TODO 画面遷移
                        },
                        elevation: 10.0,
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Colors.cyan[300],
                                Colors.cyan[500],
                                Colors.cyan[700],
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Text('東京の予報'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton.icon(
                      icon: const Icon(
                        Icons.cloud_download,
                        color: Colors.white,
                      ),
                      label: const Text('データ取得'),
                      onPressed: () {
                        weatherBloc.getCurrentWeather.add(null);
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton.icon(
                      icon: const Icon(
                        Icons.save_alt,
                        color: Colors.white,
                      ),
                      label: const Text('DBに保存'),
                      onPressed: () {
                        // TODO
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton.icon(
                      icon: const Icon(
                        Icons.library_books,
                        color: Colors.white,
                      ),
                      label: const Text('DBから読み込み'),
                      onPressed: () {
                        // TODO
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
