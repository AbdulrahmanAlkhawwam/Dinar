import 'package:Dinar/core/helpers/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeAppServices(GetIt sl, bool firstInit) async {
  if (firstInit) {
    WidgetsFlutterBinding.ensureInitialized();
  }

  final db = await DatabaseHelperImpl.instance();
  sl.registerLazySingleton<DatabaseHelper>(
    () => db,
    dispose: (db) => db.close(),
  );
}
