import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (Index) {
      final weeday = DateTime.now().subtract(Duration(days: Index));

      double totalSoma = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weeday.day;
        bool sameMonth = recentTransactions[i].date.month == weeday.month;
        bool sameYear = recentTransactions[i].date.year == weeday.year;

        if (sameDay && sameMonth && sameYear) {
          totalSoma += recentTransactions[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weeday)[0],
        'valor': totalSoma,
      };
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (accum, itm) {
      return accum + (itm['valor'] as double);
    });
  }
  
  Widget build(BuildContext context) {
  return Card(
    elevation: 7,
    margin: EdgeInsets.all(20),
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((trt) {
          return Expanded(
            child: ChartBar(
              label: trt['day'] as String, 
              value: trt['valor'] as double, 
              percentage: (trt['valor'] as double) / _weekTotalValue,
            ),
          );
        }).toList(),
      ),
    ),
  );
}
}
