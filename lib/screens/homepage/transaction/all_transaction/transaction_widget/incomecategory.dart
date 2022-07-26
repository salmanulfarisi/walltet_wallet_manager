// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/global_things/text.dart';
import 'package:walletx/screens/homepage/home_widget/catagorycontainer.dart';

String? categoryNameValue;

class IncomeCategory extends StatelessWidget {
  const IncomeCategory({Key? key}) : super(key: key);

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
                        incomecategoryList[index]['category'];
                    categoryNotifier.notifyListeners();
                    Navigator.of(context).pop();
                    categoryNameValue = incomecategoryList[index]['category'];
                  }),
                  leading: CircleAvatar(
                    backgroundColor:
                        incomecategoryList[index][Color] ?? Colors.red,
                    child: Icon(
                        incomecategoryList[index][Icon] ?? Icons.attach_money),
                  ),
                  title: TextWidgets(
                      text: incomecategoryList[index]['category'] ?? '',
                      textcolor: primaryTextColor));
            },
            separatorBuilder: (context, index) {
              return myDivider;
            },
            itemCount: incomecategoryList.length));
  }
}
