// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/reuselistcard.dart';

class ExpenseTransaction extends StatefulWidget {
  const ExpenseTransaction({
    Key? key,
  }) : super(key: key);

  @override
  State<ExpenseTransaction> createState() => _ExpenseTransactionState();
}

class _ExpenseTransactionState extends State<ExpenseTransaction>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUi();
    return ValueListenableBuilder(
        valueListenable:
            TransactionDB.instance.expenceTransactionListNotifierNew,
        builder: (BuildContext context,
            List<TransactionModel> expenseTransactionList, Widget? _) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ListView.builder(
                itemBuilder: (BuildContext ctx, int index) {
                  final data = expenseTransactionList[index];

                  return ReuseCard(
                    data: data,
                    index: index,
                  );
                },
                itemCount: expenseTransactionList.length),
          );
        });
  }
}
