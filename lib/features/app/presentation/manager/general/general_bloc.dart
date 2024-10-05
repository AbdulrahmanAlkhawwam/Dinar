import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../categories/domain/entities/category.dart';
import '../../../../wallets/domain/entities/wallet.dart';

part 'general_event.dart';

part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  GeneralBloc() : super(GeneralInitial());

  late Database database;


  // FutureOr<void> _addCategory(AddCategoryEvent event,
  //     Emitter<GeneralState> emit,) async {
  //   print("i'm here in adding new Category now ...");
  //   emit(LoadingState());
  //   try {
  //     final id = await database.insert(
  //       "categories",
  //       {
  //         "name": event.category.name,
  //         "type": event.category.type,
  //       },
  //     );
  //     print(await database.query(
  //       "categories",
  //       where: "id = ?",
  //       whereArgs: [id],
  //     ));
  //   } catch (e) {
  //     print("#### $e ####");
  //     emit(ErrorState(message: e.toString()));
  //   }
  //   emit(LoadedState());
  // }

  FutureOr<void> _addWallet(AddWalletEvent event,
      Emitter<GeneralState> emit,) async {
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

  FutureOr<void> _checker(CheckEvent event,
      Emitter<GeneralState> emit,) async {
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
