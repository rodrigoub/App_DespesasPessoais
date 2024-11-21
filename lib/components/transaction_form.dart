import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) Submit;

  TransactionForm(this.Submit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _tittleControler = TextEditingController();
  final _valueControler = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final tittle = _tittleControler.text;
    final value = double.tryParse(_valueControler.text) ?? 0.0;

    if (tittle.isEmpty || value <= 0) {
      return;
    }

    widget.Submit(tittle, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          TextField(
            controller: _tittleControler,
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Título',
            ),
          ),
          TextField(
              controller: _valueControler,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              )),
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Data Selecionada:  ${_selectedDate.toString().split(' ')[0]}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePicker),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Theme.of(context).secondaryHeaderColor,
                  ),
                  child: Text(
                    'Nova Transação',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
