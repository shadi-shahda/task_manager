import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "my_database.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onOpen: _onOpen,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE my_table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        is_active INTEGER NOT NULL
      )
    ''');
  }

  Future<void> _onOpen(Database db) async {
    // Insert the initial row with a specific ID if it doesn't already exist
    final result = await db.query(
      'my_table',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [255],
    );

    if (result.isEmpty) {
      await db.insert(
        'my_table',
        {
          'id': 255,
          'name': 'Initial',
          'is_active': 1,
        },
      );
    }
  }
}
