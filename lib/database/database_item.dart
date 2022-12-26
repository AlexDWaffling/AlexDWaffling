import 'package:flutter_pos_app/models/item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../constants/constant_app.dart';

class DatabaseHelper {
  static final _databaseName = "items.db";
  static final _databaseVersion = 3;

  static final items_table = "item";

  static final ItemsID = ProductItem.ID;
  static final ItemName = ProductItem.NAME;
  static final ItemImage = ProductItem.IMAGE;
  static final ItemQuantity = ProductItem.QUANTITY;
  static final ItemPrice = ProductItem.PRICE;
  static final ItemCategory = ProductItem.CATEGORY;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $items_table (
            $ItemsID INTEGER PRIMARY KEY AUTOINCREMENT,
            $ItemName TEXT NOT NULL,
            $ItemImage TEXT NOT NULL,
            $ItemQuantity INTEGER NOT NULL,
            $ItemPrice DOUBLE NOT NULL,
            $ItemCategory TEXT NOT NULL,
          )
          ''');
  }

  Future<int> insert(ProductItem productItem) async {
    Database db = await instance.database;
    var res = await db.insert(items_table, productItem.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(items_table, orderBy: "$ItemsID DESC");
    return res;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(items_table, where: '$ItemsID = ?', whereArgs: [id]);
  }

  Future<void> clearTable() async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE FROM $items_table");
  }
}
