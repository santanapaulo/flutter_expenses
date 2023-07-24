import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 'id1', title: 'Novo tênis', value: 250, date: DateTime.now()),
    Transaction(id: 'id2', title: 'Almoço', value: 100, date: DateTime.now())
  ];

  _addTransaction(String title, double value) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transactions),
        TransactionForm(
          onSubmit: _addTransaction,
        )
      ],
    );
  }
}
