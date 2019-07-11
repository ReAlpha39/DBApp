import 'package:coffee_journey/models/data.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String dataTable = 'data_table';
	String colId = 'id';
	String coljudul = 'judul';
	String coljournal = 'journal';
	String colrating = 'rating';
	String coltanggal = 'tanggal';

	DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); 
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

	Future<Database> initializeDatabase() async {
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'notes.db';

		// Open/create the database
		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return notesDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $dataTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $coljudul TEXT, '
				'$coljournal TEXT, $colrating INTEGER, $coltanggal TEXT)');
	}

	// Fetch Operation
	Future<List<Map<String, dynamic>>> getDataMapList() async {
		Database db = await this.database;

		var result = await db.query(dataTable);//, orderBy: '$colrating ASC');
		return result;
	}

	// Insert Operation
	Future<int> insertData(Data note) async {
		Database db = await this.database;
		var result = await db.insert(dataTable, note.toMap());
		return result;
	}
	// Number object
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $dataTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	Future<List<Data>> getdataList() async {

		var noteMapList = await getDataMapList();
		int count = noteMapList.length;

		List<Data> dataList = List<Data>();
		for (int i = 0; i < count; i++) {
			dataList.add(Data.fromMapObject(noteMapList[i]));
		}

		return dataList;
	}

}