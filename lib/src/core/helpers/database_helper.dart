// import 'dart:async';
// import 'dart:convert';
//
// import 'package:collection/collection.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as path;
// import 'package:sqflite/sqflite.dart';
//
// import '../constants/saleem_icons.dart';
// import '../constants/strings.dart';
//
// // import '../localization/keys.g.dart';
// import 'notifications_helper.dart';
//
// abstract class DatabaseHelper {
//   Future<List<Map<String, dynamic>>> getData(
//     String table, {
//     String? where,
//     List? args,
//     String? orderBy,
//   });
//
//   Future<int> insert(String table, Map<String, dynamic> data);
//
//   Future<int> update(String table, Map<String, Object?> values,
//       {String? where, List? args});
//
//   Future<int> delete(String table, {String? where, List? args});
//
//   Future<void> close();
//
//   Future<Map<String, dynamic>> generateBackup();
// }
//
// class DatabaseHelperImpl implements DatabaseHelper {
//   late Database _db;
//
//   DatabaseHelperImpl._(this._db);
//
//   static Future<DatabaseHelperImpl> instance() async {
//     final dbPath = await getDatabasesPath();
//     final database = await openDatabase(
//       path.join(dbPath, habitsDatabaseFile),
//       version: 5,
//       onCreate: onCreate,
//       onUpgrade: onUpgrade,
//     );
//     return DatabaseHelperImpl._(database);
//   }
//
//   @override
//   Future<List<Map<String, dynamic>>> getData(
//     String table, {
//     String? where,
//     List? args,
//     String? orderBy,
//   }) async {
//     return _db.query(table, where: where, whereArgs: args, orderBy: orderBy);
//   }
//
//   @override
//   Future<int> insert(String table, Map<String, dynamic> data) async {
//     return _db.insert(
//       table,
//       data,
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   @override
//   Future<int> update(String table, Map<String, Object?> values,
//       {String? where, List? args}) async {
//     return _db.update(table, values, where: where, whereArgs: args);
//   }
//
//   @override
//   Future<int> delete(String table, {String? where, List? args}) async {
//     return _db.delete(
//       table,
//       where: where,
//       whereArgs: args,
//     );
//   }
//
//   Future<void> close() async {
//     await _db.close();
//   }
//
//   static FutureOr<void> onCreate(Database db, int version) async {
//     await db.execute(
//         "CREATE TABLE $habitsTable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, goal INTEGER, amount INTEGER, icon TEXT, period_id INTEGER, interval TEXT, category_id INTEGER, start_date TEXT, notes TEXT, notification TEXT, unit TEXT)");
//     await db.execute(
//         "CREATE TABLE $doneHabitsTable(id INTEGER PRIMARY KEY AUTOINCREMENT, habit_id INTEGER, date INTEGER, amount INTEGER)");
//     await db.execute(
//         "CREATE TABLE $periodsTable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, start TEXT, `end` TEXT, `order` INTEGER, background_image TEXT)");
//     await db.execute(
//         "CREATE TABLE $categoriesTable(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, color INTEGER, `order` INTEGER)");
//   }
//
//   static FutureOr<void> onUpgrade(Database db, int v1, int v2) async {
//     if (v1 == 1) {
//       await db.execute(
//         "ALTER TABLE $habitsTable ADD COLUMN notification TEXT",
//       );
//       await migrateNotifications(db);
//     }
//
//     if (v1 == 2) {
//       await db.execute(
//         "ALTER TABLE $habitsTable ADD COLUMN unit TEXT DEFAULT '${LocaleKeys.edit_time.tr()}'",
//       );
//       await db.execute(
//         "ALTER TABLE $doneHabitsTable ADD COLUMN amount INTEGER DEFAULT 1",
//       );
//       await _mergeDoneHabits(db);
//     }
//
//     if (v1 == 3) {
//       await db.execute(
//           "ALTER TABLE $habitsTable RENAME COLUMN period TO period_id");
//       await db.execute(
//           "ALTER TABLE $habitsTable RENAME COLUMN category TO category_id");
//       await db
//           .execute("ALTER TABLE $habitsTable RENAME COLUMN comments TO notes");
//
//       await db.execute(
//         "CREATE TABLE ${periodsTable}_temp(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, start TEXT, `end` TEXT, `order` INTEGER, background_image TEXT)",
//       );
//       await db.execute(
//         "INSERT INTO ${periodsTable}_temp SELECT id, name, start, `end`, `order`, background_image FROM $periodsTable",
//       );
//       await db.execute("DROP TABLE $periodsTable");
//       await db
//           .execute("ALTER TABLE ${periodsTable}_temp RENAME TO $periodsTable");
//
//       await db.execute(
//         "CREATE TABLE ${categoriesTable}_temp(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, color INTEGER, `order` INTEGER)",
//       );
//       await db.execute(
//         "INSERT INTO ${categoriesTable}_temp SELECT id, name, color, `order` FROM $categoriesTable",
//       );
//       await db.execute("DROP TABLE $categoriesTable");
//       await db.execute(
//           "ALTER TABLE ${categoriesTable}_temp RENAME TO $categoriesTable");
//     }
//
//     await db.update(habitsTable, {"period_id": null},
//         where: "period_id = ?", whereArgs: [1]);
//     await db.delete(periodsTable, where: "id = ?", whereArgs: [1]);
//   }
//
//   // merge many duplicates records with sum of amount and delete the rest
//   static Future<int> _mergeDoneHabits(Database db) async {
//     final duplicates = await db.rawQuery(
//       "SELECT habit_id, date, SUM(amount) AS amount FROM $doneHabitsTable GROUP BY habit_id, date HAVING COUNT(*) > 1",
//     );
//     for (final duplicate in duplicates) {
//       await db.rawUpdate(
//         "UPDATE $doneHabitsTable SET amount = ? WHERE habit_id = ? AND date = ?",
//         [duplicate['amount'], duplicate['habit_id'], duplicate['date']],
//       );
//     }
//     return db.delete(
//       doneHabitsTable,
//       where:
//           "id NOT IN (SELECT min(id) FROM $doneHabitsTable GROUP BY habit_id, date)",
//     );
//   }
//
//   @override
//   Future<Map<String, dynamic>> generateBackup() async {
//     final habits = await _db.query(habitsTable);
//     final done = await _db.query(doneHabitsTable);
//     final periods = await _db.query(periodsTable);
//     final categories = await _db.query(categoriesTable);
//
//     return {
//       "habits": habits.map((e) {
//         final copy = Map.of(e)
//           ..remove("goal")
//           ..remove("start_date")
//           ..remove("interval")
//           ..remove("notes")
//           ..remove("icon");
//         copy["consecutive"] =
//             (e["goal"] is int) ? (e["goal"] as int).isNegative : false;
//         copy["goal"] = (e["goal"] is int) ? (e["goal"] as int).abs() : 0;
//         final d = DateTime.parse(e["start_date"] as String);
//         copy["start_date"] =
//             DateTime.utc(d.year, d.month, d.day).toIso8601String();
//         copy["icon"] = icons.entries
//             .firstWhereOrNull((i) => i.value.codePoint.toString() == e["icon"])
//             ?.key;
//         copy["interval"] = _decodeIntervalToType(e["interval"]);
//         copy["days"] = _decodeIntervalToDays(e["interval"]);
//         return copy;
//       }).toList(),
//       "doneHabits": done.map((e) {
//         final copy = Map.of(e)..remove("date");
//         copy["date"] =
//             DateTime.fromMillisecondsSinceEpoch(e["date"] as int, isUtc: true)
//                 .toIso8601String();
//         return copy;
//       }).toList(),
//       "notes": _decodeNotesFromHabits(habits),
//       "periods": periods,
//       "categories": categories.map((e) {
//         final copy = Map.of(e)..remove("color");
//         copy["color"] = e["color"]?.toString();
//         return copy;
//       }).toList(),
//     };
//   }
//
//   String _decodeIntervalToType(interval) {
//     return switch (interval[0]) {
//       "A" => "ANY",
//       "D" => "DAILY",
//       "W" => "WEEKLY",
//       "M" => "MONTHLY",
//       _ => "DAILY",
//     };
//   }
//
//   List<String> _decodeIntervalToDays(interval) {
//     return switch (interval[0]) {
//       "D" => () {
//           final list = <String>[];
//           String i = (interval as String).substring(1);
//           for (final c in i.characters) {
//             list.add(switch (c) {
//               "0" => "MONDAY",
//               "1" => "TUESDAY",
//               "2" => "WEDNESDAY",
//               "3" => "THURSDAY",
//               "4" => "FRIDAY",
//               "5" => "SATURDAY",
//               "6" => "SUNDAY",
//               _ => "",
//             });
//           }
//           if (list.isEmpty) {
//             list.addAll([
//               "MONDAY",
//               "TUESDAY",
//               "WEDNESDAY",
//               "THURSDAY",
//               "FRIDAY",
//               "SATURDAY",
//               "SUNDAY"
//             ]);
//           }
//           return list;
//         }(),
//       _ => <String>[],
//     };
//   }
//
//   List _decodeNotesFromHabits(habits) {
//     final notes = <Map>[];
//     for (final habit in habits) {
//       final n = jsonDecode(habit["notes"]) as List;
//       for (final nn in n) {
//         final nnn = Map.of(nn)
//           ..remove("reaction")
//           ..remove("date");
//         nnn["habit_id"] = habit["id"];
//         nnn["created_at"] =
//             DateTime.parse(nn["date"]).toUtc().toIso8601String();
//         nnn["reaction"] =
//             nn["reaction"] == null ? null : reactions[nn["reaction"]];
//         notes.add(nnn);
//       }
//     }
//     return notes;
//   }
// }
