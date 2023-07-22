import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:intl/intl.dart';

main() => runApp(
      DevicePreview(
        builder: (_) {
          return const ExpensesApp();
        },
      ),
    );

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transactions = [
    Transaction(
        id: 'id1', title: 'Novo tênis', value: 250, date: DateTime.now()),
    Transaction(id: 'id2', title: 'Almoço', value: 100, date: DateTime.now())
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          child: Card(
            color: Colors.blueGrey,
            elevation: 5,
            child: Text('Gráfico'),
          ),
        ),
        Column(
          children: _transactions
              .map((tr) => Card(
                    child: Row(children: [
                      Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.purple)),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ]),
                  ))
              .toList(),
        ),
        Card(
          elevation: 5,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: 'Título'),
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Valor R\$'),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(foregroundColor: Colors.purple),
                    child: const Text('Nova transação'),
                  )
                ],
              )),
        )
      ]),
    );
  }
}
