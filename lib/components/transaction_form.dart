import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final tittleControler = TextEditingController();
  final valueControler = TextEditingController();

  final void Function(String, double) Submit;

  TransactionForm(this.Submit);

  @override
  Widget build(BuildContext context) {
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
                final tittle = tittleControler.text;
                final value = double.tryParse(valueControler.text) ?? 0.0;
                Submit(tittle, value);
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
