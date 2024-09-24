import 'dart:async';

import 'package:Dinar/src/features/categories/domain/entities/category.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

// import '../../../../app/models/kind.dart';
import '../../../../wallets/domain/entities/wallet.dart';

part 'general_event.dart';

part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(GeneralInitial()) {
    on<InitialisationEvent>(_initialisationApp);
    // on<AddCategoryEvent>(_addCategory);
    // on<AddWalletEvent>(_addWallet);
    // on<CheckEvent>(_checker);
  }

  late Database database;
  // Kind kind = Kind.non;

  Future<void> _initialisationApp(
    InitialisationEvent event,
    Emitter<GeneralState> emit,
  ) async {
    print("i'm here in create Database now ...");
    emit(LoadingState());
    var databasesPath = await getDatabasesPath();
    try {
      database = await openDatabase(
        '${databasesPath}main.db',
        onCreate: (db, version) async {
          /// Categories ...
          await db.execute(
            """CREATE TABLE categories (
            id                INTEGER PRIMARY KEY AUTOINCREMENT     NOT NULL,
            name              TEXT                                  NOT NULL,
            type              TEXT                                  NOT NULL
            -- type like ( income / payment )
          )""",
          );

          /// Wallets ...
          await db.execute(
            """CREATE TABLE wallets (
            id                INTEGER PRIMARY KEY AUTOINCREMENT     NOT NULL,
            name              TEXT                                  NOT NULL
          )""",
          );

          /// Operations ( Payments & Incomes ) ...
          await db.execute(
            """CREATE TABLE operations (
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
        },
        version: 1,
      );
    } catch (e) {
      print("#### $e ####");
      emit(ErrorState(message: e.toString()));
    }
    emit(LoadedState());
  }

  FutureOr<void> _addCategory(
    AddCategoryEvent event,
    Emitter<GeneralState> emit,
  ) async {
    print("i'm here in adding new Category now ...");
    emit(LoadingState());
    try {
      final id = await database.insert(
        "categories",
        {
          "name": event.category.name,
          "type": event.category.type,
        },
      );
      print(await database.query(
        "categories",
        where: "id = ?",
        whereArgs: [id],
      ));
    } catch (e) {
      print("#### $e ####");
      emit(ErrorState(message: e.toString()));
    }
    emit(LoadedState());
  }

  FutureOr<void> _addWallet(
    AddWalletEvent event,
    Emitter<GeneralState> emit,
  ) async {
    print("i'm here in adding new wallet now ...");
    emit(LoadingState());
    try {
      final id = await database.insert(
        "wallets",
        {
          "name": event.wallet.name,
        },
      );
      print(await database.query(
        "wallets",
        where: "id = ?",
        whereArgs: [id],
      ));
    } catch (e) {
      print("#### $e ####");
      emit(ErrorState(message: e.toString()));
    }
    emit(LoadedState());
  }

  FutureOr<void> _checker(
    CheckEvent event,
    Emitter<GeneralState> emit,
  ) async {
    print("i'm here in checker now ...");
    emit(LoadingState());
    try {
      final categories = await database.query("categories");
      // kind = categories.isEmpty ? Kind.category : kind;

      final wallets = await database.query("wallets");
      // kind = wallets.isEmpty
      //     ? kind == Kind.category
      //         ? Kind.twice
      //         : Kind.wallet
      //     : kind;
    } catch (e) {
      print("#### $e ####");
      emit(ErrorState(message: e.toString()));
    }
    emit(ReloadedState());
  }
}
