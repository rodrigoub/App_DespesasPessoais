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
      id: 't2',
      title: 'Compra de café',
      value: 15.0,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transaction),
        TransactionForm(),
      ],
    );
  }
}
