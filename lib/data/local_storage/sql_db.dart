import 'dart:async';

import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get fetchDataBase async {
    _db ??= await initialDb();
    return _db;
  }

  initialDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'database.db');
    Database myDb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgrade,
    );
    return myDb;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "$insertedTodosDataBaseTableName"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
      "todo" TEXT NOT NULL ,
      "completed" INTEGER NO NULL,
      "userId" INTEGER NOT NULL 
    )
    ''');

    await db.execute('''
    CREATE TABLE "$deletedTodosDataBaseTableName"(
      "id" INTEGER NOT NULL PRIMARY KEY, 
      "todo" TEXT NOT NULL ,
      "completed" INTEGER NO NULL,
      "userId" INTEGER NOT NULL 
    )
    ''');
  }

  FutureOr<void> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {}

  readData(String sql) async {
    Database? myDb = await fetchDataBase;
    List<Map<String, Object?>> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? myDb = await fetchDataBase;
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? myDb = await fetchDataBase;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? myDb = await fetchDataBase;
    int response = await myDb!.rawDelete(sql);
    return response;
  }
}
