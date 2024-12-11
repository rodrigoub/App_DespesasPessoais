import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? ondateChanged;

  AdaptativeDatePicker({this.selectedDate, this.ondateChanged});

  @override
  Widget build(BuildContext context) {
    _showDatePicker(BuildContext) {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        ondateChanged!(pickedDate);
      });
    }

    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: ondateChanged ?? (_) {},
            ),
          )
        : Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Data Selecionada:  ${selectedDate.toString().split(' ')[0]}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => _showDatePicker(context),
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    )),
              ],
            ),
          );
  }
}
