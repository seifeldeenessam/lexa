import 'dart:async';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  // Checking if the database is existed or not
  Future<Database> get databaseStart async {
    Database? database;

    if (database != null) {
      return database;
    } else {
      database = await _initDatabase();
      return database;
    }
  }

  // Opening database
  Future<Database> _initDatabase() async {
    String directory = await getDatabasesPath();

    // await deleteDatabase('$directory/lexa.db');

    return await openDatabase('$directory/lexa.db', version: 1, onCreate: _onCreate);
  }

  // This function fires when opening database
  Future _onCreate(Database database, int version) async {
    // Creating [accounts] table
    await database.execute('''
      CREATE TABLE IF NOT EXISTS accounts (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT UNIQUE NOT NULL,
      value REAL NOT NULL,
      currency TEXT NOT NULL
    )''');

    // Creating [cards] table
    await database.execute('''
      CREATE TABLE IF NOT EXISTS cards (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      image TEXT NOT NULL,
      title TEXT NOT NULL,
      isFavorite INTEGER NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )''');

    // Creating [transactions] table
    await database.execute('''
      CREATE TABLE IF NOT EXISTS transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      type TEXT NOT NULL,
      title TEXT NOT NULL,
      price REAL NOT NULL,
      note TEXT NULL,
      category TEXT NOT NULL,
      currentBalance REAL NULL,
      occurrenceDate TEXT NOT NULL,
      expiryDate TEXT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL,
      billingAccount TEXT NOT NULL,
      FOREIGN KEY(billingAccount) REFERENCES accounts(title)
    )''');

    // Creating [whishlist] table
    await database.execute('''
      CREATE TABLE IF NOT EXISTS wishlist (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT NOT NULL,
      price REAL NULL,
      note TEXT NULL,
      link TEXT NULL,
      isImportant INTEGER NOT NULL,
      isChecked INTEGER NOT NULL,
      createdAt TEXT NOT NULL,
      updatedAt TEXT NOT NULL
    )''');
  }

  // Inserting data into database
  Future<int> create(String table, Map<String, Object?> json) async {
    Database database = await databaseStart;
    return await database.insert(table, json);
  }

  // Inserting data into [accounts] table
  Future<int> insertAccountsValues(Map<String, Object?> json) async {
    Database database = await databaseStart;
    return await database.rawInsert(
      "INSERT OR IGNORE INTO accounts VALUES (1, 'Cash', ?, ?), (2, 'Banks', ?, ?), (3, 'Savings', ?, ?);",
      [json["cash"], json["cashCurrency"], json["banks"], json["banksCurrency"], json["savings"], json["savingsCurrency"]],
    );
  }

  // Getting data from database
  Future<List<Map<String, dynamic>>> read(String table) async {
    Database database = await databaseStart;

    // List<CardModel> _cards = [];
    // final _streamController = StreamController<List<CardModel>>.broadcast();

    // _cards = await _getAllCards();
    // _streamController.add(_cards);

    // Stream<List<CardModel>> cards() => _streamController.stream;

    return await database.query(table);
  }

  // Updating data in database
  Future<int> update(String table, Map<String, dynamic> json) async {
    Database database = await databaseStart;
    int id = json["id"];
    return await database.update(table, json, where: 'id = ?', whereArgs: [id]);
  }

  // Deleting data from database
  Future<int> delete(String table, int id) async {
    Database database = await databaseStart;
    return await database.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  // Closing database
  Future close() async {
    Database database = await databaseStart;
    database.close();
  }
}
