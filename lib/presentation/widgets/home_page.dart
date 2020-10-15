import 'package:flutter/material.dart';
import 'package:f_weather_report/util/disposable.dart';
import 'package:f_weather_report/util/disposable_provider.dart';
import 'package:f_weather_report/bloc/weather_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  String _cityName = '札幌';
  String _telop = '晴れのち曇り';
  String _temperature = '22';
  String _diff_temperature = '22';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DisposableProvider<WeatherBloc>(
        create: (context) => WeatherBloc(),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '$_cityName',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Image.network(
                  'assets/images/jaco_pastorius.jpg',
                  scale: 5,
                ),
                Text(
                  '$_telop',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                RichText(
                  text: TextSpan(
                    text: '$_temperature',
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
                        text: '$_diff_temperature',
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
                      onPressed: () {},
                      elevation: 10.0,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
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
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('札幌の予報'),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      elevation: 10.0,
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
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
                        padding: const EdgeInsets.all(10.0),
                        child: const Text('東京の予報'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton.icon(
                    icon: Icon(
                      Icons.cloud_download,
                      color: Colors.white,
                    ),
                    label: Text('データ取得'),
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton.icon(
                    icon: Icon(
                      Icons.save_alt,
                      color: Colors.white,
                    ),
                    label: Text('DBに保存'),
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton.icon(
                    icon: Icon(
                      Icons.library_books,
                      color: Colors.white,
                    ),
                    label: Text('DBから読み込み'),
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
