import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;

 const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);


  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  static const colors = [
    Colors.red,
    Colors.purple, 
    Colors.blue,
    Colors.black
  ];

Color?_backgroundColor;
@override
  void initState () {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.value}',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error),
                onPressed: () {
                  widget.onRemove(widget.tr.id);
                },
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () {
                  widget.onRemove(widget.tr.id);
                },
              ),
      ),
    );
  }
}
