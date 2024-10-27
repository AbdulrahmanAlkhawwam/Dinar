import 'dart:convert';

import 'package:Dinar/core/errors/exceptions.dart';
import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:sqflite/sqflite.dart';

import '../models/wallet_model.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/helpers/database_helper.dart';

abstract class WalletsLocalDataSource {
  Future<List<WalletModel>> loadWallets();

  Future<int> addWallet(WalletModel walletModel);

  Future<void> deleteWallet(String id);
}

class WalletsLocalDataSourceImpl extends WalletsLocalDataSource {
  final DatabaseHelper db;

  WalletsLocalDataSourceImpl({required this.db});

  @override
  Future<List<WalletModel>> loadWallets() async {
    final walletsMap = await db.getData(
      walletsTable,
    );
    final wallets =
        walletsMap.map((wallet) => WalletModel.fromMap(wallet)).toList();
    for (var w in wallets) {
      w.incomesTotal = await walletIncomes(w.id!);
      w.paymentsTotal = await walletPayments(w.id!);
    }
    return wallets;
  }

  @override
  Future<int> addWallet(WalletModel walletModel) async {
    final id = await db.insert(
      walletsTable,
      walletModel.toMap(),
    );
    return id;
  }

  @override
  Future<void> deleteWallet(String id) async {
    final walletOperation =
        await db.getData(operationsTable, where: "wallet_id = ?", args: [id]);
    if (walletOperation.isEmpty) {
      await db.delete(
        walletsTable,
        where: "id = ?",
        args: [id],
      );
    } else {
      throw DeleteException("you can't delete this wallet !");
    }
  }

  Future<double> walletIncomes(String id) async {
    final incomesResult = await db.sum(
      "value",
      operationsTable,
      where: "wallet_id = ? AND type = ?",
      args: [id, OperationType.income.name],
    );
    final incomes = (incomesResult.isNotEmpty
            ? incomesResult.first["SUM(value)"] as double?
            : 0.0) ??
        0.0;
    return incomes;
  }

  Future<double> walletPayments(String id) async {
    final paymentsResult = await db.sum(
      "value",
      operationsTable,
      where: "wallet_id = ? AND type = ?",
      args: [id, OperationType.payment.name],
    );
    final payments = (paymentsResult.isNotEmpty
            ? paymentsResult.first["SUM(value)"] as double?
            : 0.0) ??
        0.0;

    return payments;
  }
}
