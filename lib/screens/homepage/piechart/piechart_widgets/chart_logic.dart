import 'package:walletx/models/transaction_model.dart';

class ChartData {
  String? categoreis;
  double? amount;

  ChartData({
    this.categoreis,
    this.amount,
  });
}

chartLogic(List<TransactionModel> transactionList) {
  double value;
  String category;
  List visited = [];
  List<ChartData> newChartData = [];

  for (var i = 0; i < transactionList.length; i++) {
    visited.add(0);
  }

  for (var i = 0; i < transactionList.length; i++) {
    value = transactionList[i].amount;
    category = transactionList[i].categoryName;
    for (var j = i + 1; j < transactionList.length; j++) {
      if (transactionList[i].categoryName == transactionList[j].categoryName) {
        value += transactionList[j].amount;
        visited[j] = -1;
      }
    }
    if (visited[i] != -1) {
      newChartData.add(ChartData(categoreis: category, amount: value));
    }
  }
  return newChartData;
}
