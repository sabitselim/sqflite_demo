import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_demo/models/product.dart';

class DbHelper {
 static Database? _db;

    Future<Database> get db async =>
    _db ??= await initializeDb();


  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "etrade.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return eTradeDb;
  }

  Future<void> createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, description TEXT, unitPrice INTEGER)',
    );
  }

 //static Future<List<Map<String, dynamic>>> getItems() async {
 /*Future<List<Map<String, Object?>>> getProducts() async {
    Database db = await this.db;
    var result = await db.query("products");
    return result;
  }*/

 Future<List> getProducts() async {
   final db = await this.db;
   final List<Map<String, dynamic>> result = await db.query("products");
   return List<Map<String, dynamic>>.generate(
       result.length, (index) => Map<String, dynamic>.from(result[index]),
       growable: true
   );
 }




 Future<int> insert(Product product) async {
    Database db = await this.db;
    var result = await db.insert("products", product.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    print("result insert $result");
    return result;

  }
}
