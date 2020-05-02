import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final void Function(String, double) onSubmit;

  TransactionForm({
    @required this.onSubmit,
  });

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;
    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              onSubmitted: (_) => _submitForm(),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  color: Colors.purple,
                  textColor: Colors.white,
                  child: Text('Nova Transação'),
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
