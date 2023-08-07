import 'dart:math';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'components/transaction_list.dart';

main() => runApp(
      DevicePreview(
        builder: (_) {
          return ExpensesApp();
        },
      ),
    );

class ExpensesApp extends StatelessWidget {
  ExpensesApp({super.key});
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: theme.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            labelLarge: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 'id1',
        title: 'New shoes',
        value: 250,
        date: DateTime.now().subtract(const Duration(days: 3))),
    Transaction(
        id: 'id2',
        title: 'Lunch #1',
        value: 100,
        date: DateTime.now().subtract(const Duration(days: 4))),
  ];

  List<Transaction> get _recentsTransactions {
    return _transactions
        .where((transaction) => transaction.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date);

    setState(() {
      _transactions.add(transaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => TransactionForm(onSubmit: _addTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            child: Chart(recentsTransactions: _recentsTransactions),
          ),
          TransactionList(
            transactions: _transactions,
            onDeleteTransaction: _deleteTransaction,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openTransactionFormModal(context),
          child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
