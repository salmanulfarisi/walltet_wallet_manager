import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 43, 43, 43);
const secondColor = Colors.blueGrey;
const thrdColor = Color.fromARGB(255, 142, 125, 125);
const appBarColor = Color.fromARGB(255, 186, 184, 184);
const incomeColor = Colors.green;
const expenseColor = Colors.red;
const primaryTextColor = Colors.white;
const primaryIconColor = Colors.white;
const secondaryIconColor = Colors.black;
const calcbuttonColors = Colors.grey;
const calcbuttonTextColor = Colors.black;
const calcoperatorColor = Color.fromARGB(255, 120, 119, 119);
const secondarybuttonColor = Color.fromARGB(255, 142, 125, 125);
const iconColor = Colors.white;
const dividerColor = Color.fromARGB(255, 215, 213, 213);

const myDivider = Divider(
  indent: 10,
  endIndent: 10,
  color: dividerColor,
  thickness: 1,
);

final List<Map<dynamic, dynamic>> incomecategoryList = [
  {'category': 'Salary', Icon: Icons.attach_money, Color: Colors.red},
  {'category': 'Bonus', Icon: Icons.money, Color: Colors.green},
  {'category': 'Deposits', Icon: Icons.balance, Color: Colors.amber},
  {'category': 'Commission', Icon: Icons.business, Color: Colors.indigoAccent},
];

final List<Map<dynamic, dynamic>> expensecategoryList = [
  {'category': 'Bills', Icon: Icons.list_alt_rounded, Color: Colors.red},
  {'category': 'Shopping', Icon: Icons.shopping_bag, Color: Colors.green},
  {'category': 'Food&Drinks', Icon: Icons.food_bank, Color: Colors.amber},
  {'category': 'Entertinment', Icon: Icons.shop, Color: Colors.blue},
  {'category': 'Health', Icon: Icons.local_hospital, Color: Colors.indigo},
  {'category': 'Transport', Icon: Icons.business, Color: Colors.yellow},
  {'category': 'Home', Icon: Icons.home, Color: Colors.indigo},
];

final today = DateTime.now();
final week = today.subtract(const Duration(days: 7));
final yesterday = DateTime.now().subtract(const Duration(days: 1));
final monthly = DateTime.now().subtract(const Duration(days: 30));
