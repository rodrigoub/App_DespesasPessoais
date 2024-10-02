import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class MyHomePage extends StatelessWidget {
  final _transaction = [
    Transaction(
        id: 't1',
        title: 'Novo tênis de corrida',
        value: 310.90,
        date: DateTime.now()
    ),
    Transaction(
      id: 't2',
      title: 'Compra de café',
      value: 15.0,
      date: DateTime.now(),
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
                    child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text('R\$ ' + tr.value.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(
                          DateFormat('d MMM y hh:mm').format(tr.date),
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              })
            ])
          ],
        ));
  }
}
