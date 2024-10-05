import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tittleControler = TextEditingController();
    final valueControler = TextEditingController();

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          TextField(
            controller: tittleControler,
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
              controller: valueControler,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            child: TextButton(
              onPressed: () {
                print(tittleControler.text);
                print(valueControler.text);
              },
              child: Text(
                'Nova Transação',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
