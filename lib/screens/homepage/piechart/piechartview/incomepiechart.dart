import 'package:flutter/material.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/screens/homepage/piechart/piechart_widgets/chart_logic.dart';
import 'package:walletx/screens/homepage/piechart/piechart_widgets/sfcircularchart.dart';

class IncomePieChart extends StatefulWidget {
  const IncomePieChart({
    Key? key,
  }) : super(key: key);

  @override
  State<IncomePieChart> createState() => _IncomePieChartState();
}

class _IncomePieChartState extends State<IncomePieChart> {
  List<ChartData> chartData =
      chartLogic(TransactionDB.instance.incomeTransactionListNotifierNew.value);
  final List<ChartData> todayChartData =
      chartLogic(TransactionDB.instance.todayIncomeTransactionList.value);
  final List<ChartData> yesterdayChartData =
      chartLogic(TransactionDB.instance.yesterdayIncomeTransactionList.value);
  final List<ChartData> monthChartData =
      chartLogic(TransactionDB.instance.monthlyIncomeTransactionList.value);
  String dropDownVlaue = 'Select Period';

  var items = [
    'All Transaction',
    'Today',
    'Yesterday',
    'Last 30 Days',
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: width / 1.3,
            child: DropdownButtonFormField(
                hint: Text(
                  dropDownVlaue,
                  style: const TextStyle(
                      color: primaryTextColor, fontWeight: FontWeight.bold),
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: secondColor, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: secondColor, width: 2),
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
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownVlaue = newValue!;
                  });
                }),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(10),
          ),
          Expanded(child: PieChart(chartData: chartData2())),
        ],
      ),
    );
  }

  List<ChartData> chartData2() {
    if (dropDownVlaue == 'All Transaction') {
      return chartData;
    } else if (dropDownVlaue == 'Today') {
      return todayChartData;
    } else if (dropDownVlaue == 'Yesterday') {
      return yesterdayChartData;
    } else if (dropDownVlaue == 'Last 30 Days') {
      return monthChartData;
    } else {
      return chartData;
    }
  }
}
