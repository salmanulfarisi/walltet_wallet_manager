import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/global_things/text.dart';
import 'package:walletx/main.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/Transaction/alltransactiontab.dart';
import 'package:walletx/screens/homepage/Settings/settings.dart';
import 'package:walletx/screens/homepage/tabbarview.dart';
import 'home_widget/homecard.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

String? name = '';
DateTime timeCheck = DateTime.now();

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    TransactionDB.instance.refreshUi();

    var dividerBox = const SizedBox(
      height: 10,
      width: 10,
    );
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 186, 184, 184),
        title: const TextWidgets(
          text: 'Home',
          textcolor: primaryTextColor,
          textFontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            color: primaryIconColor,
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenSettings(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: TransactionDB.instance.transactionListNotifierNew,
            builder: (BuildContext context,
                List<TransactionModel> transactionList, Widget? _) {
              return Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgets(
                        text: timeControl(),
                        textsize: 20,
                        textcolor: primaryTextColor,
                        textFontWeight: FontWeight.bold,
                      ),
                      TextWidgets(
                        text: '$name',
                        textsize: 30,
                        textcolor: primaryTextColor,
                        textFontWeight: FontWeight.bold,
                      ),
                      dividerBox,
                      SizedBox(
                        // height: height / 3.2,
                        child: HomeCard(
                          cardColor: secondColor,
                          cardElevation: 5,
                          cardShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          cardChild: ValueListenableBuilder(
                              valueListenable: TransactionDB
                                  .instance.transactionListNotifierNew,
                              builder: (BuildContext context,
                                  List<TransactionModel> transactionList,
                                  Widget? _) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const TextWidgets(
                                          text: 'Total Balance',
                                          textcolor: primaryTextColor,
                                          textFontWeight: FontWeight.bold,
                                          textsize: 20),
                                      ValueListenableBuilder(
                                          valueListenable: TransactionDB
                                              .instance.totalBalance,
                                          builder: (BuildContext context,
                                              double total, Widget? _) {
                                            return TextWidgets(
                                                text: total <= 0
                                                    ? '0.00'
                                                    : '$total',
                                                textcolor: primaryTextColor,
                                                textFontWeight: FontWeight.bold,
                                                textsize: 40);
                                          }),
                                      dividerBox,
                                      SizedBox(
                                        height: heigth / 6.2,
                                        child: HomeCard(
                                          cardColor: const Color.fromARGB(
                                              255, 195, 194, 194),
                                          cardElevation: 5,
                                          cardShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          cardChild: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.arrow_upward,
                                                          color: incomeColor,
                                                        ),
                                                        TextWidgets(
                                                          text: 'income',
                                                          textFontWeight:
                                                              FontWeight.bold,
                                                          textcolor:
                                                              primaryTextColor,
                                                        ),
                                                      ],
                                                    ),
                                                    ValueListenableBuilder(
                                                      valueListenable:
                                                          TransactionDB.instance
                                                              .incomeBalance,
                                                      builder:
                                                          (BuildContext context,
                                                              double income,
                                                              Widget? _) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 16.0),
                                                          child: TextWidgets(
                                                              text: '$income',
                                                              textcolor:
                                                                  primaryTextColor,
                                                              textFontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              textsize: 20),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const VerticalDivider(
                                                indent: 10,
                                                endIndent: 10,
                                                color: Colors.black,
                                                thickness: 1,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.arrow_downward,
                                                          color: expenseColor,
                                                        ),
                                                        TextWidgets(
                                                            textFontWeight:
                                                                FontWeight.bold,
                                                            text: 'expenses',
                                                            textcolor:
                                                                primaryTextColor),
                                                      ],
                                                    ),
                                                    ValueListenableBuilder(
                                                      valueListenable:
                                                          TransactionDB.instance
                                                              .expenseBalance,
                                                      builder:
                                                          (BuildContext context,
                                                              double expense,
                                                              Widget? _) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 16.0),
                                                          child: TextWidgets(
                                                              text: '$expense',
                                                              textcolor:
                                                                  primaryTextColor,
                                                              textFontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              textsize: 20),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidgets(
                              text: 'Recent Transations',
                              textcolor: primaryTextColor,
                              textsize: 15,
                              textFontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenTransactionTab()));
                              }),
                              child: const TextWidgets(
                                text: 'See all',
                                textcolor: Colors.blue,
                                textsize: 20,
                                textFontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ValueListenableBuilder(
                          valueListenable:
                              TransactionDB.instance.transactionListNotifierNew,
                          builder: (BuildContext context,
                              List<TransactionModel> transactionList,
                              Widget? _) {
                            return Expanded(
                                child: transactionList.isEmpty
                                    ? Center(
                                        child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TabbarViewScreen()));
                                        },
                                        child: const Text(
                                          'Please Add Transaction',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              color: primaryTextColor),
                                        ),
                                      ))
                                    : ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final data = transactionList[index];
                                          return HomeCard(
                                            cardColor: secondColor,
                                            cardChild: ListTile(
                                              leading: CircleAvatar(
                                                backgroundColor:
                                                    data.incomeOrExpense ==
                                                            'Income'
                                                        ? incomeColor
                                                        : expenseColor,
                                                child: Icon(
                                                  data.incomeOrExpense ==
                                                          'Income'
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
                                                text: DateFormat.MMMMd()
                                                    .format(data.selectedDate),
                                                textcolor: primaryTextColor,
                                              ),
                                              trailing: Column(
                                                children: [
                                                  TextWidgets(
                                                    text:
                                                        data.amount.toString(),
                                                    textcolor:
                                                        data.incomeOrExpense ==
                                                                'Income'
                                                            ? incomeColor
                                                            : expenseColor,
                                                    textFontWeight:
                                                        FontWeight.bold,
                                                    textsize: 20,
                                                  ),
                                                  TextWidgets(
                                                    text: data.note,
                                                    textcolor: primaryTextColor,
                                                    textFontWeight:
                                                        FontWeight.bold,
                                                    textsize: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: (transactionList.length <= 5)
                                            ? transactionList.length
                                            : 5,
                                      ));
                          }),
                    ]),
              );
            }),
      ),
    );
  }

  Future getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var nameObtain = prefs.getString(sharedName);
    setState(() {
      name = nameObtain;
    });
  }

  timeControl() {
    if (timeCheck.hour >= 0 && timeCheck.hour < 12) {
      return 'Good Morning,';
    } else if (timeCheck.hour >= 12 && timeCheck.hour < 16) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }
}
