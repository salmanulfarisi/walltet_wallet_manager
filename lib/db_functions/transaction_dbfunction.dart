// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletx/models/transaction_model.dart';

// ignore: constant_identifier_names
const TRANSACTION_DBFUNCTION_NAME = "transaction_db";

abstract class Transaction {
  Future<void> addTransaction(TransactionModel value);
  Future<List<TransactionModel>> getAllTransactions();
  Future<void> deleteTransaction(String id);
  Future<void> resetApp();
}

class TransactionDB implements Transaction {
  TransactionDB._internal();

  static final TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() => instance;

  ValueNotifier<List<TransactionModel>> transactionListNotifierNew =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> incomeTransactionListNotifierNew =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> expenceTransactionListNotifierNew =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> todayTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> yesterdayTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> monthlyTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> todayIncomeTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> yesterdayIncomeTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> monthlyIncomeTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> todayExpenseTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> yesterdayExpenseTransactionList =
      ValueNotifier([]);
  ValueNotifier<List<TransactionModel>> monthlyExpenseTransactionList =
      ValueNotifier([]);

  ValueNotifier<double> totalBalance = ValueNotifier(0.0);
  ValueNotifier<double> incomeBalance = ValueNotifier(0.0);
  ValueNotifier<double> expenseBalance = ValueNotifier(0.0);
  @override
  Future<void> addTransaction(TransactionModel value) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DBFUNCTION_NAME);
    await transactionDB.put(value.id, value);
    transactionListNotifierNew.value.add(value);
    refreshUi();
  }

  // ignore: duplicate_ignore
  Future<void> refreshUi() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _list = await getAllTransactions();
    _list.sort((a, b) => b.selectedDate.compareTo(a.selectedDate));
    incomeTransactionListNotifierNew.value.clear();
    expenceTransactionListNotifierNew.value.clear();
    transactionListNotifierNew.value.clear();
    transactionListNotifierNew.value.addAll(_list);
    todayTransactionList.value.clear();
    yesterdayTransactionList.value.clear();
    monthlyTransactionList.value.clear();
    todayIncomeTransactionList.value.clear();
    yesterdayIncomeTransactionList.value.clear();
    monthlyIncomeTransactionList.value.clear();
    todayExpenseTransactionList.value.clear();
    yesterdayExpenseTransactionList.value.clear();
    monthlyExpenseTransactionList.value.clear();
    // ignore: invalid_use_of_visible_for_testing_member
    transactionListNotifierNew.notifyListeners();
    totalBalance.value = 0;
    incomeBalance.value = 0;
    expenseBalance.value = 0;

    String todayDate = DateFormat.yMd().format(DateTime.now());

    await Future.forEach(_list, (TransactionModel data) {
      if (data.incomeOrExpense == 'Income') {
        incomeTransactionListNotifierNew.value.add(data);
      } else {
        expenceTransactionListNotifierNew.value.add(data);
      }

      if (data.incomeOrExpense == 'Income') {
        incomeBalance.value = incomeBalance.value + data.amount;
      } else {
        expenseBalance.value = expenseBalance.value + data.amount;
      }
      totalBalance.value = incomeBalance.value - expenseBalance.value;

      String databaseDate = DateFormat.yMd().format(data.selectedDate);
      if (databaseDate == todayDate) {
        todayTransactionList.value.add(data);
      }
      if (databaseDate ==
          DateFormat.yMd()
              .format(DateTime.now().subtract(const Duration(days: 1)))) {
        yesterdayTransactionList.value.add(data);
      }
      if (data.selectedDate.isAfter(DateTime.now().subtract(
        const Duration(days: 31),
      ))) {
        monthlyTransactionList.value.add(data);
      }

      if (data.incomeOrExpense == 'Income') {
        if (databaseDate == todayDate) {
          todayIncomeTransactionList.value.add(data);
        }
        if (databaseDate ==
            DateFormat.yMd()
                .format(DateTime.now().subtract(const Duration(days: 1)))) {
          yesterdayIncomeTransactionList.value.add(data);
        }
        if (data.selectedDate.isAfter(DateTime.now().subtract(
          const Duration(days: 31),
        ))) {
          monthlyIncomeTransactionList.value.add(data);
        }
      }
      if (data.incomeOrExpense == 'Expense') {
        if (databaseDate == todayDate) {
          todayExpenseTransactionList.value.add(data);
        }
        if (databaseDate ==
            DateFormat.yMd()
                .format(DateTime.now().subtract(const Duration(days: 1)))) {
          yesterdayExpenseTransactionList.value.add(data);
        }
        if (data.selectedDate.isAfter(DateTime.now().subtract(
          const Duration(days: 31),
        ))) {
          monthlyExpenseTransactionList.value.add(data);
        }
      }
    });

    incomeTransactionListNotifierNew.notifyListeners();
    expenceTransactionListNotifierNew.notifyListeners();
    totalBalance.notifyListeners();
    incomeBalance.notifyListeners();
    expenseBalance.notifyListeners();
    todayTransactionList.notifyListeners();
    yesterdayTransactionList.notifyListeners();
    monthlyTransactionList.notifyListeners();
    todayIncomeTransactionList.notifyListeners();
    yesterdayIncomeTransactionList.notifyListeners();
    monthlyIncomeTransactionList.notifyListeners();
    todayExpenseTransactionList.notifyListeners();
    yesterdayExpenseTransactionList.notifyListeners();
    monthlyExpenseTransactionList.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> getAllTransactions() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DBFUNCTION_NAME);
    return transactionDB.values.toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DBFUNCTION_NAME);
    await transactionDB.delete(id);

    refreshUi();
  }

  @override
  Future<void> resetApp() async {
    final transactionDB =
        await Hive.openBox<TransactionModel>(TRANSACTION_DBFUNCTION_NAME);
    transactionDB.clear();
    final sharedpref = await SharedPreferences.getInstance();
    sharedpref.clear();
  }
}
