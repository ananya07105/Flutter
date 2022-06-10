import 'package:flutter/cupertino.dart';
import 'package:myapp/main.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../Contacts.dart';
class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE Contacts(name TEXT, phone TEXT, area TEXT, address TEXT, city TEXT, state TEXT, zip INTEGER, email TEXT, dob TEXT)"
        );
      },
      version: 1,
    );
  }

  Future<int?> createItem(Contacts contacts) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert(
        'Contacts', contacts.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

  }
  Future<List<Contacts>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
    await db.query('Contacts', orderBy: "Name");
    return queryResult.map((e) => Contacts.fromMap(e)).toList();
}
  // Delete an note by id
  Future<void> deleteItem(String name) async {
    final db = await initializeDB();
    try {
      await db.delete("Contacts", where: "name = ?", whereArgs: [name]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
