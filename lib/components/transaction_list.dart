import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction.item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, Constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nenhuma Transação Cadastrada.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: Constraints.maxHeight * 0.50,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          })
        :
        // ListView(
        //     children: transactions.map((tr) {
        //     return TransactionItem(
        //       key: ValueKey(tr.id),
        //       tr: tr,
        //       onRemove: onRemove,
        //     );
        //   }).toList());
    ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return TransactionItem(
            key: GlobalObjectKey(tr),
            tr: tr,
            onRemove: onRemove,
          );
        },
      );
  }
}
