import 'package:hive_flutter/adapters.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String incomeOrExpense;

  @HiveField(3)
  DateTime selectedDate;

  @HiveField(4)
  String categoryName;

  @HiveField(5)
  String note;

  TransactionModel({
    required this.amount,
    required this.incomeOrExpense,
    required this.selectedDate,
    required this.categoryName,
    required this.note,
    this.id,
  });
}
