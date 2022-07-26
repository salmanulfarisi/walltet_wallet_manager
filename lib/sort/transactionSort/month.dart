import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/global_things/text.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/show_popup_delete.dart';
import 'package:walletx/screens/homepage/transaction/updatescreen.dart';

class MonthlyAll extends StatefulWidget {
  const MonthlyAll({
    Key? key,
  }) : super(key: key);

  @override
  State<MonthlyAll> createState() => _MonthlyAllState();
}

class _MonthlyAllState extends State<MonthlyAll> {
  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUi();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifierNew,
        builder: (BuildContext context, List<TransactionModel> transactionList,
            Widget? _) {
          return ListView.builder(
              itemBuilder: (BuildContext ctx, int index) {
                final data = transactionList[index];

                return data.selectedDate.isAfter(
                        DateTime.now().subtract(const Duration(days: 30)))
                    ? Card(
                        color: Colors.white30,
                        child: ListTile(
                          onLongPress: () {
                            showDeleteDialoge(context, id: data.id);
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenUpdate(
                                          data: data,
                                          index: index,
                                        )));
                          },
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
                            textFontWeight: FontWeight.bold,
                          ),
                          subtitle: TextWidgets(
                            text: DateFormat.MMMMd().format(data.selectedDate),
                            textcolor: primaryTextColor,
                          ),
                          trailing: Column(
                            children: [
                              TextWidgets(
                                text: data.amount.toString(),
                                textcolor: data.incomeOrExpense == 'Income'
                                    ? incomeColor
                                    : expenseColor,
                                textFontWeight: FontWeight.bold,
                                textsize: 20,
                              ),
                              TextWidgets(
                                text: data.note,
                                textcolor: primaryTextColor,
                                textsize: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox();
              },
              itemCount: transactionList.length);
        });
  }
}
