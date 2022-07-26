import 'package:flutter/material.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/Transaction/all_transaction/alltransactions.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/expensetransactions.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/incometransaction.dart';
import 'package:walletx/screens/homepage/transaction/searchscreen.dart';

class ScreenTransactionTab extends StatelessWidget {
  const ScreenTransactionTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUi();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              color: primaryIconColor,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'All Transactions',
              style: TextStyle(color: primaryTextColor),
            ),
            actions: [
              IconButton(
                  color: primaryIconColor,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ScreenSearch()));
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ValueListenableBuilder(
                valueListenable:
                    TransactionDB.instance.transactionListNotifierNew,
                builder: (BuildContext context,
                    List<TransactionModel> transactionList, Widget? _) {
                  return Column(
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(25.0)),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            Tab(
                              text: 'All ',
                            ),
                            Tab(
                              text: 'Income',
                            ),
                            Tab(
                              text: 'Expense',
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                          child: TabBarView(
                        children: [
                          AllTransactions(),
                          IncomeTransaction(),
                          ExpenseTransaction(),
                        ],
                      ))
                    ],
                  );
                }),
          )),
    );
  }
}
