import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _transaction = [
    Transaction(
        id: 't1',
        title: 'novo tênis de corrida',
        value: 310.90,
        date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Compra de café',
      value: 15.0,
      date: DateTime(2024, 9, 24),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Despesas Pessoais'),
          ),
          backgroundColor: const Color.fromARGB(255, 154, 14, 179),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Column(children: <Widget>[
              ..._transaction.map((tr) {
                return Card(
                  child: Text(tr.title),
                );
              })
            ]
            )
          ],
        )
     );
  }
}
