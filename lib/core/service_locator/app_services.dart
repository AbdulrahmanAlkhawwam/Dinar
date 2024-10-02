import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/helpers/database_helper.dart';

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
