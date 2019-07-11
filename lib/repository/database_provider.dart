import 'package:coffee_journey/models/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  Database _database;

  Future<Database> getDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'daftar_journey.db');
    _database = await openDatabase(path, version: 1,
      onCreate: (database, version) async {
        await database.execute(
          'Create TABLE listJourney (id INTEGER PRIMARY KEY, judul TEXT, jurnal TEXT, rating INTEGER, tanggal TEXT, image BLOB)'
        );
      });
      return _database;
  }

  //CRUD

  //insert
  Future<int> insertData(Data data) async {
    var db = await getDB();
    int hasil = await db.insert("listJourney", data.toJson());
    print(hasil);
    return hasil;
  }
  //get
  Future<List<Data>> getData() async {
    var db = await getDB();
    var daftar = await db.query("listJourney", orderBy: "id DESC");
    var hasil = daftar.map((dataDB) => Data.fromJson(dataDB)).toList();
    return hasil;
  }
  //update
  Future<int> updateData(Data data) async {
    var db = await getDB();
    var hasil = await db.update("listJourney", data.toJson(), where: 'id = ?', whereArgs: [data.id]);
    return hasil;
  }
  //delete
  Future<int> deleteData(int id) async {
    var db = await getDB();
    int hasil = await db.delete("listJourney", where: 'id = $id');
    return hasil;
  }

}