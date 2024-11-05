import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (Index) {
      final weeday = DateTime.now().subtract(Duration(days: Index));

      double totalSoma = 0.0;
      
      for(var i = 0; i < recentTransactions.length; i++ ) {
        bool sameDay = recentTransactions[i].date.day == weeday.day;
        bool sameMonth = recentTransactions[i].date.month == weeday.month;
        bool sameYear = recentTransactions[i].date.year == weeday.year;

        if (sameDay && sameMonth && sameYear) {
          totalSoma += recentTransactions[i].value;
        }
      } 
      print(DateFormat.E().format(weeday)[0]);
      print(totalSoma);
      return {
        'day': DateFormat.E().format(weeday)[0],
        'valor': totalSoma,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
