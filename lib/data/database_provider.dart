import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'current_weather_cache.dart';

class DBProvider {
  // privateコンストラクタ
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  // databaseのgetter。nullだったら初期化する。
  Future<Database> get database async => _database ??= await initDB();

  Future<Database> initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'WeatherDB.db');

    // DBのインスタンス作成
    return openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    return db.execute('CREATE TABLE $_tableName ('
        'id TEXT PRIMARY KEY,'
        'cityName TEXT,'
        'iconUrl TEXT,'
        'description TEXT,'
        'temperature TEXT,'
        'diffFromTokyo TEXT'
        ')');
  }

  static const _tableName = 'Weather';

  Future<int> createWeather(CurrentWeatherCache weatherCache) async {
    final db = await database;
    final result = await db.insert(_tableName, weatherCache.toMap());
    return result;
  }

  Future<List<CurrentWeatherCache>> readWeather() async {
    final db = await database;
    final result = await db.query(_tableName);
    final list = result.isEmpty
        ? List<CurrentWeatherCache>.empty()
        : result
            .map((e) => CurrentWeatherCache.fromMap(e as Map<String, String>))
            .toList();
    return list;
  }

  Future<int> updateWeather(CurrentWeatherCache weatherCache) async {
    final db = await database;
    final result = await db.update(
      _tableName,
      weatherCache.toMap(),
      where: 'id = ?',
      whereArgs: [weatherCache.id].toList(),
    );
    return result;
  }

  Future<int> deleteWeather(String id) async {
    final db = await database;
    final result = await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id].toList(),
    );
    return result;
  }
}
