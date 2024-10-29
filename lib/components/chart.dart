import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {

  final List<Transaction>recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (Index) {
      return {'day': 'T', 'valor': 9.99};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
