// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/screens/homepage/navigationscreen.dart';
import 'package:walletx/screens/homepage/home_widget/catagorycontainer.dart';
import 'transaction/all_transaction/incomeexpansepage.dart';

class TabbarViewScreen extends StatefulWidget {
  const TabbarViewScreen({Key? key}) : super(key: key);

  @override
  State<TabbarViewScreen> createState() => _TabbarViewScreenState();
}

String? incomeOrExpenseValue;

class _TabbarViewScreenState extends State<TabbarViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Color tabColor = secondColor;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    incomeOrExpenseValue = 'Income';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 186, 184, 184),
        leading: IconButton(
          color: primaryTextColor,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const ScreenNavigation()),
                (route) => false);
            categoryNotifier.value = 'Category';
          },
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: Column(children: [
        Container(
          height: height / 15,
          color: primaryColor,
          child: TabBar(
            controller: _tabController,
            labelColor: primaryTextColor,
            unselectedLabelColor: calcoperatorColor,
            indicator: BoxDecoration(
              color: tabColor,
            ),
            tabs: const [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Income',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Expense',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                _tabController.index == 0
                    ? tabColor = secondColor
                    : tabColor = secondarybuttonColor;
              });
              categoryNotifier.value = 'Category';
              categoryNotifier.notifyListeners();
              _tabController.index == 0
                  ? incomeOrExpenseValue = 'Income'
                  : incomeOrExpenseValue = 'Expense';
              categoryNotifier.value = 'Category';
              categoryNotifier.notifyListeners();
            },
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              IncomeExpensePage(
                icon: icon1(),
                color: color1,
                index: 0,
              ),
              IncomeExpensePage(
                icon: icon2(),
                color: color2,
                index: 1,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget icon1() {
    return const Icon(Icons.add_rounded, size: 80, color: primaryIconColor);
  }

  Widget icon2() {
    return const Icon(Icons.remove_outlined, size: 80, color: primaryIconColor);
  }

  Color color1 = secondColor;
  Color color2 = thrdColor;
}
