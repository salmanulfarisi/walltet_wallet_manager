import 'package:flutter/material.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/screens/homepage/piechart/piechartview/allpiechart.dart';
import 'package:walletx/screens/homepage/piechart/piechartview/expensepiechart.dart';
import 'package:walletx/screens/homepage/piechart/piechartview/incomepiechart.dart';

class ScreenOverview extends StatelessWidget {
  const ScreenOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
                // actions: [
                //   IconButton(
                //     icon: const Icon(Icons.search, color: primaryIconColor),
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => const ScreenSearch()));
                //     },
                //   ),
                // ],
                ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                          text: 'All',
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
                      AllPieChart(),
                      IncomePieChart(),
                      ExpensePieChart(),
                    ],
                  ))
                ],
              ),
            )));
  }
}
