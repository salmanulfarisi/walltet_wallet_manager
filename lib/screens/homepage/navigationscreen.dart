// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/screens/homepage/home_widget/catagorycontainer.dart';
import 'package:walletx/screens/homepage/piechart/overviewscreen.dart';
import 'package:walletx/screens/homepage/tabbarview.dart';
import 'package:walletx/screens/homepage/screenhome.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({Key? key}) : super(key: key);

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  int _currentIndex = 0;
  final newPages = [
    const ScreenHome(),
    const ScreenOverview(),
  ];

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUi();
    return Scaffold(
      body: newPages[_currentIndex],
      floatingActionButton: ValueListenableBuilder(
          valueListenable: categoryNotifier,
          builder: (BuildContext context, String newvalue, Widget? _) {
            return FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 190, 180, 180),
              elevation: 5,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TabbarViewScreen()));
                categoryNotifier.value = 'Category';
                categoryNotifier.notifyListeners();
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline), label: 'Overview'),
        ],
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
