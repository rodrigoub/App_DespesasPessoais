import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) Submit;

  TransactionForm(this.Submit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  
  final tittleControler = TextEditingController();
  final valueControler = TextEditingController();

  _submitForm() {
    final tittle = tittleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (tittle.isEmpty || value <= 0) {
      return;
    }

    widget.Submit(tittle, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          TextField(
            controller: tittleControler,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
              controller: valueControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              )),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7),
            child: TextButton(
              onPressed: _submitForm,
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
