class ExtractedDailyWeather {
  ExtractedDailyWeather({
    this.cityName,
    this.weathers,
  });

  String cityName = '-';
  List<ExtractedWeather> weathers = [];
}

class ExtractedWeather {
  ExtractedWeather({
    this.date,
    this.maxTemperature,
    this.minTemperature,
    this.description,
    this.iconUrl,
    this.humidity,
    this.uvi,
  });

  String date = '-';
  String maxTemperature = '-';
  String minTemperature = '-';
  String description = '-';
  String iconUrl = '-';
  String humidity = '-'; // 湿度
  String uvi = '-'; // UV指数
}
