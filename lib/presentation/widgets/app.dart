import 'package:f_weather_report/presentation/widgets/daily_weather_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/dailyWeather': (context) => const DailyWeatherPage(),
      },
    );
  }
}
