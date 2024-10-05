import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ...transactions.map((tr) {
        return Card(
            child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(
                  DateFormat('d MMM y hh:mm').format(tr.date),
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            )
          ],
        ));
      }),
    ]);
  }
}
