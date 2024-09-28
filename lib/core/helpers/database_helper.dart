import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import '../constants/strings.dart';

abstract class DatabaseHelper {
  Future<List<Map<String, dynamic>>> getData(
    String table, {
    String? where,
    List? args,
    String? orderBy,
  });

  Future<int> insert(String table, Map<String, dynamic> data);

  Future<int> update(String table, Map<String, Object?> values,
      {String? where, List? args});

  Future<int> delete(String table, {String? where, List? args});

  Future<void> close();
}

class DatabaseHelperImpl implements DatabaseHelper {
  late final Database _db;

  DatabaseHelperImpl._(this._db);

  static Future<DatabaseHelperImpl> instance() async {
    final dbPath = await getDatabasesPath();
    final database = await openDatabase(
      path.join(dbPath, databaseFile),
      version: 1,
      onCreate: onCreate,
    );
    return DatabaseHelperImpl._(database);
  }

  @override
  Future<List<Map<String, dynamic>>> getData(
    String table, {
    String? where,
    List? args,
    String? orderBy,
  }) async {
    return _db.query(table, where: where, whereArgs: args, orderBy: orderBy);
  }

  @override
  Future<int> insert(String table, Map<String, dynamic> data) async {
    return _db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> update(String table, Map<String, Object?> values,
      {String? where, List? args}) async {
    return _db.update(table, values, where: where, whereArgs: args);
  }

  @override
  Future<int> delete(String table, {String? where, List? args}) async {
    return _db.delete(
      table,
      where: where,
      whereArgs: args,
    );
  }

  @override
  Future<void> close() async {
    await _db.close();
  }

  static FutureOr<void> onCreate(Database db, int version) async {
    await db.execute(
      """CREATE TABLE $categoriesTable(
      id                INTEGER PRIMARY KEY AUTOINCREMENT     NOT NULL,
      name              TEXT                                  NOT NULL,
      type              TEXT                                  NOT NULL
      -- type like ( income / payment )
    )""",
    );
    await db.execute(
      """CREATE TABLE $walletsTable(
      id                INTEGER PRIMARY KEY AUTOINCREMENT     NOT NULL,
      name              TEXT                                  NOT NULL
    )""",
    );
    await db.execute(
      """CREATE TABLE $operationsTable(
    id INTEGER PRIMARY KEY AUTOINCREMENT                    NOT NULL,
            name              TEXT                                  NOT NULL,
            value             DOUBLE                                NOT NULL,
            description       TEXT                                  ,
            category_id       INTEGER                               NOT NULL,
            wallet_id         INTEGER                               NOT NULL,
            date              TEXT                                  NOT NULL,
            -- date like ( 2024-05-10 PM 10:45 000Z ) 
            type              TEXT                                  NOT NULL,
            -- type like ( income / payment )
            FOREIGN KEY (wallet_id) REFERENCES wallets (id),
            FOREIGN KEY (category_id) REFERENCES categories (id) 
          )""",
    );
  }
}
