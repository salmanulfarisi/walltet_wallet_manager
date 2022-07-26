// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/global_things/text.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/transaction/updatescreen.dart';

ValueNotifier<List<TransactionModel>> searchTransactionListNotifier =
    ValueNotifier([]);

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                searchTransactionListNotifier.value.clear();
              },
              icon: const Icon(Icons.arrow_back)),
          // The search area here
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                onChanged: (String? value) {
                  if (value == null || value.isEmpty) {
                    searchTransactionListNotifier.value.addAll(TransactionDB
                        .instance.transactionListNotifierNew.value);
                    searchTransactionListNotifier.notifyListeners();
                  } else {
                    searchTransactionListNotifier.value.clear();
                    for (TransactionModel item in TransactionDB
                        .instance.transactionListNotifierNew.value) {
                      if (item.categoryName
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        searchTransactionListNotifier.value.add(item);
                      }
                      searchTransactionListNotifier.notifyListeners();
                    }
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        /* Clear the search field */
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: ValueListenableBuilder(
        valueListenable: searchTransactionListNotifier,
        builder: (BuildContext ctx, List<TransactionModel> transactionModel,
            Widget? child) {
          return transactionModel.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) {
                    final data = transactionModel[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: data.incomeOrExpense == 'Income'
                            ? incomeColor
                            : expenseColor,
                        child: Icon(
                          data.incomeOrExpense == 'Income'
                              ? Icons.trending_up
                              : Icons.trending_down,
                        ),
                      ),
                      title: TextWidgets(
                          text: data.categoryName,
                          textcolor: primaryTextColor,
                          textsize: 20,
                          textFontWeight: FontWeight.bold),
                      subtitle: TextWidgets(
                        text: DateFormat.MMMMd().format(data.selectedDate),
                        textcolor: primaryTextColor,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ScreenUpdate(
                              data: data,
                              index: index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return myDivider;
                  },
                  itemCount: searchTransactionListNotifier.value.length,
                )
              : const Center(
                  child: TextWidgets(
                  text: 'Search Here...',
                  textcolor: primaryTextColor,
                  textFontWeight: FontWeight.bold,
                  textsize: 30,
                ));
        },
      ),
    );
  }
}
