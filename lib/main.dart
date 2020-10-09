import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Report',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: MyHomePage(title: 'Weather Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cityName = '札幌';
  String _telop = '晴れのち曇り';
  String _temperature = '22';
  String _diff_temperature = '22';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 8.0,
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              '$_cityName',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3,
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
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
