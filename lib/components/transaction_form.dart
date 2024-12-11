import 'package:flutter/material.dart';
import 'adaptative_widgets/adaptative_button.dart';
import 'adaptative_widgets/adaptative_textfield.dart';
import 'adaptative_widgets/adaptative_date_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(children: [
              AdaptativeTextfield(
                controller: _tittleControler,
                label: 'Título',
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextfield(
                controller: _valueControler,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                label: 'Valor (R\$)',
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                ondateChanged: (newData) {
                  setState(() {
                    _selectedDate = newData;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                      label: 'Nova Transação', onPressed: _submitForm),
                ],
              ),
            ])),
      ),
    );
  }
}
