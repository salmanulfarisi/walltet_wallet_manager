// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/reuselistcard.dart';
import 'package:walletx/sort/transactionSort/custom_month.dart';
import 'package:walletx/sort/transactionSort/month.dart';
import 'package:walletx/sort/transactionSort/today.dart';
import 'package:walletx/sort/transactionSort/yesterday.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({
    Key? key,
  }) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

// ValueNotifier<bool> visibleMonth = ValueNotifier(false);
// DateTime selectedMonth = DateTime.now();

class _AllTransactionsState extends State<AllTransactions>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String dropDownVlaue = 'Select Period';

  var items = [
    'All Transaction',
    'Today',
    'Yesterday',
    'Last 30 Days',
    // 'Select Month',
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TransactionDB.instance.refreshUi();
    return ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifierNew,
        builder: (BuildContext context, List<TransactionModel> transactionList,
            Widget? _) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 2,
                      child: DropdownButtonFormField(
                          hint: FittedBox(
                            child: Text(
                              dropDownVlaue,
                              style: const TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: secondColor, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: secondColor, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            fillColor: Colors.white60,
                            filled: true,
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownVlaue = newValue!;
                            });
                          }),
                    ),
                    TextButton.icon(
                        onPressed: () {
                          selectMonth(context: context);
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: primaryIconColor,
                        ),
                        label: const Text(
                          'Select Month',
                          style: TextStyle(color: primaryTextColor),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: dropDownVlaue == 'Select Period' ||
                            dropDownVlaue == 'All Transaction'
                        ? ListView.builder(
                            itemBuilder: (BuildContext ctx, int index) {
                              final data = transactionList[index];
                              return ReuseCard(
                                data: data,
                                index: index,
                              );
                            },
                            itemCount: transactionList.length)
                        : dropDownVlaue == 'Today'
                            ? todayAll(context)
                            : dropDownVlaue == 'Yesterday'
                                ? const YesterdayAll()
                                : dropDownVlaue == 'Last 30 Days'
                                    ? const MonthlyAll()
                                    : const SizedBox()),
              ],
            ),
          );
        });
  }

  Future<void> selectMonth(
      {required BuildContext context, String? locale}) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
        locale: localeObj);
    if (selected == null) {
      return;
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CustomMonth(
            month: selected,
          ),
        ),
      );
    }
  }
}
