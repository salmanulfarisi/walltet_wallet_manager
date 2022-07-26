import 'package:flutter/material.dart';
import 'package:walletx/db_functions/transaction_dbfunction.dart';

showDeleteDialoge(BuildContext context, {id}) {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text(
            'Delete',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text('Are you sure to Delete?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            TextButton(
                onPressed: () {
                  TransactionDB.instance.deleteTransaction(id);
                  Navigator.pop(context);
                },
                child: const Text('Yes')),
          ],
        );
      });
}
