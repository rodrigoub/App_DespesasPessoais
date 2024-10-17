import 'package:flutter/material.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';
import '../models/transaction.dart';
import 'dart:math';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  abrirtransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: ()=> abrirtransactionFormModal(context),
            icon: Icon(Icons.add_to_photos_sharp),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 154, 14, 179),
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          TransactionList(_transaction),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> abrirtransactionFormModal(context),
        backgroundColor: const Color.fromARGB(255, 154, 14, 179),
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
