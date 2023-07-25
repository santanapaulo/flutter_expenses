import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm({super.key, required this.onSubmit});

  _onSubmit() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => _onSubmit(),
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: valueController,
                onSubmitted: (_) => _onSubmit(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Valor R\$'),
              ),
              TextButton(
                onPressed: _onSubmit,
                style: TextButton.styleFrom(foregroundColor: Colors.purple),
                child: const Text('Nova transação'),
              )
            ],
          )),
    );
  }
}
