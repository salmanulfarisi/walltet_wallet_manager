import 'package:flutter/material.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/home_widget/catagorycontainer.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/expencecatagory.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/incomecategory.dart';

class ScreenUpdate extends StatefulWidget {
  final TransactionModel data;
  final int? index;
  const ScreenUpdate({Key? key, required this.data, this.index})
      : super(key: key);

  @override
  State<ScreenUpdate> createState() => _ScreenUpdateState();
}

class _ScreenUpdateState extends State<ScreenUpdate> {
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  String? selectCategory;
  DateTime? _selectedDate;
  String? newvalueCheck;

  @override
  void initState() {
    amountController.text = widget.data.amount.toString();
    noteController.text = widget.data.note.toString();
    _selectedDate = widget.data.selectedDate;
    selectCategory = widget.data.categoryName.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUi();
    const mysizedBox = SizedBox(
      height: 10,
    );
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              TransactionDB.instance.transactionListNotifierNew.value.clear();
              // transactionListNotifierNew.value.clear();
              Navigator.pop(context);
              categoryNotifier.value = 'category';
            },
            icon: const Icon(
              Icons.arrow_back,
              color: primaryIconColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset('assets/lottie/images/image.png'),
            Expanded(
                child: Center(
              child: ListView(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        final selectDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 30)),
                            lastDate: DateTime.now());
                        if (selectDate == null) {
                          return;
                        } else {
                          setState(() {
                            _selectedDate = selectDate;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: iconColor,
                      ),
                      label: _selectedDate == null
                          ? Text(
                              '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
                              style: const TextStyle(color: primaryTextColor),
                            )
                          : Text(
                              '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
                              style: const TextStyle(color: primaryTextColor),
                            )),
                  mysizedBox,
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: amountController.text.isNotEmpty
                            ? amountController.text
                            : '0',
                        filled: true,
                        fillColor: Colors.grey[200]),
                  ),
                  mysizedBox,
                  GestureDetector(
                    onTap: () {
                      widget.data.incomeOrExpense == 'Income'
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const IncomeCategory()))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ExpenseCatagory()));
                    },
                    child: ValueListenableBuilder(
                        valueListenable: categoryNotifier,
                        builder:
                            (BuildContext context, String newvalue, Widget? _) {
                          newvalueCheck = newvalue;
                          return Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 50,
                            color: Colors.grey,
                            child: Text(
                              newvalue == 'category'
                                  ? selectCategory!
                                  : newvalue,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: primaryTextColor),
                            ),
                          );
                        }),
                  ),
                  mysizedBox,
                  TextField(
                    controller: noteController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: noteController.text.isEmpty
                            ? 'Note'
                            : noteController.text,
                        filled: true,
                        fillColor: Colors.grey[200]),
                    maxLength: 10,
                  ),
                  mysizedBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50)),
                          onPressed: () {
                            updateTransaction();
                          },
                          child: const Text('Edit')),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  updateTransaction() async {
    if (amountController.text.isEmpty ||
        _selectedDate == null ||
        newvalueCheck == 'category') {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text('Please Fill All The Fields'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Ok'),
                  )
                ],
              ));
    } else {
      widget.data.amount = double.parse(amountController.text);
      widget.data.note = noteController.text;
      widget.data.categoryName = newvalueCheck.toString();
      widget.data.selectedDate = _selectedDate!;
      widget.data.save();
      categoryNotifier.value;
      TransactionDB.instance.getAllTransactions();
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      TransactionDB.instance.transactionListNotifierNew.notifyListeners();
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully Updated'),
        duration: Duration(seconds: 1),
      ));
    }
  }
}
