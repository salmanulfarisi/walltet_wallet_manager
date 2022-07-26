// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/global_things/text.dart';
import 'package:walletx/screens/homepage/home_widget/catagorycontainer.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/incomecategory.dart';

class ExpenseCatagory extends StatelessWidget {
  const ExpenseCatagory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text('Category'),
          backgroundColor: appBarColor,
          leading: IconButton(
            color: primaryTextColor,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                  onTap: (() {
                    categoryNotifier.value =
                        expensecategoryList[index]['category'];
                    categoryNotifier.notifyListeners();
                    Navigator.of(context).pop();
                    categoryNameValue = expensecategoryList[index]['category'];
                  }),
                  leading: CircleAvatar(
                    backgroundColor:
                        expensecategoryList[index][Color] ?? Colors.red,
                    child: Icon(
                        expensecategoryList[index][Icon] ?? Icons.attach_money),
                  ),
                  title: TextWidgets(
                      text: expensecategoryList[index]['category'] ?? '',
                      textcolor: primaryTextColor));
            },
            separatorBuilder: (context, index) {
              return myDivider;
            },
            itemCount: expensecategoryList.length));
  }
}
