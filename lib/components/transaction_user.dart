import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transaction = [
    Transaction(
        id: 't1',
        title: 'Novo tênis de corrida',
        value: 310.90,
        date: DateTime.now()),
    Transaction(
      id: 't20',
      title: 'Compra #02',
      value: 15.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Compra #03',
      value: 15.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Compra #04',
      value: 15.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Compra #05',
      value: 15.0,
      date: DateTime.now(),
    )
  ];
  _addNewTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
     title: title,
      value: value,
       date: DateTime.now());
       setState(() {
         _transaction.add(newTransaction);
       });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addNewTransaction),
        TransactionList(_transaction),
      ],
    );
  }
}
