import 'package:flutter/material.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';
import 'package:walletx/global_things/globelresources.dart';
import 'package:walletx/global_things/text.dart';
import 'package:walletx/models/transaction_model.dart';
import 'package:walletx/screens/homepage/navigationscreen.dart';
import 'package:walletx/screens/homepage/tabbarview.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/expencecatagory.dart';
import 'package:walletx/screens/homepage/transaction/all_transaction/transaction_widget/incomecategory.dart';
import '../../home_widget/catagorycontainer.dart';

class IncomeExpensePage extends StatefulWidget {
  final Widget icon;
  final Color? color;
  final int index;
  const IncomeExpensePage({
    Key? key,
    required this.icon,
    this.color,
    required this.index,
  }) : super(key: key);

  @override
  State<IncomeExpensePage> createState() => _IncomeExpensePageState();
}

class _IncomeExpensePageState extends State<IncomeExpensePage> {
  String? incomeOrExpense;
  DateTime? _selectedDate;
  final noteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshUi();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            color: widget.color,
                            width: width / 2,
                            height: height / 3.10,
                            child: widget.icon),
                        Container(
                          color: widget.color,
                          alignment: Alignment.centerRight,
                          width: width / 2,
                          height: height / 3.10,
                          child: TextWidgets(
                            text: text,
                            textcolor: primaryTextColor,
                            textFontWeight: FontWeight.bold,
                            textsize: 50,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height / 35),
                      alignment: Alignment.center,
                      width: width,
                      height: height / 19,
                      child: TextButton.icon(
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
                              ? const Text(
                                  'Select Date',
                                  style: TextStyle(color: primaryTextColor),
                                )
                              : Text(
                                  '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
                                  style:
                                      const TextStyle(color: primaryTextColor),
                                )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width / 30),
                      margin: EdgeInsets.only(top: height / 4.7),
                      child: TextFormField(
                        controller: noteTextController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Note',
                            filled: true,
                            fillColor: Colors.grey[200],
                            counterText: ''),
                        maxLength: 10,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    widget.index == 0
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const IncomeCategory(),
                            ),
                          )
                        : Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ExpenseCatagory(),
                            ),
                          );
                  },
                  child: CatagoryContainer(
                    containerColor: primaryColor,
                    containerHeight: height / 9.5,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: height / 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculateBtton(
                        context,
                        'AC',
                        calcoperatorColor,
                        calcbuttonTextColor,
                      ),
                      calculateBtton(context, '+/-', calcoperatorColor,
                          calcbuttonTextColor),
                      calculateBtton(
                          context, '%', calcoperatorColor, calcbuttonTextColor),
                      calculateBtton(
                          context, '÷', calcoperatorColor, calcbuttonTextColor),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height / 12,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calculateBtton(context, '7', calcbuttonColors,
                            calcbuttonTextColor),
                        calculateBtton(context, '8', calcbuttonColors,
                            calcbuttonTextColor),
                        calculateBtton(context, '9', calcbuttonColors,
                            calcbuttonTextColor),
                        calculateBtton(context, 'x', calcoperatorColor,
                            calcbuttonTextColor),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height / 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculateBtton(
                          context, '4', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '5', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '6', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '-', calcoperatorColor, calcbuttonTextColor),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height / 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculateBtton(
                          context, '1', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '2', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '3', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '+', calcoperatorColor, calcbuttonTextColor),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height / 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculateBtton(
                          context, '0', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '.', calcbuttonColors, calcbuttonTextColor),
                      calculateBtton(
                          context, '=', calcbuttonColors, calcbuttonTextColor),
                      ElevatedButton(
                        onPressed: () {
                          addTransactionButton();
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                              Size(width / 4, height / 5)),
                          backgroundColor:
                              MaterialStateProperty.all(secondarybuttonColor),
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(
                              fontSize: 20, color: calcbuttonTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget calculateBtton(
    context,
    String btntext,
    Color btncolor,
    Color btntextcolor,
  ) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        calculation(btntext);
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(width / 4, height / 5)),
        backgroundColor: MaterialStateProperty.all(btncolor),
      ),
      child: Text(
        btntext,
        style: TextStyle(fontSize: 30, color: btntextcolor),
      ),
    );
  }

  //Calculator logic
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (btnText == 'Add') {
      text = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

  Future<void> addTransactionButton() async {
    final amount = double.parse(text);
    final incomeOrExpense = incomeOrExpenseValue.toString();
    final selectedDate = _selectedDate;
    final categoryName = categoryNameValue;
    final note = noteTextController.text;
    if (amount == 0 || selectedDate == null || categoryName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Please fill all the fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else {
      final transaction = TransactionModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        amount: amount,
        incomeOrExpense: incomeOrExpense,
        selectedDate: selectedDate,
        categoryName: categoryName,
        note: note,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text(
            'Successfully added',
            style: TextStyle(color: primaryTextColor),
          ),
          backgroundColor: appBarColor,
          behavior: SnackBarBehavior.floating,
        ),
      );

      TransactionDB.instance.addTransaction(transaction);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ScreenNavigation()),
          (route) => false);
      TransactionDB.instance.refreshUi();
    }
  }
}
